-- Creating table 'Schedules_WeeklySchedule'
-- Creating table 'Schedules_WeeklySchedule'
CREATE TABLE [dbo].[Schedules_WeeklySchedule] (
    [DayBitFields] smallint  NOT NULL,
    [Id] bigint  NOT NULL
);
GO
-- Creating foreign key on [Id] in table 'Schedules_WeeklySchedule'
-- Creating foreign key on [Id] in table 'Schedules_WeeklySchedule'
ALTER TABLE [dbo].[Schedules_WeeklySchedule]
ADD CONSTRAINT [FK_WeeklySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO
-- Creating primary key on [Id] in table 'Schedules_WeeklySchedule'
-- Creating primary key on [Id] in table 'Schedules_WeeklySchedule'
ALTER TABLE [dbo].[Schedules_WeeklySchedule]
ADD CONSTRAINT [PK_Schedules_WeeklySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);