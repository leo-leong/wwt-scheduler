-- Creating table 'ScheduleDevice'
-- Creating table 'ScheduleDevice'
CREATE TABLE [dbo].[ScheduleDevice] (
    [Schedules_Id] bigint  NOT NULL,
    [Devices_Id] bigint  NOT NULL
);
GO
-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Schedules_Id] in table 'ScheduleDevice'
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
-- Creating foreign key on [Devices_Id] in table 'ScheduleDevice'
ALTER TABLE [dbo].[ScheduleDevice]
ADD CONSTRAINT [FK_ScheduleDevice_Device]
    FOREIGN KEY ([Devices_Id])
    REFERENCES [dbo].[Devices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [Schedules_Id], [Devices_Id] in table 'ScheduleDevice'
-- Creating primary key on [Schedules_Id], [Devices_Id] in table 'ScheduleDevice'
ALTER TABLE [dbo].[ScheduleDevice]
ADD CONSTRAINT [PK_ScheduleDevice]
    PRIMARY KEY NONCLUSTERED ([Schedules_Id], [Devices_Id] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleDevice_Device'
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleDevice_Device'
CREATE INDEX [IX_FK_ScheduleDevice_Device]
ON [dbo].[ScheduleDevice]
    ([Devices_Id]);