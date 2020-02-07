using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    public partial class MonthlySchedule : Schedule
    {
        internal DateTime NextDispatchDateTime(DateTime CurrentDateTime)
        {
            DateTime newdatetime;
            DateTime tmpdatetime;
            int normalizedDay;

            tmpdatetime = CurrentDateTime.AddMonths((int)RepeatEvery * 1);
            normalizedDay = GetNormalizedDayForMonth(tmpdatetime, (int)Day);
            newdatetime = new DateTime(tmpdatetime.Year, tmpdatetime.Month, normalizedDay);

            return FillDispatchStartTime(newdatetime);
        }


        /// <summary>
        /// If the day is specified is more than >= 29 normalize the day for 30 days months and february.
        /// For 30 day month and february return last day of the month.
        /// </summary>
        /// <param name="monthYear"></param>
        /// <param name="day"></param>
        /// <returns></returns>
        private static int GetNormalizedDayForMonth(DateTime TargetDateTime, int day)
        {
            var month = TargetDateTime.Month;
            int normalizedday = day;

            //28 or below no normalization is required.
            if (day > 28)
            {
                //test against february
                if (month == 2)
                {
                    normalizedday = (DateTime.IsLeapYear(TargetDateTime.Year)) ? 29 : 28;
                }
                else
                {
                    //set last day to 30 on apr june sept & nov
                    if (day > 30)
                    {
                        if ((month == 4) || (month == 6) || (month == 9) || (month == 11))
                        {
                            normalizedday = 30;
                        }
                    }
                }
            }

            return normalizedday;
        }
    }
}
