-- Creating table 'Dispatches'
-- Creating table 'Dispatches'
-- Creating table 'Dispatches'
CREATE TABLE [dbo].[Dispatches] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [CreatedDateTimeUtc] datetime  NOT NULL DEFAULT Getutcdate(),
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
-- Creating primary key on [Id] in table 'Dispatches'
-- Creating primary key on [Id] in table 'Dispatches'
-- Creating primary key on [Id] in table 'Dispatches'
ALTER TABLE [dbo].[Dispatches]
ADD CONSTRAINT [PK_Dispatches]
    PRIMARY KEY CLUSTERED ([Id] ASC);