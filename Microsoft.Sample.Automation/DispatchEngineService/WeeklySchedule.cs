using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    /// <summary>
    /// Class to represent a weekly schedule based on selected days and repeated every n number of weeks
    /// </summary>
    public partial class WeeklySchedule : Schedule
    {

        internal DateTime NextDispatchDateTime(DateTime CurrentDateTime)
        {
            DateTime newdatetime;
            int? deltadays = null;
            List<DayOfWeek> dowl = GetSchedulableDays();

            foreach (var day in dowl)
            {
                if (day > CurrentDateTime.DayOfWeek)
                    deltadays = (int)day - (int)CurrentDateTime.DayOfWeek;
            }

            // no more schedulable days within this week
            // calculate days till next week's 1st schedulable day
            // 1st day of week assumed Sun mirroring System.DayOfWeek
            if (deltadays == null)
            {
                deltadays = 7 % ((int)CurrentDateTime.DayOfWeek + 1) + // find remainder from current to sat
                    (int)dowl.First() + 1 + // count days from sun to 1st schedulable day
                    (RepeatEvery - 1) * 7;// add in days until next repeat week
            }

            newdatetime = CurrentDateTime.AddDays((double)deltadays);

            return FillDispatchStartTime(newdatetime);
        }
        
        private List<DayOfWeek> GetSchedulableDays()
        {
            // DayBitFields represents sat fri thu wed tue mon sun i.e. 1111111
            // We do a bitwise AND against the MASK to find out if the least significant digit is on or off 
            // Shifting DayBitFields right iteratively is equivalent to traversing from sun to sat
            // e.g. bit set of 00101010 is equivalent to having Mon Wed & Fri as on
            // 1st iteration of bitwise AND 
            // DayBitFields = 00000000 00000000 00000000 00101010
            //         MASK = 00000000 00000000 00000000 00000001
            //       result = 00000000 00000000 00000000 00000000
            // Hence Sun is off

            const int MASK = 1;

            List<DayOfWeek> dowl = new List<DayOfWeek>();
            DayOfWeek dow;
            int daybitfieldsfromsql = (int)DayBitFields;
            Array dowarray = Enum.GetValues(typeof(DayOfWeek));
            int shift = dowarray.GetLength(0);

            for (uint i = 0; i <= shift; i++)
            {
                if (Convert.ToBoolean(daybitfieldsfromsql & MASK))
                {
                    dow = (DayOfWeek)dowarray.GetValue(i);
                    dowl.Add(dow);
                }

                // this has the same effect as divide by 2
                daybitfieldsfromsql >>= 1;
            }

            return dowl;
        }

        private Days SetSchedulableDays(List<DayOfWeek> newlist)
        {
            int daybitfields = 0;

            foreach (DayOfWeek dow in newlist)
            {
                daybitfields |= 1 << (int)dow;
            }

            return (Days)daybitfields;
        }
    }
}
