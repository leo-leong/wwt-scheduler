using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    public partial class Dispatcher
    {
        /// <summary>
        /// Create a new Dispatch and add to scheduling pool for new schedules. Otherwise swap existing dispatch out
        /// This is called after a schedule change or dispatch has completed
        /// </summary>
        /// <param name="ScheduleID"></param>
        internal static void PlanSchedulingPool(DpcHandle DPC)
        {
            SchedulingHandle schedulinghandle;
            Dispatch olddispatch;
            Dispatch newdispatch;
            Schedule schedule;
            Tool tool;
            CallbackDevice callbackdevice;
            bool inschedulingpool;
            DateTime nextdispatchdatetimeutc;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                schedule = dec.Schedules.Single(s => s.Id == DPC.ScheduleID);
                dec.Entry(schedule).Reference(r => r.Tool).Load();
                // current implementation only supports one tool per schedule
                tool = schedule.Tool;

                nextdispatchdatetimeutc = GetTargetDispatchDateTimeUtc(schedule);

                newdispatch = new Dispatch()
                {
                    CreatedDateTimeUtc = currentdatetimeutc,
                    LastModifiedDateTimeUtc = currentdatetimeutc,
                    StatusID = DispatchStatus.Pending,
                    RetryCount = 0,
                    ScheduleID = DPC.ScheduleID,
                    StartDateTimeUtc = nextdispatchdatetimeutc,
                    ToolID = schedule.Tool.Id
                };

                // new schedule will not have a dispatch in pool
                inschedulingpool = dec.SchedulingPool.Any(dh => dh.ScheduleID == DPC.ScheduleID);
                if (inschedulingpool)
                {
                    // check if dispatch is waiting for callback
                    // there should always be a dispatch in pool if this is not a new schedule
                    olddispatch = dec.Dispatches.Single(dh => dh.Id == DPC.DispatchID);
                    if (olddispatch.StatusID != DispatchStatus.Callback)
                    {
                        schedulinghandle = dec.SchedulingPool.Single(dh => dh.ScheduleID == DPC.ScheduleID);

                        // set old dispatch to cancel only if it is in pending status
                        if (olddispatch.StatusID == DispatchStatus.Pending)
                        {
                            olddispatch.StatusID = DispatchStatus.Cancelled;
                            olddispatch.LastModifiedDateTimeUtc = currentdatetimeutc;
                        }

                        // swap out old dispatch if schedule is dispatchable
                        if (schedule.EndDateTimeUtc > nextdispatchdatetimeutc)
                        {
                            dec.Dispatches.Add(newdispatch);
                            dec.SaveChanges();
                            dec.Entry(newdispatch).Reload();

                            schedulinghandle.DispatchID = newdispatch.Id;
                        }
                    }
                }
                else
                {
                    // this case it is a new schedule, we need to add to the schedule pool as well
                    dec.Dispatches.Add(newdispatch);                 
                    dec.SaveChanges();
                    dec.Entry(newdispatch).Reload();

                    // add devices associated to schedule to CallbackDevices table that is specifically maintained by engine
                    dec.Entry(schedule).Collection(c => c.Devices).Load();
                    if (schedule.Devices.Count > 0)
                    {
                        foreach (var device in schedule.Devices)
                        {
                            callbackdevice = new CallbackDevice()
                            {
                                DispatchID = newdispatch.Id,
                                DeviceID = device.Id
                            };
                            dec.CallbackDevices.Add(callbackdevice);
                        }
                    }

                    schedulinghandle = new SchedulingHandle()
                    {
                        ScheduleID = DPC.ScheduleID,
                        DispatchID = newdispatch.Id
                    };
                    dec.SchedulingPool.Add(schedulinghandle);
                }

                // remove current DPC
                dec.DpcQueue.Attach(DPC);
                dec.DpcQueue.Remove(DPC);

                dec.SaveChanges();
            }
        }

        /// <summary>
        /// Runs simplex/duplex tool and update dispatch status accordingly. Also generates IRQ to notify dispatch is done
        /// This is called when there are items in dispatchready pool
        /// </summary>
        /// <param name="DispatchID"></param>
        internal static void RunDispatch(DpcHandle DPC)
        {
            Schedule schedule;
            Dispatch dispatch;
            IrqHandle irqhandle;
            Tool tool;
            List<DeviceDTO> devices = new List<DeviceDTO>();
            Int64 scheduleid = DPC.ScheduleID;
            Int64? dispatchid = DPC.DispatchID;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                dispatch = dec.Dispatches.Single(d => d.Id == dispatchid);
                schedule = dec.Schedules.Single(s => s.Id == scheduleid);
                tool = dec.Tools.Single(t => t.Id == dispatch.ToolID);

                if (dec.CallbackDevices.Any(cd => cd.DispatchID == dispatchid))
                {
                    devices = (from d in dec.Devices
                               where (from cd in dec.CallbackDevices
                                      where cd.DispatchID == dispatchid
                                      select cd.DeviceID).Contains(d.Id)
                               select new DeviceDTO()
                               {
                                   Id = d.Id,
                                   Name = d.Name,
                                   IPAddress = d.IPAddress
                               }).ToList();
                }
            }

            // we check here to make sure schedule change or cancellation is honored
            // which would hvae set the dispatch to cancelled
            if (dispatch.StatusID != DispatchStatus.Cancelled)
                RunTool(ref dispatch, tool, devices);

            // prevent dispatch from further running if it has retried at least 5 times
            if (dispatch.RetryCount >= 5)
            {
                dispatch.StatusID = DispatchStatus.Failed;
            }

            // update the last modified of dispatch
            dispatch.LastModifiedDateTimeUtc = currentdatetimeutc;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                dec.Entry(dispatch).State = System.Data.EntityState.Modified;

                // generate an interrupt to notify completion
                if (dispatch.StatusID == DispatchStatus.Completed || dispatch.StatusID == DispatchStatus.Failed)
                {
                    irqhandle = new IrqHandle()
                    {
                        ScheduleID = dispatch.ScheduleID,
                        DispatchID = dispatch.Id,
                        Level = IRQL.Dispatch,
                        TimeStamp = currentdatetimeutc
                    };
                    dec.IrqQueue.Add(irqhandle);
                }

                // remove current DPC
                dec.DpcQueue.Attach(DPC);
                dec.DpcQueue.Remove(DPC);

                dec.SaveChanges();
            }
        }
    }
}