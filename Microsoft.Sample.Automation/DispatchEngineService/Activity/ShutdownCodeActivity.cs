using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;
using System.Transactions;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class ShutdownCodeActivity : CodeActivity<bool>
    {

        protected override bool Execute(CodeActivityContext context)
        {
            bool success = false;

            success = DispatcherControl.PushCommand(EngineControl.Shutdown);

            return success;
        }
    }
}
