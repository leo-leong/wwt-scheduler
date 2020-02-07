using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling.Entities
{
    public partial class Schedule : IValidatableObject
    {
        public IEnumerable<ValidationResult> Validate(ValidationContext Context)
        {
            if (this.EndDateTimeUtc < this.StartDateTimeUtc)
            {
                yield return new ValidationResult("End Date must be greater than Start Date", new[] { "EndDateTimeUtc" });
            }

            if (this.ToCommit)
            {
                if (this is DailySchedule || this is WeeklySchedule || this is MonthlySchedule)
                {
                    if (this.RepeatEvery == null)
                        yield return new ValidationResult("RepeatEvery cannot be null", new[] { "RepeatEvery" });
                }

                if (this.Tool == null)
                {
                    yield return new ValidationResult("Schedule must have Tool to be committed", new[] { "Tool" });
                }

                if (this.Contact == null)
                {
                    yield return new ValidationResult("Schedule must have Contact to be committed", new[] { "Contact" });
                }
            }
        }
    }
}
