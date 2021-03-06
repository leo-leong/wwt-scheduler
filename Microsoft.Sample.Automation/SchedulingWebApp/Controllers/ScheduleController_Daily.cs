﻿using Microsoft.Sample.Automation.Scheduling.Entities;
using Microsoft.Sample.Automation.Scheduling.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Microsoft.Sample.Automation.Scheduling.Web.Controllers
{
    public partial class ScheduleController : Controller
    {
        public ActionResult CreateDaily()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDaily(DailySchedule schedule)
        {
            if (ModelState.IsValid)
            {
                unitOfWork.ScheduleRepository.Insert(schedule);
                unitOfWork.ScheduleRepository.Save();
                return RedirectToAction("Index");
            }

            return View(schedule);
        }


        public ActionResult EditDaily(long id = 0)
        {
            var viewModel = new ScheduleEditData<DailySchedule>();
            viewModel.Tools = unitOfWork.ToolRepository.GetAll();
            viewModel.Contacts = unitOfWork.GetMiscRepository<Contact>().GetAll();

            Schedule thisschedule = unitOfWork.ScheduleRepository.Get(
                filter: f => f.Id == id,
                includeProperties: "Tool,Contact,Devices")
                .Single();
            viewModel.Schedule = (DailySchedule)thisschedule;
            
            if (viewModel == null)
            {
                return HttpNotFound();
            }
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditDaily(DailySchedule schedule, string selectedToolID, string selectedContactID, List<string> selectedDevices)
        {
            if (ModelState.IsValid)
            {
                unitOfWork.ScheduleRepository.Update(schedule);
                UpdateScheduleGraph(schedule, selectedToolID, selectedContactID, selectedDevices);
                unitOfWork.Save();
                return RedirectToAction("Index");
            }
            return View(schedule);
        }
    }
}