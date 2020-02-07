using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Sample.Automation.Scheduling.Entities;
using Microsoft.Sample.Automation.Scheduling.Web.ViewModel;

namespace Microsoft.Sample.Automation.Scheduling.Web.Controllers
{
    public class CommittedPoolController : Controller
    {
        private SchedulingContext db = new SchedulingContext();

        //
        // GET: /SchedulingPool/

        public ActionResult Index()
        {
            //IEnumerable<CommittedSchedule> viewModel;
            var viewModel = from h in db.SchedulingPool
                        join s in db.Schedules on h.ScheduleID equals s.Id
                        join d in db.Dispatches on h.DispatchID equals d.Id
                        select new CommittedSchedule()
                        {
                            ScheduleID = h.ScheduleID,
                            ScheduleName = s.Name,
                            DispatchID = h.DispatchID,
                            StartDateTimeUtc = d.StartDateTimeUtc
                        };

            return View(viewModel.ToList());
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}