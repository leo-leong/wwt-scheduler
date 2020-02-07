-- Creating table 'DispatcherControls'
-- Creating table 'DispatcherControls'
CREATE TABLE [dbo].[DispatcherControls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cmd] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'DispatcherControls'
-- Creating primary key on [Id] in table 'DispatcherControls'
ALTER TABLE [dbo].[DispatcherControls]
ADD CONSTRAINT [PK_DispatcherControls]
    PRIMARY KEY CLUSTERED ([Id] ASC);