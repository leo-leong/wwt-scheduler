using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling
{
    public sealed class DispatchManager
    {
        public static Dispatch Get(long DispatchID)
        {
            Dispatch dispatch;

            using (SchedulingContext se = new SchedulingContext())
            {
                dispatch = se.Dispatches.Single(d => d.Id == DispatchID);
            }

            return dispatch;
        }

        // TODO: set dispatch status to callback & generate interrupt
        // Only start time & callback info are allowed for updates
        public static void SetCallback(Dispatch ThisDispatch)
        {
            Dispatch dispatch;
            DbEntityEntry entry;
            IrqHandle irq;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (SchedulingContext se = new SchedulingContext())
            {
                dispatch = se.Dispatches.Find(ThisDispatch.Id);
                entry = se.Entry<Dispatch>(dispatch);
                entry.CurrentValues.SetValues(ThisDispatch);

                if (entry.State == System.Data.EntityState.Modified)
                {
                    entry.Property("CreatedDateTimeUtc").CurrentValue = entry.Property("CreatedDateTimeUtc").OriginalValue;
                    dispatch.LastModifiedDateTimeUtc = currentdatetimeutc;

                    irq = new IrqHandle()
                    {
                        ScheduleID = ThisDispatch.ScheduleID,
                        DispatchID = ThisDispatch.Id,
                        Level = IRQL.Dispatch,
                        TimeStamp = currentdatetimeutc
                    };
                    se.IrqQueue.Add(irq);

                    // simple strategy to retry only once on concurrency update failure
                    try
                    {
                        se.SaveChanges();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        // Update original values from the database
                        entry = ex.Entries.Single();
                        entry.OriginalValues.SetValues(entry.GetDatabaseValues());
                        se.SaveChanges();
                    }
                }
            }
        }
    }
}
