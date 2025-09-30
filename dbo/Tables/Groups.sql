CREATE TABLE [dbo].[Groups]
(
	[GroupId] INT NOT NULL PRIMARY KEY, 
    [Name] NCHAR(256) NOT NULL, 
    [Picture] VARBINARY(MAX) NULL
)
