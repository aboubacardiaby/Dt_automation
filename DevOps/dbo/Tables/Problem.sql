CREATE TABLE [dbo].[Problem] (
    [ProblemId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (35)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [CreateDate]  DATETIME      CONSTRAINT [DF_Problems_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]   VARCHAR (60)  CONSTRAINT [DF_Problems_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]  DATETIME      NULL,
    [UpdatedBy]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_Problems_Problems] PRIMARY KEY CLUSTERED ([ProblemId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Problems_UpdateDate_UpdatedBy] on [dbo].[Problem]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Problem] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Problem] AS a
	INNER JOIN Inserted AS i 
	ON a.[ProblemId] = i.[ProblemId]
END