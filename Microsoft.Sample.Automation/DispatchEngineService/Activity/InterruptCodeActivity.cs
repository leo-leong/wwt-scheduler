using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;
using System.Data.Entity.Infrastructure;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class InterruptCodeActivity : CodeActivity
    {

        protected override void Execute(CodeActivityContext context)
        {
            IEnumerable<IrqHandle> interrupts;
            IrqHandle currentIRQ = new IrqHandle();
            bool isdispatchirq = false;
            bool irqlocked = false;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                isdispatchirq = dec.IrqQueue.Any(i => i.Level == IRQL.Dispatch);

                if (isdispatchirq)
                    interrupts = dec.IrqQueue.Where(irq => irq.Level == IRQL.Dispatch).ToArray();
                else
                    interrupts = dec.IrqQueue.ToArray();

                foreach (var irqhandle in interrupts)
                {
                    irqhandle.TimeStamp = currentdatetimeutc;

                    try
                    {
                        dec.SaveChanges();
                        dec.Entry(irqhandle).Reload();
                        currentIRQ = irqhandle;
                        irqlocked = true;
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        // TODO: log exception & increment counter
                    }

                    if (irqlocked)
                        break;
                }
            }

            if (irqlocked)
            {
                if (isdispatchirq)
                {
                    Dispatch dispatch;
                    bool isdispatchcallback;
                    bool isdispatchready;

                    using (DispatchEngineContainer dec = new DispatchEngineContainer())
                    {
                        dispatch = dec.Dispatches.Single(d => d.Id == currentIRQ.DispatchID);

                        isdispatchcallback = DispatchStatus.Callback == dispatch.StatusID;

                        // we should check status pending to prevent completed/failed from running again
                        isdispatchready = currentdatetimeutc > dispatch.StartDateTimeUtc && DispatchStatus.Pending == dispatch.StatusID;
                    }

                    if (isdispatchcallback)
                    {
                        Dispatcher.RelocateCallbackDispatch(currentIRQ);
                    }
                    else if (isdispatchready)
                    {
                        Dispatcher.MarkDispatchReady(currentIRQ);
                    }
                    else
                    {
                        Dispatcher.SweepSchedulingPool(currentIRQ);
                    }
                }
                else
                {
                    Schedule schedule = null;
                    bool isscheduleadded;

                    using (DispatchEngineContainer dec = new DispatchEngineContainer())
                    {
                        try
                        {
                            schedule = dec.Schedules.Single(s => s.Id == currentIRQ.ScheduleID);
                        }
                        catch
                        {
                            // TODO: log exception & increment counter
                        }
                            
                        isscheduleadded = !dec.SchedulingPool.Any(s => s.ScheduleID == currentIRQ.ScheduleID);
                    }

                    if (schedule != null)
                    {
                        if (isscheduleadded)
                        {
                            Dispatcher.MarkNewSchedule(currentIRQ);
                        }
                        else
                        {
                            Dispatcher.SweepSchedulingPool(currentIRQ);
                        }
                    }
                    else
                    {
                        // bug fix to handle interrupts for schedules that has been deleted
                        using (DispatchEngineContainer dec = new DispatchEngineContainer())
                        {
                            // remove current interrupt
                            dec.IrqQueue.Attach(currentIRQ);
                            dec.IrqQueue.Remove(currentIRQ);
                            dec.SaveChanges();
                        }
                    }
                }
            }
        }
    }
}
