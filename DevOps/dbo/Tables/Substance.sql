CREATE TABLE [dbo].[Substance] (
    [SubstanceId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (35)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [CreateDate]  DATETIME      CONSTRAINT [DF_Substance_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]   VARCHAR (60)  CONSTRAINT [DF_Substance_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]  DATETIME      NULL,
    [UpdatedBy]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_Substance_Substance] PRIMARY KEY CLUSTERED ([SubstanceId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Substance_UpdateDate_UpdatedBy] on [dbo].[Substance]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Substance] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Substance] AS a
	INNER JOIN Inserted AS i 
	ON a.[SubstanceId] = i.[SubstanceId]
END