using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class PollCodeActivity : CodeActivity<bool>
    {
        protected override bool Execute(CodeActivityContext context)
        {
            bool dodelay = true;

            if (Dispatcher.PollDispatchReady())
            {
                dodelay = false;
            }
            else if (Dispatcher.PollExpiredSchedule())
            {
                dodelay = false;
            }

            return dodelay;
        }
    }
}
