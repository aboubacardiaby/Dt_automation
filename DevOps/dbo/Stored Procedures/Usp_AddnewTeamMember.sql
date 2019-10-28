
-- =============================================
-- Author:		<Abou,Diaby>
-- Create date: <Create Date,,>
-- Description:	<Add new team member,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_AddnewTeamMember]
	-- Add the parameters for the stored procedure here
	@LastName varchar(70),
	@FirstName varchar(70),
	@MiddleName varchar(70),
	@Gender varchar(70),
	@Profession varchar(70),
	@Phone varchar(70),
	@Cell varchar(70),
	@Email varchar(70),
	@dateofBirth datetime,
	@Company varchar(70),
	@Demographic varchar(70),
	@EmergencyContact varchar(70),
	@EmergencyPhone varchar(70),
	@HireDate DateTime,
	@TerminationDate Datetime,
	@Specialization varchar(70),
	@Address1 varchar(70),
	@Address2 varchar(70),
	@City varchar(70),
	@Province varchar(70),
	@PostalCode varchar(70),
	@CountryId bigint,
	@PhotoFilePath varchar(100)

AS
BEGIN
	--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION
	--Get IDs	
			DECLARE @AddressId bigint, @genderid bigint		
			SELECT @Genderid =[GenderId] FROM [dbo].[Gender]  where Name = @Gender 			
			
-- Insert into Table Database
			INSERT INTO [dbo].[Address]
           ([Address1]
           ,[Address2]
           ,[City]
           ,[Province]
           ,[PostalCode]
           ,[CountryId]
           )
     VALUES
           (@Address1
           ,@Address2
           ,@City
           ,@Province
           ,@PostalCode
           ,@CountryId
           )
			SET @AddressId = SCOPE_IDENTITY();

    -- Insert statements for procedure here
	

INSERT INTO [dbo].[CareTeamMember]
           ([LastName]
           ,[FirstName]
           ,[MiddleName]
           ,[AddressId]
           ,[GenderId]
           ,[ProfessionalCategoryId]
           ,[PhoneNumber]
           ,[CellNumber]
           ,[EmailAddress]
           ,[DateofBirth]
           ,[Company]
           ,[Demographic]
           ,[EmergencyContactName]
           ,[EmergencyContactPhoneNumber]
           ,[HireDate]
           ,[TerminationDate]
           ,[Specialization],
		   [PhotoFilePath]
          )
     VALUES
           (@LastName
           ,@FirstName
           ,@MiddleName
           ,@AddressId
           ,@GenderId
           ,@Profession
           ,@Phone
           ,@Cell
           ,@Email
           ,@DateofBirth
           ,@Company
           ,@Demographic
           ,@EmergencyContact
           ,@EmergencyContact
           ,@HireDate
           ,@TerminationDate
           ,@Specialization
		   ,@PhotoFilePath
           )
		   

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