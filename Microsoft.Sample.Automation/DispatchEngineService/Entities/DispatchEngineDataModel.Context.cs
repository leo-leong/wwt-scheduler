﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.Sample.Automation.Scheduling.Engine.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DispatchEngineContainer : DbContext
    {
        public DispatchEngineContainer()
            : base("name=DispatchEngineContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<Dispatch> Dispatches { get; set; }
        public DbSet<Tool> Tools { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Dispatcher> Dispatchers { get; set; }
        public DbSet<DispatcherControl> DispatcherControls { get; set; }
        public DbSet<SchedulingHandle> SchedulingPool { get; set; }
        public DbSet<IrqHandle> IrqQueue { get; set; }
        public DbSet<DpcHandle> DpcQueue { get; set; }
        public DbSet<Device> Devices { get; set; }
        public DbSet<CallbackDevice> CallbackDevices { get; set; }
    }
}
