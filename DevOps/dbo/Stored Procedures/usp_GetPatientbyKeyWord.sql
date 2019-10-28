CREATE PROCEDURE [dbo].[usp_GetPatientbyKeyWord]
	@Keywordkey varchar(100),
	@Keywordvalue varchar(100)
AS
BEGIN	
	SET NOCOUNT ON;

    IF @Keywordkey ='PatientId'
		BEGIN
			SELECT [PatientId],[LastName] ,[FirstName],[MiddleName],[PatientStatus],g.Name As Sex,[HomePhone] ,[CellPhone],[WorkPhone]
				  ,[EmailAddress],[DateofBirth],[Company],[EmergencyContactName] ,[EmergencyContactPhone]  ,[GorvernmentId],[Address1]
				  ,[Address2],[City],[Province],[PostalCode],[CountryId],[PerferredMethodofContact],[MaritalStatus],D.Name AS Demographic      
			FROM [GPS].[dbo].[Patient] p
			INNER JOIN Demographic d ON P.DemographicId =d.DemographicId
			INNER JOIN Gender g on p.GenderId = g.GenderId
			WHERE [PatientId]=@Keywordvalue
		END
	ELSE IF  @Keywordkey ='LastName'
	BEGIN
			SELECT [PatientId],[LastName] ,[FirstName],[MiddleName],[PatientStatus],g.Name As Sex,[HomePhone] ,[CellPhone],[WorkPhone]
				  ,[EmailAddress],[DateofBirth],[Company],[EmergencyContactName] ,[EmergencyContactPhone]  ,[GorvernmentId],[Address1]
				  ,[Address2],[City],[Province],[PostalCode],[CountryId],[PerferredMethodofContact],[MaritalStatus],D.Name AS Demographic      
			FROM [GPS].[dbo].[Patient] p
			INNER JOIN Demographic d ON P.DemographicId =d.DemographicId
			INNER JOIN Gender g on p.GenderId = g.GenderId
			WHERE [PatientId]=@Keywordvalue
	END
END