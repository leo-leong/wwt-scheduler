﻿using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling
{
    public class DeviceRepository : GenericRepository<Device>
    {
        public DeviceRepository(SchedulingContext context) : base(context) { }

        public override void Insert(Device entity)
        {
            entity.LastModifiedDateTimeUtc = DateTime.UtcNow;
            dbSet.Add(entity);
        }

        public override void Update(Device entityToUpdate)
        {
            var ori = this.context.Schedules.Single(s => s.Id == entityToUpdate.Id);
            var entry = this.context.Entry(ori);
            entry.CurrentValues.SetValues(entityToUpdate);
            ori.CreatedDateTimeUtc = entry.Property(p => p.CreatedDateTimeUtc).OriginalValue;
            ori.LastModifiedDateTimeUtc = DateTime.UtcNow;
        }
    }
}
