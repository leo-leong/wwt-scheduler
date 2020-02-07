using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling
{
    /// <summary>
    /// WCF schedulable tools should implement this interface.
    /// </summary>
    [ServiceContract(
        Namespace = "http://Microsoft.Sample.Automation.Scheduling",
        ConfigurationName = "Microsoft.Sample.Automation.Scheduling.ISchedulableTool")]
    public interface ISchedulableTool
    {
        [OperationContract(IsOneWay = true)]
        void Run(ScheduleContextData Context);
    }

    /// <summary>
    /// Class to represent client machine and required properties
    /// </summary>
    [DataContract]
    public class DeviceDTO
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string IPAddress { get; set; }
    }

    /// <summary>
    /// Context info to be passed to tool when Run method is called. List of devices will be passed if configured during scheduling.
    /// CallbackInfo & NextStartDateTimeUtc is NOT valid on the first call. CallbackInfo will be provided on subsequent callbacks if set by tool.
    /// </summary>
    [DataContract]
    public class ScheduleContextData
    {
        [DataMember]
        public long ScheduleID { get; set; }
        [DataMember]
        public long DispatchID { get; set; }
        [DataMember]
        public List<DeviceDTO> Devices { get; set; }
        [DataMember]
        public string CallbackInfo { get; set; }
        [DataMember]
        public DateTime NextStartDateTimeUtc { get; set; }
    }
}
