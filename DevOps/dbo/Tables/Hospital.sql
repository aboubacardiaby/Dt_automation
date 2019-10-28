CREATE TABLE [dbo].[Hospital] (
    [HospitalId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [CountryId]           BIGINT        NOT NULL,
    [HospitalName]        VARCHAR (100) NOT NULL,
    [URL]                 VARCHAR (50)  NULL,
    [SslEnabled]          VARCHAR (70)  NULL,
    [SecureUrl]           VARCHAR (70)  NULL,
    [Host]                VARCHAR (70)  NULL,
    [DefaultLanguageId]   BIGINT        NOT NULL,
    [DisplayOrder]        BIGINT        NOT NULL,
    [HospitalAddress]     VARCHAR (100) NULL,
    [HospitalPhoneNumber] VARCHAR (70)  NULL,
    [CreateDate]          DATETIME      CONSTRAINT [DF_Party_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]           VARCHAR (60)  CONSTRAINT [DF_Party_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]          DATETIME      NULL,
    [UpdatedBy]           VARCHAR (60)  NULL,
    CONSTRAINT [PK_Hospital_Id] PRIMARY KEY CLUSTERED ([HospitalId] ASC),
    CONSTRAINT [FK_Hostpital_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([CountryId])
);


GO
CREATE Trigger [dbo].[TR_Hospital_UpdateDate_UpdatedBy] on [dbo].[Hospital]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Hospital] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Hospital] AS c
	INNER JOIN Inserted AS i 
	ON c.[HospitalId] = i.[HospitalId]
END