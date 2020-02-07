using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    /// <summary>
    /// Base class to represent an ad hoc schedule
    /// </summary>
    public partial class Schedule
    {
        protected DateTime FillDispatchStartTime(DateTime CurrentDateTime)
        {
            return new DateTime(CurrentDateTime.Year, CurrentDateTime.Month, CurrentDateTime.Day, StartTimeHour,
                                StartTimeMinute, 0);
        }

        private int StartTimeHour
        {
            get { return this.StartDateTimeUtc.Hour; }
        }

        private int StartTimeMinute
        {
            get { return this.StartDateTimeUtc.Minute; }
        }

        public bool IsAdhoc
        {
            get
            {
                if (this is DailySchedule)
                    return false;
                else if (this is WeeklySchedule)
                    return false;
                else if (this is MonthlySchedule)
                    return false;
                else
                    return true;
            }
        }
    }
}
