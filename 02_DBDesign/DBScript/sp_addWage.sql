use HRMSDB
go
drop procedure sp_addWage
go
create procedure sp_addWage(
	@Forename	varchar(50),
	@Surname	varchar(50),
	@Email		varchar(100),
	@WeekEndingDate	date,
	@Amount		real,
	@Travel		real,
	@Deduction	real,
	@GST		real,
	@WINZ		real,
	@IRD		real,

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
		select @EmployeeID = EmployeeID from EMPLOYEE where Email = @Email and EmployeeStatus = 'Y'
		if @EmployeeID = 0
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Can not find the employee information!'
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg)
			return
		end
	end
	else
	begin
		if @Forename is not null or @Surname is not null
		begin
			set @Count = (select count(*) from EMPLOYEE where Forename = @Forename and Surname = @Surname  and EmployeeStatus = 'Y')
			if @Count = 0
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Can not find the employee information!'
				insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg)
				return
			end
			if @Count > 1
			begin
				set @ErrCode = -1
				set @ErrMsg = 'Find more than one employees!'
				insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg)
				return				
			end
			select @EmployeeID = EmployeeID from EMPLOYEE where Forename = @Forename and Surname = @Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),@ErrMsg)
			return
		end
	end
	begin try
		insert into WAGE  values (@EmployeeID, @WeekEndingDate, @Amount, @Travel, @Deduction, @GST, @WINZ, @IRD)
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new record error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new record successfully!';
end

go