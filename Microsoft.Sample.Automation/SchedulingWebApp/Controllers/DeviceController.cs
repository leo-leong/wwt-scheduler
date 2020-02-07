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
    public class DeviceController : Controller
    {
        private UnitOfWork unitOfWork = new UnitOfWork();

        //
        // GET: /Device/

        public ActionResult Index()
        {
            return View(unitOfWork.DeviceRepository.GetAll());
        }

        //
        // GET: /Device/Details/5

        public ActionResult Details(int id = 0)
        {
            Device device = unitOfWork.DeviceRepository.GetByID(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        //
        // GET: /Device/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Device/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Device device)
        {
            if (ModelState.IsValid)
            {
                unitOfWork.DeviceRepository.Insert(device);
                unitOfWork.DeviceRepository.Save();
                return RedirectToAction("Index");
            }

            return View(device);
        }

        //
        // GET: /Device/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Device device = unitOfWork.DeviceRepository.GetByID(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        //
        // POST: /Device/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Device device)
        {
            if (ModelState.IsValid)
            {
                unitOfWork.DeviceRepository.Update(device);
                unitOfWork.DeviceRepository.Save();
                return RedirectToAction("Index");
            }
            return View(device);
        }

        //
        // GET: /Device/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Device device = unitOfWork.DeviceRepository.GetByID(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        //
        // POST: /Device/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Device device = unitOfWork.DeviceRepository.GetByID(id);
            unitOfWork.DeviceRepository.Delete(device);
            unitOfWork.DeviceRepository.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            unitOfWork.DeviceRepository.Dispose();
            base.Dispose(disposing);
        }
    }
}