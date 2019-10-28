CREATE TABLE [dbo].[Address] (
    [AddressId]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [Address1]   VARCHAR (70) NOT NULL,
    [Address2]   VARCHAR (70) NOT NULL,
    [City]       VARCHAR (35) NOT NULL,
    [Province]   CHAR (70)    NOT NULL,
    [PostalCode] VARCHAR (70) NOT NULL,
    [CountryId]  BIGINT       NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_Address_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]  VARCHAR (60) CONSTRAINT [DF_Address_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Address_AddressId] PRIMARY KEY CLUSTERED ([AddressId] ASC),
    CONSTRAINT [FK_Country_Address] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([CountryId])
);


GO
CREATE Trigger [dbo].[TR_Address_UpdateDate_UpdatedBy] on [dbo].[Address]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Address] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [Address] AS a
	INNER JOIN Inserted AS i 
	ON a.AddressId = i.AddressId
END