CREATE TABLE [dbo].[Demographic] (
    [DemographicId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (35) NOT NULL,
    [CreateDate]    DATETIME     CONSTRAINT [DF_Demographic_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]     VARCHAR (60) CONSTRAINT [DF_Demographic_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]    DATETIME     NULL,
    [UpdatedBy]     VARCHAR (60) NULL,
    CONSTRAINT [PK_DEmographic_DEmographic] PRIMARY KEY CLUSTERED ([DemographicId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Demographic_UpdateDate_UpdatedBy] on [dbo].[Demographic]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Demographic] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Demographic] AS a
	INNER JOIN Inserted AS i 
	ON a.[DemographicId] = i.[DemographicId]
END