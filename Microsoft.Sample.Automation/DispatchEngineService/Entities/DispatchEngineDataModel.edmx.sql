
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/02/2013 14:41:59
-- Generated from EDMX file: C:\_code\TFS\citiautomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SchedulingStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ScheduleDevice_Schedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduleDevice] DROP CONSTRAINT [FK_ScheduleDevice_Schedule];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduleDevice_Device]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduleDevice] DROP CONSTRAINT [FK_ScheduleDevice_Device];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduleTool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules] DROP CONSTRAINT [FK_ScheduleTool];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduleContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules] DROP CONSTRAINT [FK_ScheduleContact];
GO
IF OBJECT_ID(N'[dbo].[FK_ToolContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tools] DROP CONSTRAINT [FK_ToolContact];
GO
IF OBJECT_ID(N'[dbo].[FK_DailySchedule_inherits_Schedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules_DailySchedule] DROP CONSTRAINT [FK_DailySchedule_inherits_Schedule];
GO
IF OBJECT_ID(N'[dbo].[FK_WeeklySchedule_inherits_Schedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules_WeeklySchedule] DROP CONSTRAINT [FK_WeeklySchedule_inherits_Schedule];
GO
IF OBJECT_ID(N'[dbo].[FK_MonthlySchedule_inherits_Schedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules_MonthlySchedule] DROP CONSTRAINT [FK_MonthlySchedule_inherits_Schedule];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Schedules]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedules];
GO
IF OBJECT_ID(N'[dbo].[Dispatches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dispatches];
GO
IF OBJECT_ID(N'[dbo].[Tools]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tools];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[Dispatchers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dispatchers];
GO
IF OBJECT_ID(N'[dbo].[DispatcherControls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DispatcherControls];
GO
IF OBJECT_ID(N'[dbo].[SchedulingPool]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SchedulingPool];
GO
IF OBJECT_ID(N'[dbo].[IrqQueue]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IrqQueue];
GO
IF OBJECT_ID(N'[dbo].[DpcQueue]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DpcQueue];
GO
IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
GO
IF OBJECT_ID(N'[dbo].[CallbackDevices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CallbackDevices];
GO
IF OBJECT_ID(N'[dbo].[Schedules_DailySchedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedules_DailySchedule];
GO
IF OBJECT_ID(N'[dbo].[Schedules_WeeklySchedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedules_WeeklySchedule];
GO
IF OBJECT_ID(N'[dbo].[Schedules_MonthlySchedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedules_MonthlySchedule];
GO
IF OBJECT_ID(N'[dbo].[ScheduleDevice]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduleDevice];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Schedules'
CREATE TABLE [dbo].[Schedules] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL,
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StartDateTimeUtc] datetime  NOT NULL,
    [EndDateTimeUtc] datetime  NOT NULL,
    [RepeatEvery] smallint  NULL,
    [Tool_Id] int  NULL,
    [Contact_Id] int  NULL
);
GO

-- Creating table 'Dispatches'
CREATE TABLE [dbo].[Dispatches] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL,
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [StatusID] smallint  NOT NULL,
    [RetryCount] smallint  NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [StartDateTimeUtc] datetime  NOT NULL,
    [ToolID] int  NOT NULL,
    [CallbackInfo] nvarchar(max)  NULL,
    [ErrorCode] nvarchar(max)  NULL,
    [ErrorMsg] nvarchar(max)  NULL
);
GO

-- Creating table 'Tools'
CREATE TABLE [dbo].[Tools] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL,
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [EndPointAddress] nvarchar(max)  NOT NULL,
    [Contact_Id] int  NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [LoginID] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Dispatchers'
CREATE TABLE [dbo].[Dispatchers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RequestOrigin] nvarchar(max)  NOT NULL,
    [WorkflowInstanceID] uniqueidentifier  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO

-- Creating table 'DispatcherControls'
CREATE TABLE [dbo].[DispatcherControls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cmd] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO

-- Creating table 'SchedulingPool'
CREATE TABLE [dbo].[SchedulingPool] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NOT NULL
);
GO

-- Creating table 'IrqQueue'
CREATE TABLE [dbo].[IrqQueue] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NULL,
    [Level] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO

-- Creating table 'DpcQueue'
CREATE TABLE [dbo].[DpcQueue] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NULL,
    [Importance] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO

-- Creating table 'Devices'
CREATE TABLE [dbo].[Devices] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IPAddress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CallbackDevices'
CREATE TABLE [dbo].[CallbackDevices] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [DispatchID] bigint  NOT NULL,
    [DeviceID] bigint  NOT NULL
);
GO

-- Creating table 'Schedules_DailySchedule'
CREATE TABLE [dbo].[Schedules_DailySchedule] (
    [WeekdayOnly] bit  NOT NULL,
    [Id] bigint  NOT NULL
);
GO

-- Creating table 'Schedules_WeeklySchedule'
CREATE TABLE [dbo].[Schedules_WeeklySchedule] (
    [DayBitFields] smallint  NOT NULL,
    [Id] bigint  NOT NULL
);
GO

-- Creating table 'Schedules_MonthlySchedule'
CREATE TABLE [dbo].[Schedules_MonthlySchedule] (
    [Day] smallint  NOT NULL,
    [Id] bigint  NOT NULL
);
GO

-- Creating table 'ScheduleDevice'
CREATE TABLE [dbo].[ScheduleDevice] (
    [Schedules_Id] bigint  NOT NULL,
    [Devices_Id] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [PK_Schedules]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Dispatches'
ALTER TABLE [dbo].[Dispatches]
ADD CONSTRAINT [PK_Dispatches]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tools'
ALTER TABLE [dbo].[Tools]
ADD CONSTRAINT [PK_Tools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Dispatchers'
ALTER TABLE [dbo].[Dispatchers]
ADD CONSTRAINT [PK_Dispatchers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DispatcherControls'
ALTER TABLE [dbo].[DispatcherControls]
ADD CONSTRAINT [PK_DispatcherControls]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SchedulingPool'
ALTER TABLE [dbo].[SchedulingPool]
ADD CONSTRAINT [PK_SchedulingPool]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IrqQueue'
ALTER TABLE [dbo].[IrqQueue]
ADD CONSTRAINT [PK_IrqQueue]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DpcQueue'
ALTER TABLE [dbo].[DpcQueue]
ADD CONSTRAINT [PK_DpcQueue]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Devices'
ALTER TABLE [dbo].[Devices]
ADD CONSTRAINT [PK_Devices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CallbackDevices'
ALTER TABLE [dbo].[CallbackDevices]
ADD CONSTRAINT [PK_CallbackDevices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Schedules_DailySchedule'
ALTER TABLE [dbo].[Schedules_DailySchedule]
ADD CONSTRAINT [PK_Schedules_DailySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Schedules_WeeklySchedule'
ALTER TABLE [dbo].[Schedules_WeeklySchedule]
ADD CONSTRAINT [PK_Schedules_WeeklySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Schedules_MonthlySchedule'
ALTER TABLE [dbo].[Schedules_MonthlySchedule]
ADD CONSTRAINT [PK_Schedules_MonthlySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Schedules_Id], [Devices_Id] in table 'ScheduleDevice'
ALTER TABLE [dbo].[ScheduleDevice]
ADD CONSTRAINT [PK_ScheduleDevice]
    PRIMARY KEY NONCLUSTERED ([Schedules_Id], [Devices_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Schedules_Id] in table 'ScheduleDevice'
ALTER TABLE [dbo].[ScheduleDevice]
ADD CONSTRAINT [FK_ScheduleDevice_Schedule]
    FOREIGN KEY ([Schedules_Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Devices_Id] in table 'ScheduleDevice'
ALTER TABLE [dbo].[ScheduleDevice]
ADD CONSTRAINT [FK_ScheduleDevice_Device]
    FOREIGN KEY ([Devices_Id])
    REFERENCES [dbo].[Devices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleDevice_Device'
CREATE INDEX [IX_FK_ScheduleDevice_Device]
ON [dbo].[ScheduleDevice]
    ([Devices_Id]);
GO

-- Creating foreign key on [Tool_Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_ScheduleTool]
    FOREIGN KEY ([Tool_Id])
    REFERENCES [dbo].[Tools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleTool'
CREATE INDEX [IX_FK_ScheduleTool]
ON [dbo].[Schedules]
    ([Tool_Id]);
GO

-- Creating foreign key on [Contact_Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_ScheduleContact]
    FOREIGN KEY ([Contact_Id])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleContact'
CREATE INDEX [IX_FK_ScheduleContact]
ON [dbo].[Schedules]
    ([Contact_Id]);
GO

-- Creating foreign key on [Contact_Id] in table 'Tools'
ALTER TABLE [dbo].[Tools]
ADD CONSTRAINT [FK_ToolContact]
    FOREIGN KEY ([Contact_Id])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ToolContact'
CREATE INDEX [IX_FK_ToolContact]
ON [dbo].[Tools]
    ([Contact_Id]);
GO

-- Creating foreign key on [Id] in table 'Schedules_DailySchedule'
ALTER TABLE [dbo].[Schedules_DailySchedule]
ADD CONSTRAINT [FK_DailySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Schedules_WeeklySchedule'
ALTER TABLE [dbo].[Schedules_WeeklySchedule]
ADD CONSTRAINT [FK_WeeklySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Schedules_MonthlySchedule'
ALTER TABLE [dbo].[Schedules_MonthlySchedule]
ADD CONSTRAINT [FK_MonthlySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------