using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Sample.Automation.Scheduling.Entities;
using Microsoft.Sample.Automation.Scheduling;

namespace Microsoft.Sample.Automation.Scheduling.Web.Controllers
{
    public class ToolController : Controller
    {
        private ToolRepository toolRepository = new ToolRepository(new SchedulingContext());

        //
        // GET: /Tool/

        public ActionResult Index()
        {
            return View(toolRepository.GetAll());
        }

        //
        // GET: /Tool/Details/5IEnumerable

        public ActionResult Details(int id = 0)
        {
            Tool tool = toolRepository.GetByID(id);
            if (tool == null)
            {
                return HttpNotFound();
            }
            return View(tool);
        }

        //
        // GET: /Tool/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Tool/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Tool tool)
        {
            if (ModelState.IsValid)
            {
                toolRepository.Insert(tool);
                toolRepository.Save();
                return RedirectToAction("Index");
            }

            return View(tool);
        }

        //
        // GET: /Tool/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Tool tool = toolRepository.GetByID(id);
            if (tool == null)
            {
                return HttpNotFound();
            }
            return View(tool);
        }

        //
        // POST: /Tool/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Tool tool)
        {
            if (ModelState.IsValid)
            {
                toolRepository.Update(tool);
                toolRepository.Save();
                return RedirectToAction("Index");
            }
            return View(tool);
        }

        //
        // GET: /Tool/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Tool tool = toolRepository.GetByID(id);
            if (tool == null)
            {
                return HttpNotFound();
            }
            return View(tool);
        }

        //
        // POST: /Tool/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            toolRepository.Delete(id);
            toolRepository.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            toolRepository.Dispose();
            base.Dispose(disposing);
        }
    }
}