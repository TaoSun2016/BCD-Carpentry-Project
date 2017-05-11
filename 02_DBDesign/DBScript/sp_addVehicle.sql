use HRMSDB
go
drop procedure sp_addVehicle
go
create procedure sp_addVehicle(
	@RegisterNumber		varchar(10),
	@WOFDueDate			date,
	@ServiceDue			int,
	@REGODueDate		date,
	@FuelCardNumber		varchar(30),
	@GPSSerialNumber	varchar(60),
	@SIMCardNumber		varchar(60),
	@SaleAgreement		int,
	@OwnershipChanged	int,
	@Insured			int,
	@GPSInstalled		int,

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	begin try
		insert into VEHICLE  values (@RegisterNumber,@SaleAgreement,@OwnershipChanged,@Insured,@WOFDueDate,@ServiceDue,@REGODueDate,@FuelCardNumber,@GPSInstalled,@GPSSerialNumber,@SIMCardNumber);
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new vehicle error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new vehicle successfully!';
end

go