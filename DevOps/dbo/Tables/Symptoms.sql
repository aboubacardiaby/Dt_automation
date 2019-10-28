CREATE TABLE [dbo].[Symptoms] (
    [SymptomId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [ProblemId]   BIGINT        NOT NULL,
    [Name]        VARCHAR (35)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [CreateDate]  DATETIME      CONSTRAINT [DF_Symptoms_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]   VARCHAR (60)  CONSTRAINT [DF_Symptoms_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]  DATETIME      NULL,
    [UpdatedBy]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_Symptoms_Symptoms] PRIMARY KEY CLUSTERED ([SymptomId] ASC),
    CONSTRAINT [FK_Patient_Problems] FOREIGN KEY ([ProblemId]) REFERENCES [dbo].[Problem] ([ProblemId])
);


GO
CREATE Trigger [dbo].[TR_Symptoms_UpdateDate_UpdatedBy] on [dbo].[Symptoms]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Symptoms] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Symptoms] AS a
	INNER JOIN Inserted AS i 
	ON a.[SymptomId] = i.[SymptomId]
END