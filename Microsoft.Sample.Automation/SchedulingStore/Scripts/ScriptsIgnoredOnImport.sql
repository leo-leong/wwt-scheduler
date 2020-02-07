
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/07/2013 00:21:30
-- Generated from EDMX file: C:\_code\TFS\citiautomation\main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK_ToolToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ToolToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_ScheduleToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ScheduleToolArg];
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

IF OBJECT_ID(N'[dbo].[ToolArgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToolArgs];
GO

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/13/2013 23:26:14
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK_ToolToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ToolToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_ScheduleToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ScheduleToolArg];
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

IF OBJECT_ID(N'[dbo].[ToolArgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToolArgs];
GO

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/25/2013 15:53:26
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK_ScheduleToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ScheduleToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexToolToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_DuplexToolToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexTool_inherits_Tool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tools_DuplexTool] DROP CONSTRAINT [FK_DuplexTool_inherits_Tool];
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

IF OBJECT_ID(N'[dbo].[ToolArgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToolArgs];
GO

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
GO

IF OBJECT_ID(N'[dbo].[Tools_DuplexTool]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tools_DuplexTool];
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 22:18:57
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK_ScheduleToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ScheduleToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexToolToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_DuplexToolToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexTool_inherits_Tool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tools_DuplexTool] DROP CONSTRAINT [FK_DuplexTool_inherits_Tool];
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

IF OBJECT_ID(N'[dbo].[ToolArgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToolArgs];
GO

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
GO

IF OBJECT_ID(N'[dbo].[Tools_DuplexTool]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tools_DuplexTool];
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 22:35:52
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK_ScheduleToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_ScheduleToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexToolToolArg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToolArgs] DROP CONSTRAINT [FK_DuplexToolToolArg];
GO

IF OBJECT_ID(N'[dbo].[FK_DuplexTool_inherits_Tool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tools_DuplexTool] DROP CONSTRAINT [FK_DuplexTool_inherits_Tool];
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

IF OBJECT_ID(N'[dbo].[ToolArgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToolArgs];
GO

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
GO

IF OBJECT_ID(N'[dbo].[CallbackDevices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CallbackDevices];
GO

IF OBJECT_ID(N'[dbo].[Tools_DuplexTool]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tools_DuplexTool];
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 23:34:26
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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
-- Script has ended
-- --------------------------------------------------

GO

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 23:46:50
-- Generated from EDMX file: C:\_code\TFS\CitiAutomation\Main\Microsoft.Automation\DispatchEngineService\Entities\DispatchEngineDataModel.edmx
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
-- Script has ended
-- --------------------------------------------------

GO

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
-- Script has ended
-- --------------------------------------------------

GO

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
-- Script has ended
-- --------------------------------------------------

GO
