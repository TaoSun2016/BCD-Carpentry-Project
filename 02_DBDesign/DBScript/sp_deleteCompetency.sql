use HRMSDB
go
drop procedure sp_deleteCompetency
go
create procedure sp_deleteCompetency(
	@EmployeeID			int,
	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	if exists (select * from COMPETENCY where EmployeeID = @EmployeeID)
	begin
		begin try
			delete from COMPETENCY  where EmployeeID = @EmployeeID
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			set @ErrCode = -1
			set @ErrMsg = 'Delete competency record error!'
			return
		end catch
		set @ErrCode = 0
		set @ErrMsg = 'Delete competency record successfully!'
		end
	else
	begin
		set @ErrCode = -1
		set @ErrMsg = 'Competency record does not exist!EmployeeID=' + CAST(@EmployeeID as char)
	end
end

go