-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Schedules'
-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Schedules'
CREATE TABLE [dbo].[Schedules] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL DEFAULT Getutcdate(),
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StartDateTimeUtc] datetime  NOT NULL,
    [EndDateTimeUtc] datetime  NOT NULL,
    [RepeatEvery] smallint NULL,
    [Tool_Id] int  NULL,
    [Contact_Id] int  NULL
);
GO
-- Creating foreign key on [Tool_Id] in table 'Schedules'
-- Creating foreign key on [Tool_Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_ScheduleTool]
    FOREIGN KEY ([Tool_Id])
    REFERENCES [dbo].[Tools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating foreign key on [Contact_Id] in table 'Schedules'
-- Creating foreign key on [Contact_Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_ScheduleContact]
    FOREIGN KEY ([Contact_Id])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Schedules'
-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [PK_Schedules]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleTool'
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleTool'
CREATE INDEX [IX_FK_ScheduleTool]
ON [dbo].[Schedules]
    ([Tool_Id]);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleContact'
-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduleContact'
CREATE INDEX [IX_FK_ScheduleContact]
ON [dbo].[Schedules]
    ([Contact_Id]);