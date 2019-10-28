

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatePatientInfo]
	@patientId  bigint,
	@PatientStatus bit,
	@Company varchar(70),
	@PreferredMethodofContact Varchar(70),
	@MaritalStatus Varchar(70),
	@HomePhone varchar(70),
	@CellPhone varchar(70),
	@WorkPhone varchar(70),
	@Email varchar(70),	
	@EmergencyContact varchar(70),
	@EmergencyPhone varchar(70),	
	@Address1 varchar(70),
	@Address2 varchar(70),
	@City varchar(70),
	@Province varchar(70),
	@PostalCode varchar(70)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Update Patient
	set PatientStatus =@PatientStatus,
	    Company =@Company,
		PerferredMethodofContact =@PreferredMethodofContact,
		MaritalStatus =@MaritalStatus,
		HomePhone=@HomePhone,
		CellPhone= @CellPhone,
		WorkPhone=@WorkPhone,
		EmailAddress=@Email,
		EmergencyContactName=@EmergencyContact,
		EmergencyContactPhone=@EmergencyPhone,
		Address1=@Address1,
		Address2 =@Address2,
		City =@City,
		Province=@Province,
		PostalCode=@PostalCode
	WHERE PatientId =@patientId

	

END