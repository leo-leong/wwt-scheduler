using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class EngineCoreCodeActivity : CodeActivity
    {
        public InArgument<DateTime> startuptimestamp { get; set; }
        public OutArgument<EngineControl> transition { get; set; }

        protected override void Execute(CodeActivityContext context)
        {
            var startuptime = context.GetValue(this.startuptimestamp);
            var currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                // look for shutdown message(s)
                bool toshutdown = dec.DispatcherControls.Any(c => 
                    c.Cmd == EngineControl.Shutdown &&
                    c.TimeStamp >= startuptime);

                if (toshutdown)
                {
                    // shutdown cmd found, heading to final state
                    context.SetValue(this.transition, EngineControl.Shutdown);
                }
                else if (dec.IrqQueue.Count() > 0)
                {
                    // go sweep expired schedules & dispatches
                    context.SetValue(this.transition, EngineControl.Interrupt);
                }
                else if (dec.DpcQueue.Count() > 0)
                {
                    // go create missing dispatches
                    context.SetValue(this.transition, EngineControl.Deferred);
                }
                else
                {
                    // poll to find dispatches ready to run or exipred schedules
                    context.SetValue(this.transition, EngineControl.Poll);
                }
            }
        }
    }
}
