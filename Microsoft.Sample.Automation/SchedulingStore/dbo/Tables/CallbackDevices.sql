-- Creating table 'CallbackDevices'
-- Creating table 'CallbackDevices'
-- Creating table 'CallbackDevices'
-- Creating table 'CallbackDevices'
CREATE TABLE [dbo].[CallbackDevices] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [DispatchID] bigint  NOT NULL,
    [DeviceID] bigint  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'CallbackDevices'
-- Creating primary key on [Id] in table 'CallbackDevices'
-- Creating primary key on [Id] in table 'CallbackDevices'
-- Creating primary key on [Id] in table 'CallbackDevices'
ALTER TABLE [dbo].[CallbackDevices]
ADD CONSTRAINT [PK_CallbackDevices]
    PRIMARY KEY CLUSTERED ([Id] ASC);