using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Activity
{
    public sealed class CallbackCodeActivity : CodeActivity<CallbackResult>
    {
        public InArgument<ScheduleContextData> ContextData { get; set; }

        protected override CallbackResult Execute(CodeActivityContext context)
        {
            Dispatch dispatch;
            IrqHandle handle;
            List<CallbackDevice> devices2remove = new List<CallbackDevice>();
            ScheduleContextData data = context.GetValue(this.ContextData);
            CallbackResult result = new CallbackResult()
            {
                ScheduleID = data.ScheduleID,
                DispatchID = data.DispatchID,
                Success = false,
            };

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                try
                {
                    dispatch = dec.Dispatches.Where(d => d.Id == data.DispatchID).Single();
                    dispatch.CallbackInfo = data.CallbackInfo;

                    // Remove any devices not needed for callback
                    if (data.Devices != null)
                    {
                        var deviceids = (from d in data.Devices
                                         select d.Id).ToList();

                        devices2remove = (from cd in dec.CallbackDevices
                                          where cd.DispatchID == data.DispatchID &&
                                          !(from id in deviceids
                                            select id).Contains(cd.DeviceID)
                                          select cd).ToList();
                    }
                    else
                    {
                        devices2remove = (from cd in dec.CallbackDevices
                                          where cd.DispatchID == data.DispatchID
                                          select cd).ToList();
                    }

                    foreach (var callbackdevice in devices2remove)
                    {
                        dec.CallbackDevices.Remove(callbackdevice);
                    }

                    // set dispatch to callback status
                    dispatch.StatusID = DispatchStatus.Callback;

                    // Interrupt engine at dispatch level
                    handle = new IrqHandle()
                    {
                        ScheduleID = dispatch.ScheduleID,
                        DispatchID = dispatch.Id,
                        Level = IRQL.Dispatch,
                        TimeStamp = DateTime.Now
                    };

                    dec.IrqQueue.Add(handle);

                    dec.SaveChanges();

                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Success = false;
                    result.ErrorMsg = ex.Message;
                }
            }

            return result;
        }
    }
}
