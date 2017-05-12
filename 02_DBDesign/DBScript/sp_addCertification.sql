use HRMSDB
go
drop procedure sp_addCertification
go
create procedure sp_addCertification(
	@EmployeeID			int,
	@CopyFlag	char,
	@LBP		char,
	@Expiry		date,
	@BCITONumber	varchar(50),
	@NZQANumber		varchar(50),
	@FirstAid		char,
	@FallArrest		char,
	@ConfindSpaces	char,
	@Ramset			char,
	@HILTI			char,
	@LowScaff		char,
	@WTR			char,
	@EWP			char,
	@HIAB			char,
	@HT123			char,
	@Dog			char,
	@Crane			char,
	@Chainsaw		char,

	@ErrCode int output,
	@ErrMsg varchar(60)output)
as
begin
	if exists(select EmployeeID from CERTIFICATION where EmployeeID = @EmployeeID)
	begin
		begin try
			update CERTIFICATION  set CopyFlag = @CopyFlag, LBP = @LBP, Expiry = case @Expiry when '' then null else @Expiry end, BCITONumber = @BCITONumber, NZQANumber = @NZQANumber, FirstAid = @FirstAid, FallArrest = @FallArrest, ConfindSpaces = @ConfindSpaces, Ramset = @Ramset, HILTI = @HILTI, LowScaff = @LowScaff, WTR = @WTR, EWP = @EWP, HIAB = @HIAB, HT123 = @HT123, Dog = @Dog, Crane = @Crane, Chainsaw = @Chainsaw where EmployeeID = @EmployeeID
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			set @ErrCode = -1
			set @ErrMsg = 'Update certification record error!'
			return
		end catch
	end
	else
	begin
		begin try
			insert into CERTIFICATION  values (@EmployeeID,@CopyFlag,@LBP,case @Expiry when '' then null else @Expiry end,@BCITONumber,@NZQANumber,@FirstAid,@FallArrest,@ConfindSpaces,@Ramset,@HILTI,@LowScaff,@WTR,@EWP,@HIAB,@HT123,@Dog,@Crane,@Chainsaw )
		end try
		begin catch
			insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			set @ErrCode = -1
			set @ErrMsg = 'Add new certification record error!'
			return
		end catch
	end
	set @ErrCode = 0
	set @ErrMsg = 'Add/Update new certification record successfully!'
end

go