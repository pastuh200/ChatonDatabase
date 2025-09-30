CREATE TABLE [dbo].[Messages] (
    [Id]              INT            NOT NULL,
    [SenderId]        NVARCHAR (450) NOT NULL,
    [Text]            TEXT           NULL,
    [Date]            DATETIME       NOT NULL,
    [RecieverId]      NVARCHAR (450) NOT NULL,
    [GroupRecieverId] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Message_AspNetUsers_UserIdR] FOREIGN KEY ([RecieverId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Message_AspNetUsers_UserIdS] FOREIGN KEY ([SenderId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Message_Groups_GroupId] FOREIGN KEY ([GroupRecieverId]) REFERENCES [dbo].[Groups] ([GroupId])
);

