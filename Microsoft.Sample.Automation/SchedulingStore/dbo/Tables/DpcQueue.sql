-- Creating table 'DpcQueue'
-- Creating table 'DpcQueue'
CREATE TABLE [dbo].[DpcQueue] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NULL,
    [Importance] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'DpcQueue'
-- Creating primary key on [Id] in table 'DpcQueue'
ALTER TABLE [dbo].[DpcQueue]
ADD CONSTRAINT [PK_DpcQueue]
    PRIMARY KEY CLUSTERED ([Id] ASC);