using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling;
using Microsoft.Sample.Automation.Scheduling.Engine;
using System.ServiceModel;

namespace WorkflowServiceCallbackTool
{

    public sealed class RequestCallbackCodeActivity : CodeActivity<CallbackResult>
    {
        public InArgument<ScheduleContextData> ContextData { get; set; }
        public InArgument<string> Endpoint { get; set; }

        protected override CallbackResult Execute(CodeActivityContext context)
        {
            ScheduleContextData data = context.GetValue(this.ContextData);
            string endpoint = context.GetValue(this.Endpoint);
            data.Devices = null;
            data.CallbackInfo = "Insert Callback data here";
            data.NextStartDateTimeUtc = DateTime.UtcNow;

            var factory = new ChannelFactory<IScheduleCallback>(new BasicHttpBinding(), endpoint);
            var wcfclient = factory.CreateChannel();
            var result = wcfclient.Callback(data);

            ((IClientChannel)wcfclient).Close();
            factory.Close();

            return result;
        }
    }
}
