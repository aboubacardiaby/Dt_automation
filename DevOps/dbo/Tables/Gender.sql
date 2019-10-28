CREATE TABLE [dbo].[Gender] (
    [GenderId]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (35) NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_Gencder_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]  VARCHAR (60) CONSTRAINT [DF_Gender_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Gender_Gender] PRIMARY KEY CLUSTERED ([GenderId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Gender_UpdateDate_UpdatedBy] on [dbo].[Gender]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Gender] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Gender] AS a
	INNER JOIN Inserted AS i 
	ON a.[GenderId] = i.[GenderId]
END