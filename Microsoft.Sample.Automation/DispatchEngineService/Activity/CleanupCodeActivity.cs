using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class CleanupCodeActivity : CodeActivity
    {
        protected override void Execute(CodeActivityContext context)
        {
            var workflowinstanceid = context.WorkflowInstanceId;

            DispatcherSemaphore.Release(workflowinstanceid);
        }
    }
}
