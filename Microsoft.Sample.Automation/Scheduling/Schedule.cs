using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Entities
{
    /// <summary>
    /// Base class for a schedule
    /// </summary>
    //[DataContract]
    [KnownType(typeof(DailySchedule))]
    [KnownType(typeof(MonthlySchedule))]
    [KnownType(typeof(WeeklySchedule))]
    public partial class Schedule
    {
        [NotMapped]
        public bool ToCommit { get; set; }

        [NotMapped]
        public bool ToCancel { get; set; }
    }
}
