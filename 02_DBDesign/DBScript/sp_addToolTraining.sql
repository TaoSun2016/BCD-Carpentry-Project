use HRMSDB
go
create procedure sp_addToolTraining(
	@Forname	varchar(50),
	@Surname	varchar(50),
	@Email		varchar(100),
	@Date		date,
	@TrainingType int,
	

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	declare @EmployeeID int
	declare @Count		int
	set @EmployeeID = 0
	set @Count = 0

	if @Email is not null
	begin
		select @EmployeeID = EmployeeID from EMPLOYEE where Email = @Email and EmployeeStatus = 'Y';
		if @EmployeeID = 0
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Can not find the employee information!'
			return
		end
	end
	else
	begin
		if @Forname is not null or @Surname is not null
		begin
			set @Count = (select count(*) from EMPLOYEE where Forname = @Forname and Surname = @Surname and EmployeeStatus = 'Y')
			if @Count = 0
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Can not find the employee information!'
				return
			end
			if @Count > 1
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Find more than one employees!'
				return				
			end
			select @EmployeeID = EmployeeID from EMPLOYEE where Forname = @Forname and Surname = @Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			return
		end
	end
	begin try
		insert into TOOL_TRAINING  values (@Date,@TrainingType,@EmployeeID);
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new tool training record error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new tool training record successfully!';
end

go