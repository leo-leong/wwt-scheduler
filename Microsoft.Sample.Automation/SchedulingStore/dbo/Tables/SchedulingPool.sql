-- Creating table 'SchedulingPool'
-- Creating table 'SchedulingPool'
CREATE TABLE [dbo].[SchedulingPool] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ScheduleID] bigint  NOT NULL,
    [DispatchID] bigint  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'SchedulingPool'
-- Creating primary key on [Id] in table 'SchedulingPool'
ALTER TABLE [dbo].[SchedulingPool]
ADD CONSTRAINT [PK_SchedulingPool]
    PRIMARY KEY CLUSTERED ([Id] ASC);