using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    /// <summary>
    /// Class to represent a daily schedule that runs and repeats every x number of days or every week day.
    /// </summary>
    public partial class DailySchedule : Schedule
    {
        internal DateTime NextDispatchDateTime(DateTime CurrentDateTime)
        {
            DateTime newdatetime;

            // either run on weekday only or repeat every n number of days
            if (WeekdayOnly)
            {
                int days;

                switch (CurrentDateTime.DayOfWeek)
                {
                    case DayOfWeek.Friday:
                        days = 3;
                        break;
                    case DayOfWeek.Saturday:
                        days = 2;
                        break;
                    default:
                        days = 1;
                        break;
                }

                newdatetime = CurrentDateTime.AddDays(days);

                return FillDispatchStartTime(newdatetime);
            }
            else
            {
                newdatetime = CurrentDateTime.AddDays((int)RepeatEvery * 1);

                return FillDispatchStartTime(newdatetime);
            }
        }
    }
}
