using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Microsoft.Sample.Automation.Scheduling.Web.ViewModel
{
    public class CommittedSchedule
    {
        public long ScheduleID { get; set; }
        public string ScheduleName { get; set; }
        public long DispatchID { get; set; }
        public DateTime StartDateTimeUtc { get; set; }
    }
}