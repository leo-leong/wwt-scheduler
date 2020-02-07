-- Creating table 'Devices'
-- Creating table 'Devices'
CREATE TABLE [dbo].[Devices] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [LastModifiedDateTimeUtc] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IPAddress] nvarchar(max)  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'Devices'
-- Creating primary key on [Id] in table 'Devices'
ALTER TABLE [dbo].[Devices]
ADD CONSTRAINT [PK_Devices]
    PRIMARY KEY CLUSTERED ([Id] ASC);