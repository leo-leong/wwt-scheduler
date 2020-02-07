using Microsoft.Sample.Automation.Scheduling.Engine.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Transactions;

namespace Microsoft.Sample.Automation.Scheduling.Engine
{
    public partial class DispatcherSemaphore
    {
        /// <summary>
        /// Unlike a regular semaphore, this implementation returns immediately if fails to enter
        /// </summary>
        /// <param name="WorkflowInstanceId"></param>
        /// <returns></returns>
        internal static bool WaitOne(Guid WorkflowInstanceId)
        {
            bool success = false;

            Dispatcher d = new Dispatcher()
            {
                RequestOrigin = Environment.MachineName,
                TimeStamp = DateTime.Now,
                WorkflowInstanceID = WorkflowInstanceId
            };

            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                using (TransactionScope ts = new TransactionScope())
                {
                    // Current dispatcher assumes singleton implementation
                    if (dec.Dispatchers.Count() <= 0)
                    {
                        dec.Dispatchers.Add(d);
                        dec.SaveChanges();
                        success = true;
                    }

                    ts.Complete();
                }
            }
            return success;
        }

        internal static bool Release(Guid WorkflowInstanceId)
        {
            bool success = false;
            using (DispatchEngineContainer dec = new DispatchEngineContainer())
            {
                using (TransactionScope ts = new TransactionScope())
                {
                    Dispatcher d = dec.Dispatchers.Single(l => l.WorkflowInstanceID == WorkflowInstanceId);

                    if (d != null)
                    {
                        dec.Dispatchers.Remove(d);
                        dec.SaveChanges();
                        success = true;
                    }

                    ts.Complete();
                }
            }
            return success;
        }
    }
}