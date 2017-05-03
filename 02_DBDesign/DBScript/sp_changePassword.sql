use HRMSDB
go
create procedure sp_changePassword(
	@UserName varchar(100),
	@OldPassword varchar(16),
	@NewPassword varchar(16),
	@ErrCode int output,
	@ErrMsg varchar(60)output)
as

declare @count int;
declare @orig_password varbinary(256);
declare @result int;

select @count = count(employeeid) from Employee where Email=ltrim(RTRIM(@UserName)) and EmployeeStatus='Y'
if (@count < 1)
begin
	set @ErrCode=-1
	set @ErrMsg = 'There''s no this user name!'
end
else
begin
    select @orig_password = password from EMPLOYEE where Email=ltrim(RTRIM(@UserName)) and EmployeeStatus='Y'
	
	set @result =  PWDCOMPARE( LTRIM(RTRIM(@OldPassword)),@orig_password)
	if(1 = @result)
	begin
		begin try
			update EMPLOYEE set password = pwdencrypt(@NewPassword) where Email=ltrim(RTRIM(@UserName)) and EmployeeStatus='Y'
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
			set @ErrCode=-1;
			set @ErrMsg = 'Failed to update new password!'
			return
		end catch
		set @ErrCode=0;
		set @ErrMsg = 'Login successfully!'
	end
	else
	begin
		set @ErrCode=-1;
		set @ErrMsg = 'Failed to verify the old password!'
	end

end
go