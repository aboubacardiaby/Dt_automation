
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_GetMemberbyKeyword]
	@Keywordkey varchar(100),
	@Keywordvalue varchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @Keywordkey ='CareTeamMemberId'
	BEGIN
		SELECT g.[GenderId],p.[ProfessionalCategoryId], a.[addressId], [CareTeamMemberId], [LastName],[FirstName],[MiddleName], a.[Address1], a.[Address2],a.[City],a.[Province],a.[PostalCode], [PhoneNumber],p.[Name] as profession,g.[Name] as Gender,[CellNumber],[EmailAddress],[DateofBirth],[PlaceofBirth],[Company],[Demographic] ,[EmergencyContactName]
				,[EmergencyContactPhoneNumber]  ,[HireDate] ,[TerminationDate],[Specialization], [PhotoFilePath],a.CountryId, c.[CreateDate]
		FROM [CareTeamMember]c
		LEFT JOIN [dbo].[Address] a on c.[AddressId]= a.[AddressId]
		LEFT JOIN [dbo].[Gender] g ON c.[GenderId] = g.[GenderId]
		LEFT JOIN [dbo].[ProfessionalCategory] p ON c.[ProfessionalCategoryId] = p.[ProfessionalCategoryId]
		WHERE  c.[CareTeamMemberId] =@Keywordvalue
	END
	ELSE IF  @Keywordkey ='LastName'
	BEGIN
		SELECT g.[GenderId],p.[ProfessionalCategoryId], a.[addressId], [CareTeamMemberId], [LastName],[FirstName],[MiddleName],a.[Address1], a.[Address2],a.[City],a.[Province],a.[PostalCode],[PhoneNumber],p.[Name] as profession,g.[Name] as Gender,[CellNumber],[EmailAddress],[DateofBirth],[PlaceofBirth],[Company],[Demographic] ,[EmergencyContactName]
				,[EmergencyContactPhoneNumber]  ,[HireDate] ,[TerminationDate],[Specialization], a.CountryId,[PhotoFilePath],c.[CreateDate]
		FROM [CareTeamMember]c
		LEFT JOIN [dbo].[Address] a on c.[AddressId]= a.[AddressId]
		LEFT JOIN [dbo].[Gender] g ON c.[GenderId] = g.[GenderId]
		LEFT JOIN [dbo].[ProfessionalCategory] p ON c.[ProfessionalCategoryId] = p.[ProfessionalCategoryId]
		WHERE  c.[LastName] =@Keywordvalue
	END
	ELSE IF  @Keywordkey ='Phonenumber'
	BEGIN
		SELECT g.[GenderId],p.[ProfessionalCategoryId], a.[addressId], [CareTeamMemberId], [LastName],[FirstName],[MiddleName],a.[Address1], a.[Address2],a.[City],a.[Province],a.[PostalCode],[PhoneNumber],p.[Name] as profession,g.[Name] as Gender,[CellNumber],[EmailAddress],[DateofBirth],[PlaceofBirth],[Company],[Demographic] ,[EmergencyContactName]
				,[EmergencyContactPhoneNumber]  ,[HireDate] ,[TerminationDate],[Specialization], a.CountryId,[PhotoFilePath],c.[CreateDate]
		FROM [CareTeamMember]c
		LEFT JOIN [dbo].[Address] a on c.[AddressId]= a.[AddressId]
		LEFT JOIN [dbo].[Gender] g ON c.[GenderId] = g.[GenderId]
		LEFT JOIN [dbo].[ProfessionalCategory] p ON c.[ProfessionalCategoryId] = p.[ProfessionalCategoryId]
		WHERE  c.[PhoneNumber] = @Keywordvalue OR  c.[CellNumber] = @Keywordvalue
	END
	ELSE 
	BEGIN
		SELECT g.[GenderId],p.[ProfessionalCategoryId], a.[addressId], [CareTeamMemberId], [LastName],[FirstName],[MiddleName],a.[Address1], a.[Address2],a.[City],a.[Province],a.[PostalCode],[PhoneNumber],p.[Name] as profession,g.[Name] as Gender,[CellNumber],[EmailAddress],[DateofBirth],[PlaceofBirth],[Company],[Demographic] ,[EmergencyContactName]
				,[EmergencyContactPhoneNumber]  ,[HireDate] ,[TerminationDate],[Specialization], a.CountryId,[PhotoFilePath],c.[CreateDate]
		FROM [CareTeamMember]c
		LEFT JOIN [dbo].[Address] a on c.[AddressId]= a.[AddressId]
		LEFT JOIN [dbo].[Gender] g ON c.[GenderId] = g.[GenderId]
		LEFT JOIN [dbo].[ProfessionalCategory] p ON c.[ProfessionalCategoryId] = p.[ProfessionalCategoryId]
		
	END
END