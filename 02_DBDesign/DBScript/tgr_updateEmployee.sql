----------------------------------------------------------------
---- Crate trigger
----------------------------------------------------------------
use HRMSDB
go
drop trigger tgr_updateEmployee
go
create trigger tgr_updateEmployee
on employee
for update
as 
if UPDATE(Position) or UPDATE(OtherPositions) or UPDATE(Forename) or UPDATE(Surname) or UPDATE(HomeNumber) 
or UPDATE(MobileNumber) or UPDATE(Email) or UPDATE(DOB) or UPDATE(KinName) or UPDATE(KinNumber) 
or UPDATE(BankName) or UPDATE(AccountNumber) or UPDATE(IRDNumber) or UPDATE(PayRate) or UPDATE(TaxRate) 
or UPDATE(DriverLicenseNumber) or UPDATE(DriverLicenseClass) or UPDATE(DriverLicenseExpiryDate) or UPDATE(DriverLicensePhoto) 
or UPDATE(SiteSafeNumber) or UPDATE(SiteSafeExpiryDate) or UPDATE(SiteSafePhoto) or UPDATE(HireDate)
or UPDATE(ResignDate) or UPDATE(YearsInBCD) or UPDATE(YearsInIndustry) or UPDATE(Country) or UPDATE(City)
or UPDATE(Suburb) or UPDATE(Street) or UPDATE(PostCode) or UPDATE(Note)
begin
	insert into employee_history 
		select EmployeeID,Position,OtherPositions,Forename,Surname,HomeNumber,MobileNumber,
			   Email,DOB,KinName,KinNumber,BankName,AccountNumber,IRDNumber,
			   PayRate,TaxRate,DriverLicenseNumber,DriverLicenseClass,
			   DriverLicenseExpiryDate,DriverLicensePhoto,SiteSafeNumber,SiteSafeExpiryDate,SiteSafePhoto,
			   HireDate,ResignDate,YearsInBCD,YearsInIndustry,
			   Country,City,Suburb,Street,PostCode,Note,getdate()
		from deleted;
end
go