CREATE TABLE [dbo].[CareTeamMember] (
    [CareTeamMemberId]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [LastName]                    VARCHAR (35)  NOT NULL,
    [FirstName]                   VARCHAR (35)  NOT NULL,
    [MiddleName]                  VARCHAR (35)  NULL,
    [AddressId]                   BIGINT        NULL,
    [GenderId]                    BIGINT        NULL,
    [ProfessionalCategoryId]      BIGINT        NULL,
    [PhoneNumber]                 VARCHAR (35)  NULL,
    [CellNumber]                  VARCHAR (35)  NULL,
    [EmailAddress]                VARCHAR (35)  NULL,
    [DateofBirth]                 DATETIME      NULL,
    [PlaceofBirth]                VARCHAR (75)  NULL,
    [Company]                     VARCHAR (35)  NULL,
    [Demographic]                 VARCHAR (35)  NULL,
    [EmergencyContactName]        VARCHAR (35)  NULL,
    [EmergencyContactPhoneNumber] VARCHAR (35)  NULL,
    [HireDate]                    DATETIME      NULL,
    [TerminationDate]             DATETIME      NULL,
    [Specialization]              VARCHAR (50)  NULL,
    [PhotoFilePath]               VARCHAR (100) NULL,
    [CreateDate]                  DATETIME      CONSTRAINT [DF_CareTeamMember_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                   VARCHAR (60)  CONSTRAINT [DF_CareTeamMemberId_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [UpdateDate]                  DATETIME      NULL,
    [UpdatedBy]                   VARCHAR (60)  NULL,
    CONSTRAINT [PK_CareTeamMember_CareTeamMember] PRIMARY KEY CLUSTERED ([CareTeamMemberId] ASC),
    CONSTRAINT [FK_CareTeamMember_Address] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]),
    CONSTRAINT [FK_CareTeamMember_Gender] FOREIGN KEY ([GenderId]) REFERENCES [dbo].[Gender] ([GenderId])
);


GO
CREATE Trigger [dbo].[TR_CareTeamMember_UpdateDate_UpdatedBy] on [dbo].[CareTeamMember]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [CareTeamMember] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [CareTeamMember] AS a
	INNER JOIN Inserted AS i 
	ON a.[CareTeamMemberId] = i.[CareTeamMemberId]
END