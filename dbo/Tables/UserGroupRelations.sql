CREATE TABLE [dbo].[UserGroupRelations]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [UserId] NVARCHAR(450) NOT NULL, 
    [GroupId] INT NOT NULL
    CONSTRAINT [FK_UserGroupRelations_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Groups] ([GroupId]) 
    CONSTRAINT [FK_UserGroupRelations_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]), 
    [CanDeleteUsers] BIT NOT NULL, 
    [CanAlterGroupInfo] BIT NOT NULL, 
    [CanAlterUsersRights] BIT NOT NULL, 
    [CanDeleteMessages] BIT NOT NULL 
)
