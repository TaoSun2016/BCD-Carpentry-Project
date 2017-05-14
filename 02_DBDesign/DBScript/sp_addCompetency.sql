use HRMSDB
go
drop procedure sp_addCompetency
go
create procedure sp_addCompetency(
	@EmployeeID			int,
	@Qualifications		varchar(1024),
	@GeneralCompetency	varchar(7),
	@ToolCompetency		varchar(7),
	

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	if exists(select EmployeeID from Competency where EmployeeID = @EmployeeID)
	begin
		begin try
			update COMPETENCY  set Qualifications = @Qualifications, GeneralCompetency = @GeneralCompetency, ToolCompetency = @ToolCompetency where EmployeeID = @EmployeeID
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			set @ErrCode = -1
			set @ErrMsg = 'Update competency record error!'
			return
		end catch
		set @ErrCode = 0
		set @ErrMsg = 'Update competency record successfully!'
	end
	else
	begin
		begin try
			insert into COMPETENCY  values (@EmployeeID, @Qualifications, @GeneralCompetency, @ToolCompetency)
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			set @ErrCode = -1
			set @ErrMsg = 'Add new competency record error!'
			return
		end catch
		set @ErrCode = 0
		set @ErrMsg = 'Add new competency record successfully!'
	end

end

go