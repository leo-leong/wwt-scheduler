using System;
using System.Transactions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.ServiceModel.Channels;
using Microsoft.Sample.Automation.Scheduling;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    public partial class Dispatcher
    {
        /// <summary>
        /// Generates interrupt when dispatch is ready to run
        /// This is called within polling, interrupt & deferred procedure
        /// </summary>
        /// <returns></returns>
        internal static bool PollDispatchReady()
        {
            IrqHandle irqhandle;
            var currentdatetimeutc = DateTime.UtcNow;
            bool foundready = false;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                var dispatchready = from sh in dec.SchedulingPool
                                    join d in dec.Dispatches
                                    on sh.DispatchID equals d.Id
                                    where currentdatetimeutc > d.StartDateTimeUtc &&
                                    (d.StatusID == DispatchStatus.Pending)
                                    select sh;

                if (dispatchready.Count() > 0)
                {
                    foreach (var dr in dispatchready)
                    {
                        irqhandle = new IrqHandle()
                        {
                            ScheduleID = dr.ScheduleID,
                            DispatchID = dr.DispatchID,
                            Level = IRQL.Dispatch,
                            TimeStamp = currentdatetimeutc
                        };
                        dec.IrqQueue.Add(irqhandle);
                    }

                    dec.SaveChanges();
                    foundready = true;
                }
            }

            return foundready;
        }

        /// <summary>
        /// Generates an interrupt when schedule expired
        /// This is called within polling
        /// </summary>
        /// <returns></returns>
        internal static bool PollExpiredSchedule()
        {
            IrqHandle irqhandle;
            var currentdatetimeutc = DateTime.UtcNow;
            bool foundexpired = false;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                // look for expired schedules
                var schedulesexpired = from sh in dec.SchedulingPool
                                       join s in dec.Schedules
                                       on sh.ScheduleID equals s.Id
                                       where currentdatetimeutc > s.EndDateTimeUtc
                                       select sh;

                if (schedulesexpired.Count() > 0)
                {
                    foreach (var e in schedulesexpired)
                    {
                        irqhandle = new IrqHandle()
                        {
                            ScheduleID = e.ScheduleID,
                            DispatchID = e.DispatchID,
                            Level = IRQL.Passive,
                            TimeStamp = currentdatetimeutc
                        };
                        dec.IrqQueue.Add(irqhandle);
                    }

                    dec.SaveChanges();
                    foundexpired = true;
                }
            }

            return foundexpired;
        }

        private static DateTime GetTargetDispatchDateTimeUtc(Schedule schedule)
        {
            DateTime currentdatetimeutc = DateTime.UtcNow;
            DateTime targetdatetimeutc = currentdatetimeutc;
            DateTime nextdispatchdatetimeutc;
            
            if (schedule.StartDateTimeUtc > currentdatetimeutc)
                targetdatetimeutc = schedule.StartDateTimeUtc;

            if (schedule is DailySchedule)
                nextdispatchdatetimeutc = ((DailySchedule)schedule).NextDispatchDateTime(targetdatetimeutc);
            else if (schedule is WeeklySchedule)
                nextdispatchdatetimeutc = ((WeeklySchedule)schedule).NextDispatchDateTime(targetdatetimeutc);
            else if (schedule is MonthlySchedule)
                nextdispatchdatetimeutc = ((MonthlySchedule)schedule).NextDispatchDateTime(targetdatetimeutc);
            else
                nextdispatchdatetimeutc = currentdatetimeutc;

            return nextdispatchdatetimeutc;
        }

        private static void RunTool(ref Dispatch dispatch, Tool tool, List<DeviceDTO> devices)
        {
            Int64 scheduleid = dispatch.ScheduleID;
            Int64 dispatchid = dispatch.Id;
            ScheduleContextData data = new ScheduleContextData()
            {
                ScheduleID = scheduleid,
                DispatchID = dispatchid,
                Devices = devices,
                CallbackInfo = dispatch.CallbackInfo
            };
            
            // current implementation only supports one tool per schedule
            var factory = new ChannelFactory<ISchedulableTool>(new BasicHttpBinding(), tool.EndPointAddress);
            var wcfclient = factory.CreateChannel();
            try
            {
                wcfclient.Run(data);
                dispatch.StatusID = DispatchStatus.Completed;
            }
            catch (Exception ex)
            {
                dispatch.ErrorCode = ex.GetType().ToString();
                dispatch.ErrorMsg = ex.Message;
                dispatch.RetryCount++;
            }
            ((IClientChannel)wcfclient).Close();
            factory.Close();
        }
    }
}