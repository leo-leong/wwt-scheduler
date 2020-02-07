using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Microsoft.Sample.Automation.Scheduling.Web.ViewModel
{
    public class ScheduleEditData<TEntity>
    {
        public TEntity Schedule { get; set; }
        public IEnumerable<Tool> Tools { get; set; }
        public IEnumerable<Contact> Contacts { get; set; }
        public IEnumerable<Device> Devices { get; set; }
    }
}