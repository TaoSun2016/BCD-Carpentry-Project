use HRMSDB
go
drop procedure sp_queryCertification
go
create procedure sp_queryCertification(
	@Q_Forename	varchar(50),
	@Q_Surname	varchar(50),
	@Q_Email		varchar(100),
	

	@EmployeeID	int output,
	@CopyFlag	int output,
	@LBP		int output,
	@Expiry		date output,
	@BCITONumber	varchar(50) output,
	@NZQANumber		varchar(50) output,
	@FirstAid		int output,
	@FallArrest		int output,
	@ConfindSpaces	int output,
	@Ramset			int output,
	@HILTI			int output,
	@LowScaff		int output,
	@WTR			int output,
	@EWP			int output,
	@HIAB			int output,
	@HT123			int output,
	@Dog			int output,
	@Crane			int output,
	@Chainsaw		int output,
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
			set @ErrMsg = 'Can not find the employee information!'
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
				set @ErrMsg = 'Can not find the employee information!'
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
	set	@CopyFlag=0
	set @LBP = 0
	set @Expiry =''
	set @BCITONumber=''	
	set @NZQANumber=''
	set @FirstAid = 0
	set @FallArrest = 0
	set @ConfindSpaces = 0
	set @Ramset = 0
	set @HILTI = 0
	set @LowScaff = 0
	set @WTR = 0
	set @EWP = 0
	set @HIAB = 0
	set @HT123 = 0
	set @Dog = 0
	set @Crane = 0
	set @Chainsaw = 0

	select @CopyFlag = CopyFlag,@LBP = LBP,@Expiry = Expiry, @BCITONumber = BCITONumber,@NZQANumber = NZQANumber,@FirstAid = FirstAid,@FallArrest = FallArrest,@ConfindSpaces = ConfindSpaces, @Ramset = Ramset,@HILTI = HILTI,@LowScaff = LowScaff, @WTR = WTR,@HIAB = HIAB,@HT123 = HT123,@Dog = Dog,@Crane = Crane,@Chainsaw = Chainsaw from CERTIFICATION where EmployeeID = @EmployeeID
	
	set @ErrCode = 0
	set @ErrMsg = 'Query certification information successfully!'
end

go