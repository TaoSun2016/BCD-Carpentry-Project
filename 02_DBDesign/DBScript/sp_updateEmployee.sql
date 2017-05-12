use HRMSDB
go
drop procedure sp_updateEmployee
go
create procedure sp_updateEmployee(
	@EmployeeID	int,
	@Forename			varchar(50),
	@Surname			varchar(50),
	@DOB				date,
	@Position			varchar(10),
	@OtherPositions		varchar(128),
	@HireDate			date,
	@ResignDate			date,
	@YearsInBCD			int,
	@YearsInIndustry	int,
	@DriverLicenseNumber		varchar(30),
	@DriverLicenseClass			varchar(10),
	@DriverLicenseExpiryDate	date,
	@DriverLicensePhoto			varchar(255),
	@SiteSafeNumber				varchar(50),
	@SiteSafeExpiryDate			date,
	@SiteSafePhoto		varchar(255),
	@MobileNumber		varchar(20),
	@HomeNumber			varchar(20),
	@Email				varchar(100),
	@KinName			varchar(100),
	@KinNumber			varchar(20),
	@BankName			varchar(30),
	@AccountNumber		varchar(30),
	@PayRate			int,
	@TaxRate			int,
	@IRDNumber			varchar(20),
	@Country			varchar(30),
	@City				varchar(30),
	@Suburb				varchar(30),
	@Street				varchar(100),
	@PostCode			varchar(10),
	@Note				varchar(255),

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	begin try
		update EMPLOYEE set Forename = @Forename
						, Surname = @Surname
						, DOB = @DOB
						, Position = @Position
						, OtherPositions = @OtherPositions
						, HireDate = case @HireDate when '' then null else @HireDate end
						, ResignDate = case @ResignDate when '' then null else @ResignDate end
						, YearsInBCD = @YearsInBCD
						, YearsInIndustry = @YearsInIndustry
						, DriverLicenseNumber = @DriverLicenseNumber
						, SiteSafeNumber = @SiteSafeNumber
						, DriverLicenseClass = @DriverLicenseClass
						, DriverLicenseExpiryDate = case @DriverLicenseExpiryDate when '' then null else @DriverLicenseExpiryDate end
						, SiteSafeExpiryDate = case @SiteSafeExpiryDate when '' then null else @SiteSafeExpiryDate end
						, DriverLicensePhoto = @DriverLicensePhoto
						, SiteSafePhoto = @SiteSafePhoto
						, MobileNumber = @MobileNumber
						, HomeNumber = @HomeNumber
						, Email = @Email
						, KinName = @KinName
						, KinNumber = @KinNumber
						, BankName = @BankName
						, AccountNumber = @AccountNumber
						, PayRate = @PayRate
						, TaxRate = @TaxRate
						, IRDNumber = @IRDNumber
						, Country = @Country
						, City = @City
						, Suburb = @Suburb
						, Street = @Street
						, PostCode = @PostCode
						, Note = @Note
						where EmployeeID = @EmployeeID
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Update employee error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Update employee successfully!';
end

go