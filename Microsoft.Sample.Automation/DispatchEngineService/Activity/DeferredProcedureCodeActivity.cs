using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Activities;
using Microsoft.Sample.Automation.Scheduling.Engine.Entities;
using System.Data.Entity.Infrastructure;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{

    public sealed class DeferredProcedureCodeActivity : CodeActivity
    {

        protected override void Execute(CodeActivityContext context)
        {
            IEnumerable<DpcHandle> dpchandles;
            DpcHandle currentDPC = new DpcHandle();
            bool ishighimportancedpc;
            bool dpclocked = false;
            DateTime currentdatetimeutc = DateTime.UtcNow;

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                ishighimportancedpc = dec.DpcQueue.Any(dpc => dpc.Importance == Importance.High);

                if (ishighimportancedpc)
                    dpchandles = dec.DpcQueue.Where(dpc => dpc.Importance == Importance.High).ToArray();
                else
                    dpchandles = dec.DpcQueue.ToArray();

                foreach (var dpc in dpchandles)
                {
                    dpc.TimeStamp = currentdatetimeutc;

                    try
                    {
                        dec.SaveChanges();
                        dec.Entry(dpc).Reload();
                        currentDPC = dpc;
                        dpclocked = true;
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        // TODO: log exception & increment counter
                    }

                    if (dpclocked)
                        break;
                }
            }

            if (dpclocked)
            {
                if (ishighimportancedpc)
                {
                    Dispatcher.PlanSchedulingPool(currentDPC);
                }
                else
                {
                    Dispatcher.RunDispatch(currentDPC);
                }
            }
        }
    }
}
