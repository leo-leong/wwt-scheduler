-- Creating table 'Tools'
-- Creating table 'Tools'
-- Creating table 'Tools'
-- Creating table 'Tools'
CREATE TABLE [dbo].[Tools] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL DEFAULT Getutcdate(),
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [EndPointAddress] nvarchar(max)  NOT NULL,
    [Contact_Id] int  NULL
);
GO
-- Creating foreign key on [Contact_Id] in table 'Tools'
-- Creating foreign key on [Contact_Id] in table 'Tools'
-- Creating foreign key on [Contact_Id] in table 'Tools'
-- Creating foreign key on [Contact_Id] in table 'Tools'
ALTER TABLE [dbo].[Tools]
ADD CONSTRAINT [FK_ToolContact]
    FOREIGN KEY ([Contact_Id])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating primary key on [Id] in table 'Tools'
-- Creating primary key on [Id] in table 'Tools'
-- Creating primary key on [Id] in table 'Tools'
-- Creating primary key on [Id] in table 'Tools'
ALTER TABLE [dbo].[Tools]
ADD CONSTRAINT [PK_Tools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_ToolContact'
-- Creating non-clustered index for FOREIGN KEY 'FK_ToolContact'
-- Creating non-clustered index for FOREIGN KEY 'FK_ToolContact'
-- Creating non-clustered index for FOREIGN KEY 'FK_ToolContact'
CREATE INDEX [IX_FK_ToolContact]
ON [dbo].[Tools]
    ([Contact_Id]);