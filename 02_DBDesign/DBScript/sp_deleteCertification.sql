use HRMSDB
go
drop procedure sp_deleteCertification
go
create procedure sp_deleteCertification(
	@EmployeeID			int,
	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	begin try
		delete from CERTIFICATION  where EmployeeID = @EmployeeID
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
		set @ErrCode = -1
		set @ErrMsg = 'Delete certification record error!'
		return
	end catch
	set @ErrCode = 0
	set @ErrMsg = 'Delete certification record successfully!'
end

go