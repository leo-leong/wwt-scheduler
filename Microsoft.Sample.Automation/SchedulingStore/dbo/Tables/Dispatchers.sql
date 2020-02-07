-- Creating table 'Dispatchers'
-- Creating table 'Dispatchers'
CREATE TABLE [dbo].[Dispatchers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RequestOrigin] nvarchar(max)  NOT NULL,
    [WorkflowInstanceID] uniqueidentifier  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'Dispatchers'
-- Creating primary key on [Id] in table 'Dispatchers'
ALTER TABLE [dbo].[Dispatchers]
ADD CONSTRAINT [PK_Dispatchers]
    PRIMARY KEY CLUSTERED ([Id] ASC);