using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Entities
{
    /// <summary>
    /// Class to represent a weekly schedule based on selected days and repeated every n number of weeks
    /// </summary>
    public partial class WeeklySchedule : Schedule
    {
        public List<DayOfWeek> Days;
    }
}
