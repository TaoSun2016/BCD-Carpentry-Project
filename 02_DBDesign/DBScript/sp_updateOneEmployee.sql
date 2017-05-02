use HRMSDB
go
drop procedure sp_addEmployee
go
create procedure sp_addEmployee(
	@Q_Forname varchar(50),
	@Q_Surname varchar(50),
	@Q_DOB date,
	@Q_Email varchar(100),

	@EmployeeID int output,
	@Forname varchar(50) output,
	@Surname varchar(50) output,
	@DOB date output,
	@Position varchar(10) output,
	@HireDate date output,
	@ResignDate date output,
	@YearsInBCD int output,
	@YearsInIndustry int output,
	@DriverLicenseNumber varchar(30) output,
	@DriverLicenseClass varchar(10) output,
	@DriverLicenseExpiryDate date output,
	@DriverLicensePhoto varchar(255) output,
	@SiteSafePhoto varchar(255) output,
	@MobileNumber varchar(20) output,
	@HomeNumber varchar(20) output,
	@Email varchar(100) output,
	@KinName varchar(100) output,
	@KinNumber varchar(20) output,
	@BankName varchar(30) output,
	@AccountNumber varchar(30) output,
	@PayRate int output,
	@TaxRate int output,
	@IRDNumber varchar(20) output,
	@Country varchar(30) output,
	@City varchar(30) output,
	@Suburb varchar(30) output,
	@Street varchar(100) output,
	@PostCode varchar(10) output,
	@Note varchar(255) output,

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	declare @sql varchar(256);

	set @sql='select @Position,@Forname,@Surname,@HomeNumber,@MobileNumber,@Email,@DOB,@KinName,@KinNumber,
									@BankName,@AccountNumber,@IRDNumber,@PayRate,@TaxRate,@DriverLicenseNumber,@DriverLicenseClass,
									@DriverLicenseExpiryDate,@DriverLicensePhoto,@SiteSafePhoto,@HireDate,@ResignDate,@YearsInBCD,@YearsInIndustry,@Country,
									@City,@Suburb,@Street,@PostCode,@Note,'
	begin try
	    
		insert into EMPLOYEE  values (@Position,@Forname,@Surname,@HomeNumber,@MobileNumber,@Email,@DOB,@KinName,@KinNumber,
									@BankName,@AccountNumber,@IRDNumber,@PayRate,@TaxRate,@DriverLicenseNumber,@DriverLicenseClass,
									@DriverLicenseExpiryDate,@DriverLicensePhoto,@SiteSafePhoto,@HireDate,@ResignDate,@YearsInBCD,@YearsInIndustry,@Country,
									@City,@Suburb,@Street,@PostCode,@Note,null,null,'N')
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new employee error!'
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new employee successfully!'
end

go