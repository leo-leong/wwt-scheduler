using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{
    /// <summary>
    /// WCF schedulable tools should implement this interface.
    /// </summary>
    [ServiceContract(
        Namespace = "http://Microsoft.Sample.Automation.Scheduling.Engine",
        ConfigurationName = "Microsoft.Sample.Automation.Scheduling.Engine.IScheduleCallback")]
    public interface IScheduleCallback
    {
        [OperationContract]
        CallbackResult Callback(ScheduleContextData Context);
    }

    /// <summary>
    /// Result of Callback returned to tool
    /// </summary>
    [DataContract]
    public class CallbackResult
    {
        [DataMember]
        public long ScheduleID { get; set; }
        [DataMember]
        public long DispatchID { get; set; }
        [DataMember]
        public bool Success { get; set; }
        [DataMember]
        public string ErrorMsg { get; set; }
    }
}
