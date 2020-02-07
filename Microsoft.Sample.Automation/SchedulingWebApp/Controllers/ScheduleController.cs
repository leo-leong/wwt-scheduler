using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Sample.Automation.Scheduling.Entities;
using Microsoft.Sample.Automation.Scheduling;
using Microsoft.Sample.Automation.Scheduling.Web.ViewModel;
using System.ComponentModel.DataAnnotations;

namespace Microsoft.Sample.Automation.Scheduling.Web.Controllers
{
    public partial class ScheduleController : Controller
    {
        private UnitOfWork unitOfWork = new UnitOfWork();

        //
        // GET: /Schedule/

        public ActionResult Index(int? id, int? toolID)
        {
            return View(unitOfWork.ScheduleRepository.GetAll());
        }

        //
        // GET: /Schedule/Details/5

        public ActionResult Details(long id = 0)
        {
            Schedule schedule = unitOfWork.ScheduleRepository.GetByID(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }

            if (schedule is DailySchedule)
            {
                return View("DetailsDaily", schedule);
            }
            else if (schedule is WeeklySchedule)
            {
                return View("DetailsWeekly", schedule);
            }
            else if (schedule is MonthlySchedule)
            {
                return View("DetailsMonthly", schedule);
            }
            else
            {
                return View(schedule);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(long id, string command)
        {
            Schedule schedule;
            List<ValidationResult> validationResults;
            bool isvalid;

            schedule = unitOfWork.ScheduleRepository.Get(
                filter: f => f.Id == id,
                includeProperties: "Tool,Contact")
                .Single();
            if (command == "Commit")
            {
                schedule.ToCommit = true;
                validationResults = new List<ValidationResult>();
                isvalid = Validator.TryValidateObject(
                    schedule,
                    new ValidationContext(schedule, null, null),
                    validationResults);
                if (isvalid)
                {
                    unitOfWork.CommitSchedule(schedule);
                    unitOfWork.Save();
                    return RedirectToAction("Index");
                }
                else
                {
                    foreach (var error in validationResults)
                    {
                        ModelState.AddModelError("", error.ErrorMessage);
                    }
                }
            }

            return View(schedule);
        }

        //
        // GET: /Schedule/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Schedule/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Schedule schedule)
        {
            if (ModelState.IsValid)
            {
                unitOfWork.ScheduleRepository.Insert(schedule);
                unitOfWork.ScheduleRepository.Save();
                return RedirectToAction("Index");
            }

            return View(schedule);
        }

        //
        // GET: /Schedule/Edit/5

        public ActionResult Edit(long id = 0)
        {
            Schedule schedule = unitOfWork.ScheduleRepository.GetByID(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }

            if (schedule is DailySchedule)
            {
                return RedirectToAction("EditDaily", new { id = schedule.Id });
            }
            else if (schedule is WeeklySchedule)
            {
                return RedirectToAction("EditWeekly", new { id = schedule.Id });
            }
            else if (schedule is MonthlySchedule)
            {
                return RedirectToAction("EditMonthly", new { id = schedule.Id });
            }
            else
            {
                var viewModel = new ScheduleEditData<Schedule>();
                viewModel.Tools = unitOfWork.ToolRepository.GetAll();
                viewModel.Contacts = unitOfWork.GetMiscRepository<Contact>().GetAll();
                viewModel.Devices = unitOfWork.DeviceRepository.GetAll();

                Schedule thisschedule = unitOfWork.ScheduleRepository.Get(
                    filter: f => f.Id == id,
                    includeProperties: "Tool,Contact,Devices")
                    .Single();
                viewModel.Schedule = thisschedule;

                if (viewModel == null)
                {
                    return HttpNotFound();
                }
                return View(viewModel);
            }
        }

        //
        // POST: /Schedule/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Schedule schedule, string selectedToolID, string selectedContactID, List<string> selectedDevices)
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


        //TODO: Needs optimization to avoid updating when no change
        private void UpdateScheduleGraph(Schedule schedule, string selectedToolID, string selectedContactID, List<string> selectedDevices)
        {
            int toolID;
            int contactID;
            Device device;
            ICollection<Device> devices = new List<Device>();

            Schedule scheduleToUpdate = unitOfWork.ScheduleRepository.Get(
                filter: f => f.Id == schedule.Id,
                includeProperties: "Tool,Contact,Devices")
                .Single();

            if (int.TryParse(selectedToolID, out toolID))
            {
                scheduleToUpdate.Tool = unitOfWork.ToolRepository.GetByID(toolID);
            }
            else
            {
                scheduleToUpdate.Tool = null;
            }

            if (int.TryParse(selectedContactID, out contactID))
            {
                scheduleToUpdate.Contact = unitOfWork.GetMiscRepository<Contact>().GetByID(contactID);
            }
            else
            {
                scheduleToUpdate.Contact = null;
            }

            if (selectedDevices != null)
            {
                foreach (var id in selectedDevices)
                {
                    device = unitOfWork.DeviceRepository.GetByID(int.Parse(id));
                    devices.Add(device);
                }
                scheduleToUpdate.Devices = devices;
            }
            else
            {
                scheduleToUpdate.Devices = null;
            }
        }


        //
        // GET: /Schedule/Delete/5

        public ActionResult Delete(long id = 0)
        {
            Schedule schedule = unitOfWork.ScheduleRepository.GetByID(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }
            return View(schedule);
        }

        //
        // POST: /Schedule/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            unitOfWork.ScheduleRepository.Delete(id);
            unitOfWork.ScheduleRepository.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            unitOfWork.Dispose();
            base.Dispose(disposing);
        }
    }
}