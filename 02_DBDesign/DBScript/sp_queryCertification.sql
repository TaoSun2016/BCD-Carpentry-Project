use HRMSDB
go
drop procedure sp_queryCertification
go
create procedure sp_queryCertification(
	@Q_Forename	varchar(50),
	@Q_Surname	varchar(50),
	@Q_Email		varchar(100),
	

	@EmployeeID	int output,
	@CopyFlag	char output,
	@LBP		char output,
	@Expiry		date output,
	@BCITONumber	varchar(50) output,
	@NZQANumber		varchar(50) output,
	@FirstAid		char output,
	@FallArrest		char output,
	@ConfindSpaces	char output,
	@Ramset			char output,
	@HILTI			char output,
	@LowScaff		char output,
	@WTR			char output,
	@EWP			char output,
	@HIAB			char output,
	@HT123			char output,
	@Dog			char output,
	@Crane			char output,
	@Chainsaw		char output,
	@ErrCode	int output,
	@ErrMsg		varchar(60)output)
as
begin
	declare @Count		int
	set @EmployeeID = 0
	set @Count = 0

	if @Q_Email is not null and @Q_Email != ''
	begin
		select @EmployeeID = EmployeeID from EMPLOYEE where Email = @Q_Email and EmployeeStatus = 'Y'
		if @EmployeeID = 0
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Can not find the employee information by email!'
			return
		end
	end
	else
	begin
		if @Q_Forename is not null and @Q_Forename != '' or @Q_Surname is not null and @Q_Surname != ''
		begin
			set @Count = (select count(*) from EMPLOYEE where Forename = @Q_Forename and Surname = @Q_Surname and EmployeeStatus = 'Y')
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
			select @EmployeeID = EmployeeID from EMPLOYEE where Forename = @Q_Forename and Surname = @Q_Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			return
		end
	end
	select @CopyFlag = CopyFlag,@LBP = LBP,@Expiry = Expiry, @BCITONumber = BCITONumber,@NZQANumber = NZQANumber,@FirstAid = FirstAid,@FallArrest = FallArrest,@ConfindSpaces = ConfindSpaces, @Ramset = Ramset,@HILTI = HILTI,@LowScaff = LowScaff, @WTR = WTR,@EWP = EWP,@HIAB = HIAB,@HT123 = HT123,@Dog = Dog,@Crane = Crane,@Chainsaw = Chainsaw from CERTIFICATION where EmployeeID = @EmployeeID
	
	set @ErrCode = 0
	set @ErrMsg = 'Query certification information successfully!'
end

go