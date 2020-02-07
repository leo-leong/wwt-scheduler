using Microsoft.Sample.Automation.Scheduling.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.Sample.Automation.Scheduling
{
    public class UnitOfWork : IDisposable
    {
        private bool disposed = false;
        private SchedulingContext context = new SchedulingContext();
        private ScheduleRepository scheduleRepository;
        private ToolRepository toolRepository;
        private DeviceRepository deviceRepository;
        private Dictionary<string, dynamic> miscRepository = new Dictionary<string, dynamic>();

        public void CommitSchedule(Schedule schedule)
        {
            bool alreadyCommitted = false;
            bool pendingCommit = false;

            pendingCommit = context.IrqQueue.Any(h => h.ScheduleID == schedule.Id);
            if (!pendingCommit)
            {
                alreadyCommitted = context.SchedulingPool.Any(h => h.ScheduleID == schedule.Id);
                if (!alreadyCommitted)
                {
                    IrqHandle irqhandle = new IrqHandle()
                    {
                        ScheduleID = schedule.Id,
                        Level = IRQL.Passive,
                        TimeStamp = DateTime.Now
                    };
                    context.IrqQueue.Add(irqhandle);
                }
            }
        }

        public void CancelSchedule(Schedule schedule)
        {
            bool alreadyCommitted = false;

            alreadyCommitted = context.SchedulingPool.Any(h => h.ScheduleID == schedule.Id);
            if (alreadyCommitted)
            {
                IrqHandle irqhandle = new IrqHandle()
                {
                    ScheduleID = schedule.Id,
                    Level = IRQL.Passive,
                    TimeStamp = DateTime.Now
                };
                context.IrqQueue.Add(irqhandle);
            }
        }

        public GenericRepository<Schedule> ScheduleRepository
        {
            get
            {
                if (this.scheduleRepository == null)
                {
                    this.scheduleRepository = new ScheduleRepository(context);
                }
                return scheduleRepository;
            }
        }

        public ToolRepository ToolRepository
        {
            get
            {
                if (this.toolRepository == null)
                {
                    this.toolRepository = new ToolRepository(context);
                }
                return toolRepository;
            }
        }

        public DeviceRepository DeviceRepository
        {
            get
            {
                if (this.deviceRepository == null)
                {
                    this.deviceRepository = new DeviceRepository(context);
                }
                return deviceRepository;
            }
        }

        public GenericRepository<TEntity> GetMiscRepository<TEntity>() where TEntity : class
        {
            string repositoryName = typeof(TEntity).ToString();
            GenericRepository<TEntity> repository;
            if (!miscRepository.Any(n => n.Key == repositoryName))
            {
                repository = new GenericRepository<TEntity>(context);
                this.miscRepository.Add(repositoryName, repository);
                return repository;
            }
            return miscRepository.Where(n => n.Key == repositoryName).Single().Value;
        }

        public void Save()
        {
            context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
