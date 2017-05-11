use HRMSDB
go
drop procedure sp_addToolList
go
create procedure sp_addToolList(
	@Forename	varchar(50),
	@Surname	varchar(50),
	@Email		varchar(100),
	@ToolName	varchar(60),
	@RRP		money,
	@OnSite		char(1),
	@Need		char(1),
	@Competent	char(1),
	@RequireTraining char(1),
	

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
			set @ErrMsg = 'Can not find the employee information according email!'
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg);
			return
		end
	end
	else
	begin
		if @Forename is not null and @Forename !='' or @Surname is not null and @Surname !=''
		begin
			set @Count = (select count(*) from EMPLOYEE where Forename = @Forename and Surname = @Surname and EmployeeStatus = 'Y')
			if @Count = 0
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Can not find the employee information according name!'
				insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg);
				return
			end
			if @Count > 1
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Find more than one employees!'
				insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg);
				return				
			end
			select @EmployeeID = EmployeeID from EMPLOYEE where Forename = @Forename and Surname = @Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg);
			return
		end
	end
	begin try
		insert into TOOL_LIST  values (@EmployeeID,@ToolName,@RRP,@OnSite,@Need,@Competent,@RequireTraining);
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new tool list record error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new tool use list successfully!';
end

go