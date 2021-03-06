use HRMSDB
go
drop procedure sp_addToolUse
go
create procedure sp_addToolUse(
	@Forename	varchar(50),
	@Surname	varchar(50),
	@Email		varchar(100),
	@Date		date,
	@ToolName	varchar(60),
	@ToolNumber	varchar(20),
	@InOut		char(1),
	@Comment	varchar(120),
	

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	declare @EmployeeID int
	declare @Count		int
	set @EmployeeID = 0
	set @Count = 0

	if @Email is not null and @Email != ''
	begin
		select @EmployeeID = EmployeeID from EMPLOYEE where Email = @Email and EmployeeStatus = 'Y';
		if @EmployeeID = 0
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Can not find the employee information by email!'
			return
		end
	end
	else
	begin
		if @Forename is not null and @Forename != '' or @Surname is not null and @Surname != ''
		begin
			set @Count = (select count(*) from EMPLOYEE where Forename = @Forename and Surname = @Surname and EmployeeStatus = 'Y')
			if @Count = 0
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Can not find the employee information by name!'
				return
			end
			if @Count > 1
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Find more than one employees!'
				return				
			end
			select @EmployeeID = EmployeeID from EMPLOYEE where Forename = @Forename and Surname = @Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			return
		end
	end
	begin try
		insert into TOOL_USE_REGISTER  values (@EmployeeID,@Date,@ToolName,@ToolNumber,@InOut,@Comment);
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new tool use record error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new tool use record successfully!';
end

go