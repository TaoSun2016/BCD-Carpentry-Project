use HRMSDB
go
drop procedure sp_login
go
create procedure sp_login(
	@UserName	varchar(100),
	@Password	varchar(16),

	@Forename	varchar(50) output,
	@Surname	varchar(50)	output,
	@LogTime	datetime	output,
	@ErrCode	int			output,
	@ErrMsg		varchar(60)	output)
as

declare @count int
declare @orig_password varbinary(256)
declare @log_status char(1)
declare @result int


select @count = count(employeeid) from Employee where Email=ltrim(RTRIM(@UserName)) and EmployeeStatus='Y'
if (@count < 1)
begin
	set @ErrCode=-1
	set @ErrMsg = 'There''s no this user name!'
end
else
begin
    select @Forename = Forename, @Surname = Surname, @orig_password = password, @log_status = LogStatus from Employee where Email=ltrim(RTRIM(@UserName))  and EmployeeStatus='Y'
	--if('Y'= @log_status)
	--begin
	--	set @ErrCode=-1
	--	set @ErrMsg = 'Already Login before!'
	--	return
	--end
	--else
	begin
		set @result =  PWDCOMPARE( LTRIM(RTRIM(@Password)),@orig_password)
		if(1 = @result)
		begin
			set @LogTime = getdate()
			update EMPLOYEE set LogTime=@LogTime,LogStatus='Y' where Email = ltrim(RTRIM(@UserName))
			set @ErrCode=0
			set @ErrMsg = 'Login successfully!'

			declare @UpdateYear varchar(60)
			select @UpdateYear = Value from SYS_PARAMETERS where ID = 'UpdateYear'

			if YEAR(@LogTime)!= @UpdateYear and @UpdateYear is not null
			begin
				update EMPLOYEE set YearsInIndustry = YearsInIndustry + 1
				update SYS_PARAMETERS set Value = YEAR(@LogTime) where ID = 'UpdateYear'
			end
		end
		else
		begin
			set @ErrCode=-1
			set @ErrMsg = 'Error password!'
			return
		end
	end
end
go