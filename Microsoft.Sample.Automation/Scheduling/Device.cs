using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Entities
{
    public partial class Device
    {
        public void BindSchedule(Int64 ScheduleID)
        {
            Schedule schedule;
            using (SchedulingContext se = new SchedulingContext())
            {
                se.Devices.Attach(this);
                se.Entry(this).Collection(c => c.Schedules).Load();

                if (!this.Schedules.Any(s => s.Id == ScheduleID))
                {
                    schedule = se.Schedules.Single(s => s.Id == ScheduleID);
                    this.Schedules.Add(schedule);
                    se.SaveChanges();
                }
            }
        }

        public void UnbindSchedule(Int64 ScheduleID)
        {
            Schedule schedule;
            using (SchedulingContext se = new SchedulingContext())
            {
                se.Devices.Attach(this);
                se.Entry(this).Collection(c => c.Schedules).Load();

                if (this.Schedules.Any(s => s.Id == ScheduleID))
                {
                    schedule = se.Schedules.Single(s => s.Id == ScheduleID);
                    this.Schedules.Remove(schedule);
                    se.SaveChanges();
                }
            }
        }

        public void LoadNavigationProperties()
        {
            using (SchedulingContext se = new SchedulingContext())
            {
                se.Devices.Attach(this);
                se.Entry(this).Collection(c => c.Schedules).Load();
            }
        }
    }
}
