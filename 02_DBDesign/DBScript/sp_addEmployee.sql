use HRMSDB
go
drop procedure sp_addEmployee
go
create procedure sp_addEmployee(
	@Forname varchar(50),
	@Surname varchar(50),
	@DOB date,
	@Position varchar(10),
	@HireDate date,
	@ResignDate date,
	@YearsInBCD int,
	@YearsInIndustry int,
	@DriverLicenseNumber varchar(30),
	@DriverLicenseClass varchar(10),
	@DriverLicenseExpiryDate date,
	@DriverLicensePhoto varchar(255),
	@SiteSafePhoto varchar(255),
	@MobileNumber varchar(20),
	@HomeNumber varchar(20),
	@Email varchar(100),
	@KinName varchar(100),
	@KinNumber varchar(20),
	@BankName varchar(30),
	@AccountNumber varchar(30),
	@PayRate int,
	@TaxRate int,
	@IRDNumber varchar(20),
	@Country varchar(30),
	@City varchar(30),
	@Suburb varchar(30),
	@Street varchar(100),
	@PostCode varchar(10),
	@Note varchar(255),

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	begin try
		insert into EMPLOYEE  values (@Position,@Forname,@Surname,@HomeNumber,@MobileNumber,@Email,@DOB,@KinName,@KinNumber,
									@BankName,@AccountNumber,@IRDNumber,@PayRate,@TaxRate,@DriverLicenseNumber,@DriverLicenseClass,
									@DriverLicenseExpiryDate,@DriverLicensePhoto,@SiteSafePhoto,@HireDate,@ResignDate,@YearsInBCD,@YearsInIndustry,@Country,
									@City,@Suburb,@Street,@PostCode,@Note,null,null,'N','Y');
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new employee error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new employee successfully!';
end

go