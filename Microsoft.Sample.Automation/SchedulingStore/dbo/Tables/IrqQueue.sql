-- Creating table 'IrqQueue'
-- Creating table 'IrqQueue'
CREATE TABLE [dbo].[IrqQueue] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NULL,
    [Level] smallint  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'IrqQueue'
-- Creating primary key on [Id] in table 'IrqQueue'
ALTER TABLE [dbo].[IrqQueue]
ADD CONSTRAINT [PK_IrqQueue]
    PRIMARY KEY CLUSTERED ([Id] ASC);