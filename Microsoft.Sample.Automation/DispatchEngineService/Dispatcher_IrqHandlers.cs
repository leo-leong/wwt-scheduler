using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    public partial class Dispatcher
    {
        /// <summary>
        /// Generates high low DPC to trigger runing of a dispatch
        /// This is called after polling
        /// </summary>
        /// <param name="IRQ"></param>
        internal static void MarkDispatchReady(IrqHandle IRQ)
        {
            DpcHandle dpchandle;

            dpchandle = new DpcHandle()
            {
                ScheduleID = IRQ.ScheduleID,
                DispatchID = IRQ.DispatchID,
                Importance = Importance.Low,    // this should be low to run dispatches
                TimeStamp = DateTime.UtcNow
            };

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                dec.DpcQueue.Add(dpchandle);

                // remove current interrupt
                dec.IrqQueue.Attach(IRQ);
                dec.IrqQueue.Remove(IRQ);

                dec.SaveChanges();
            }
        }

        /// <summary>
        /// Swap out the existing dispatch in scheduling pool with the dispatch set for callback
        /// This is called when a tool calls back the engine to run at a later time
        /// </summary>
        /// <param name="IRQ"></param>
        internal static void RelocateCallbackDispatch(IrqHandle IRQ)
        {
            SchedulingHandle schedulinghandle;
            Dispatch olddispatch;
            Dispatch currentdispatch;
            Int64 scheduleid = IRQ.ScheduleID;
            Int64? olddispatchid = IRQ.DispatchID;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                // reset the retry & error fields of the old dispatch 
                olddispatch = dec.Dispatches.Single(d => d.Id == olddispatchid);
                olddispatch.RetryCount = 0;
                olddispatch.ErrorCode = null;
                olddispatch.ErrorMsg = null;
                olddispatch.LastModifiedDateTimeUtc = currentdatetimeutc;
                olddispatch.StatusID = DispatchStatus.Pending;

                if (dec.SchedulingPool.Any(sh => sh.ScheduleID == scheduleid))
                {
                    // double check to make sure current DispatchID in scheduling pool 
                    // is NOT the same as the callback DispatchID
                    if (dec.SchedulingPool.Any(sh => sh.DispatchID != olddispatch.Id))
                    {
                        schedulinghandle = dec.SchedulingPool.Single(dh => dh.ScheduleID == scheduleid);

                        // set the current dispatch to cancelled
                        currentdispatch = dec.Dispatches.Single(d => d.Id == schedulinghandle.DispatchID);
                        currentdispatch.LastModifiedDateTimeUtc = currentdatetimeutc;
                        currentdispatch.StatusID = DispatchStatus.Cancelled;

                        // swap the current dispatch out with the old one
                        schedulinghandle.DispatchID = (long)olddispatchid;
                    }
                }
                else
                {
                    schedulinghandle = new SchedulingHandle()
                    {
                        ScheduleID = scheduleid,
                        DispatchID = (long)olddispatchid
                    };
                    dec.SchedulingPool.Add(schedulinghandle);
                }

                // remove current interrupt
                dec.IrqQueue.Attach(IRQ);
                dec.IrqQueue.Remove(IRQ);

                dec.SaveChanges();
            }
        }

        /// <summary>
        /// Generates high DPC to trigger planning of dispatch for a given schedule
        /// Also removes handle from pool if schedule is expired. 
        /// This is called when a schedule changed or when a dispatch has completed, failed & cancelled.
        /// </summary>
        /// <param name="Interrupt"></param>
        internal static void SweepSchedulingPool(IrqHandle IRQ)
        {
            SchedulingHandle schedulinghandle;
            DpcHandle dpchandle;
            Schedule schedule;
            Dispatch dispatch;
            Int64 scheduleid = IRQ.ScheduleID;
            Int64? dispatchid = IRQ.DispatchID;
            bool indpcqueue;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                // check if there is already a high DPC for the schedule in queue
                // we don't sweep the pool if there is outstanding work to be done for the schedule
                indpcqueue = dec.DpcQueue.Any(dpc => dpc.ScheduleID == scheduleid && dpc.Importance == Importance.High);
                if (!indpcqueue)
                {
                    // check if dispatch is waiting on callback
                    dispatch = dec.Dispatches.Single(dh => dh.Id == dispatchid);
                    if (dispatch.StatusID != DispatchStatus.Callback)
                    {
                        schedule = dec.Schedules.Single(s => s.Id == scheduleid);

                        // check if schedule has been removed from pool
                        // this can happen when a dispatch is done after the schedule has been expired
                        if (dec.SchedulingPool.Any(sh => sh.ScheduleID == scheduleid))
                        {
                            schedulinghandle = dec.SchedulingPool.Single(sh => sh.ScheduleID == scheduleid);
                            if (schedule.EndDateTimeUtc > currentdatetimeutc)
                            {
                                dpchandle = new DpcHandle()
                                {
                                    ScheduleID = schedule.Id,
                                    DispatchID = schedulinghandle.DispatchID,
                                    Importance = Importance.High,
                                    TimeStamp = currentdatetimeutc
                                };
                                dec.DpcQueue.Add(dpchandle);
                            }
                            else
                            {
                                dec.SchedulingPool.Remove(schedulinghandle);
                            }
                        }
                    }
                }

                // remove current interrupt
                dec.IrqQueue.Attach(IRQ);
                dec.IrqQueue.Remove(IRQ);

                dec.SaveChanges();
            }
        }

        /// <summary>
        /// Generates high DPC for new schedule to create new dispatch
        /// This is called when a new schedule has been committed
        /// </summary>
        /// <param name="ScheduleIDs"></param>
        internal static void MarkNewSchedule(IrqHandle IRQ)
        {
            DpcHandle dpchandle;
            Schedule schedule;
            Int64 scheduleid = IRQ.ScheduleID;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                schedule = dec.Schedules.Single(s => s.Id == scheduleid);

                // we allow an exception to run once an expired adhoc schedule
                // current assumption is we rely on the scheduling commit method
                // to prevent same schedule from committed more than once
                if (schedule.EndDateTimeUtc > currentdatetimeutc || schedule.IsAdhoc)
                {
                    dpchandle = new DpcHandle()
                    {
                        ScheduleID = scheduleid,
                        Importance = Importance.High,
                        TimeStamp = currentdatetimeutc
                    };
                    dec.DpcQueue.Add(dpchandle);
                }

                // remove current interrupt
                dec.IrqQueue.Attach(IRQ);
                dec.IrqQueue.Remove(IRQ);

                dec.SaveChanges();
            }
        }

    }
}