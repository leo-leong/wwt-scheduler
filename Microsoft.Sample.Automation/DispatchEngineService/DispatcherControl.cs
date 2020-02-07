using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    public partial class DispatcherControl
    {
        internal static bool PushCommand(EngineControl control)
        {
            bool success = false;

            DispatcherControl dc = new DispatcherControl()
            {
                Cmd = control,
                TimeStamp = DateTime.Now
            };

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                dec.DispatcherControls.Add(dc);
                dec.SaveChanges();
                success = true;

            }

            return success;
        }
    }
}