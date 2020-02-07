using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class InitializeCodeActivity : CodeActivity<bool>
    {
        protected override bool Execute(CodeActivityContext context)
        {
            var workflowinstanceid = context.WorkflowInstanceId;
            bool success;

            success = DispatcherSemaphore.WaitOne(workflowinstanceid);

            // Current dispatcher assumes singleton implementation
            // Remove all previous commands
            if (success)
            {
                using (DispatchEngineContainer dec = new DispatchEngineContainer())
                {
                    // refactor for multi instance scheduler
                    foreach (var c in dec.DispatcherControls)
                    {
                        dec.DispatcherControls.Remove(c);
                    }

                    dec.SaveChanges();
                }
            }

            //TODO: Add consistency checks
            // fix up schedule & dispatch pool if no irq & dpc found

            return success;
        }
    }
}
