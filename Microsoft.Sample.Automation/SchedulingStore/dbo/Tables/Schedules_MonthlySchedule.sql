-- Creating table 'Schedules_MonthlySchedule'
-- Creating table 'Schedules_MonthlySchedule'
CREATE TABLE [dbo].[Schedules_MonthlySchedule] (
    [Day] smallint  NOT NULL,
    [Id] bigint  NOT NULL
);
GO
-- Creating foreign key on [Id] in table 'Schedules_MonthlySchedule'
-- Creating foreign key on [Id] in table 'Schedules_MonthlySchedule'
ALTER TABLE [dbo].[Schedules_MonthlySchedule]
ADD CONSTRAINT [FK_MonthlySchedule_inherits_Schedule]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Schedules]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO
-- Creating primary key on [Id] in table 'Schedules_MonthlySchedule'
-- Creating primary key on [Id] in table 'Schedules_MonthlySchedule'
ALTER TABLE [dbo].[Schedules_MonthlySchedule]
ADD CONSTRAINT [PK_Schedules_MonthlySchedule]
    PRIMARY KEY CLUSTERED ([Id] ASC);