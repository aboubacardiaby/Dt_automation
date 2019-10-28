CREATE TABLE [dbo].[Country] (
    [CountryId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (100) NOT NULL,
    [TwoLetterIsoCode]   VARCHAR (50)  NOT NULL,
    [ThreeLetterIsoCode] VARCHAR (50)  NOT NULL,
    [NumericIsoCode]     VARCHAR (50)  NOT NULL,
    [CreateDate]         DATETIME      CONSTRAINT [DF_Country_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]          VARCHAR (60)  CONSTRAINT [DF_Country_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]         DATETIME      NULL,
    [UpdatedBy]          VARCHAR (60)  NULL,
    CONSTRAINT [PK_Country_Id] PRIMARY KEY CLUSTERED ([CountryId] ASC)
);


GO
CREATE Trigger [dbo].[TR_Country_UpdateDate_UpdatedBy] on [dbo].[Country]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Country] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Country] AS c
	INNER JOIN Inserted AS i 
	ON c.[CountryId] = i.[CountryId]
END