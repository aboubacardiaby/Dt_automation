CREATE TABLE [dbo].[Desease] (
    [DeseaseId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (35)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [CreateDate]  DATETIME      CONSTRAINT [DF_Desease_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]   VARCHAR (60)  CONSTRAINT [DF_Desease_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]  DATETIME      NULL,
    [UpdatedBy]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_Desease_Desease] PRIMARY KEY CLUSTERED ([DeseaseId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Desease_UpdateDate_UpdatedBy] on [dbo].[Desease]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Desease] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Desease] AS a
	INNER JOIN Inserted AS i 
	ON a.[DeseaseId] = i.[DeseaseId]
END