-- Creating table 'Schedules_DailySchedule'
-- Creating table 'Schedules_DailySchedule'
CREATE TABLE [dbo].[Schedules_DailySchedule] (
    [WeekdayOnly] bit  NOT NULL,
    [Id] bigint  NOT NULL
);
GO
-- Creating foreign key on [Id] in table 'Schedules_DailySchedule'
-- Creating foreign key on [Id] in table 'Schedules_DailySchedule'
ALTER TABLE [dbo].[Schedules_DailySchedule]
ADD CONSTRAINT [FK_DailySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO
-- Creating primary key on [Id] in table 'Schedules_DailySchedule'
-- Creating primary key on [Id] in table 'Schedules_DailySchedule'
ALTER TABLE [dbo].[Schedules_DailySchedule]
ADD CONSTRAINT [PK_Schedules_DailySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);