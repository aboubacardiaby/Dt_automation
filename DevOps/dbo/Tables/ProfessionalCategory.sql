CREATE TABLE [dbo].[ProfessionalCategory] (
    [ProfessionalCategoryId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Name]                   VARCHAR (35) NOT NULL,
    [CreateDate]             DATETIME     CONSTRAINT [DF_PC_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]              VARCHAR (60) CONSTRAINT [DF_PC_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]             DATETIME     NULL,
    [UpdatedBy]              VARCHAR (60) NULL,
    CONSTRAINT [PK_PC_PC] PRIMARY KEY CLUSTERED ([ProfessionalCategoryId] ASC)
);


GO
CREATE Trigger [dbo].[TR_PC_UpdateDate_UpdatedBy] on [dbo].[ProfessionalCategory]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [ProfessionalCategory] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [ProfessionalCategory] AS a
	INNER JOIN Inserted AS i 
	ON a.[ProfessionalCategoryId] = i.[ProfessionalCategoryId]
END