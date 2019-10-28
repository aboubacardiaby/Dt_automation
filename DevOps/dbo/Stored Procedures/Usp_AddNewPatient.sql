
CREATE PROCEDURE [dbo].[Usp_AddNewPatient]
	@LastName varchar(70),
	@FirstName varchar(70),
	@MiddleName varchar(70),
	@PatientStatus bit,
	@Company varchar(70),
	@PreferredMethodofContact Varchar(70),
	@MaritalStatus Varchar(70),
	@HomePhone varchar(70),
	@CellPhone varchar(70),
	@WorkPhone varchar(70),
	@Email varchar(70),
	@GorvernmentId varchar(70),
	@dateofBirth datetime,
	@Sex varchar(20),
	@Demographic BiGINT,
	@EmergencyContact varchar(70),
	@EmergencyPhone varchar(70),	
	@Address1 varchar(70),
	@Address2 varchar(70),
	@City varchar(70),
	@Province varchar(70),
	@PostalCode varchar(70),
	@CountryId BiGINT
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION
	DECLARE @DemoId bigint, @gendid bigint
	SELECT @DemoId =DemographicId
	FROM [dbo].[Demographic]
	SELECT @gendid =GenderId
	FROM [dbo].Gender	
	INSERT INTO dbo.Patient([FirstName],[LastName],[MiddleName],[PatientStatus],[Company],[PerferredMethodofContact],[MaritalStatus],
							[HomePhone],[CellPhone],[WorkPhone],[EmailAddress],[GorvernmentId],[DateofBirth],[GenderId],[DemographicId],
							[EmergencyContactName],[EmergencyContactPhone],[Address1],[Address2],[City],[Province],[PostalCode],[CountryId])
	VALUES(@FirstName,@LastName,@MiddleName,@PatientStatus,@Company,@PreferredMethodofContact,@MaritalStatus,@HomePhone,@CellPhone,@WorkPhone,
	        @Email,@GorvernmentId,@dateofBirth,@gendid,@DemoId,@EmergencyContact,@EmergencyPhone,@Address1,@Address2,@City,@Province,@PostalCode,
			@CountryId)
COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		DECLARE 
			@ErrorMessage NVARCHAR(4000),
			@ErrorSeverity INT,
			@ErrorState INT;
		SELECT 
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (
			@ErrorMessage,
			@ErrorSeverity,
			@ErrorState    
			);
		ROLLBACK TRANSACTION
	END CATCH
END