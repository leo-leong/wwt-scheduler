using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling
{
    public class ToolRepository : GenericRepository<Tool>
    {
        public ToolRepository(SchedulingContext context) : base(context) { }

        public override void Insert(Tool entity)
        {
            entity.LastModifiedDateTimeUtc = DateTime.UtcNow;
            dbSet.Add(entity);
        }

        public override void Update(Tool entityToUpdate)
        {
            var ori = this.context.Tools.Single(t => t.Id == entityToUpdate.Id);
            var entry = this.context.Entry(ori);
            entry.CurrentValues.SetValues(entityToUpdate);
            ori.CreatedDateTimeUtc = entry.Property(p => p.CreatedDateTimeUtc).OriginalValue;
            ori.LastModifiedDateTimeUtc = DateTime.UtcNow;
        }
    }
}
