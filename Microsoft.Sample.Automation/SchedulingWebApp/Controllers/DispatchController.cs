using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Sample.Automation.Scheduling.Entities;

namespace Microsoft.Sample.Automation.Scheduling.Web.Controllers
{
    public class DispatchController : Controller
    {
        private SchedulingContext db = new SchedulingContext();

        //
        // GET: /Dispatch/

        public ActionResult Index()
        {
            return View(db.Dispatches.ToList());
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}