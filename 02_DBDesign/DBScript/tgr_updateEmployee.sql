----------------------------------------------------------------
---- Crate trigger
----------------------------------------------------------------
create trigger tgr_updateEmployee
on employee
for update
as 
if UPDATE(Position) or UPDATE(Forname) or UPDATE(Surname) or UPDATE(HomeNumber) or UPDATE(MobileNumber)
or UPDATE(Email) or UPDATE(DOB) or UPDATE(KinName) or UPDATE(KinNumber) or UPDATE(BankName)
or UPDATE(AccountNumber) or UPDATE(IRDNumber) or UPDATE(PayRate) or UPDATE(TaxRate) or UPDATE(DriverLicenseNumber)
or UPDATE(DriverLicenseClass) or UPDATE(DriverLicenseExpiryDate) or UPDATE(DriverLicensePhoto) or UPDATE(SiteSafePhoto) or UPDATE(HireDate)
or UPDATE(ResignDate) or UPDATE(YearsInBCD) or UPDATE(YearsInIndustry) or UPDATE(Country) or UPDATE(City)
or UPDATE(Suburb) or UPDATE(Street) or UPDATE(PostCode) or UPDATE(Note)
begin
	insert into employee_history 
		select EmployeeID,Position,Forname,Surname,HomeNumber,MobileNumber,
			   Email,DOB,KinName,KinNumber,BankName,AccountNumber,IRDNumber,
			   PayRate,TaxRate,DriverLicenseNumber,DriverLicenseClass,
			   DriverLicenseExpiryDate,DriverLicensePhoto,SiteSafePhoto,
			   HireDate,ResignDate,YearsInBCD,YearsInIndustry,
			   Country,City,Suburb,Street,PostCode,Note,getdate()
		from deleted;
end
go