use HRMSDB
go
drop procedure sp_queryCompetency
go
create procedure sp_queryCompetency(
	@Q_Forename	varchar(50),
	@Q_Surname	varchar(50),
	@Q_Email		varchar(100),
	

	@EmployeeID	int output,
	@Forename	varchar(50) output,
	@Surname	varchar(50) output,
	@Position	varchar(10) output,
	@HireDate	date output,
	@YearsInIndustry	int output,
	@DriverLicenseClass	varchar(10) output,
	@SiteSafePhoto		varchar(255) output,
	@Qualifications		varchar(1024) output,
	@GeneralCompetency	varchar(7) output,
	@ToolCompetency		varchar(7) output,
	@ErrCode	int output,
	@ErrMsg		varchar(60)output)
as
begin
	declare @Count		int
	set @EmployeeID = 0
	set @Count = 0

	if @Q_Email is not null
	begin
		select @EmployeeID = EmployeeID, @Forename =Forename, @Surname = Surname, @Position = Position, @HireDate = HireDate, @YearsInIndustry = YearsInIndustry, @DriverLicenseClass = DriverLicenseClass, @SiteSafePhoto = SiteSafePhoto from EMPLOYEE where Email = @Q_Email and EmployeeStatus = 'Y';
		if @EmployeeID = 0
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Can not find the employee information!'
			return
		end
	end
	else
	begin
		if @Q_Forename is not null or @Q_Surname is not null
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
			select @EmployeeID = EmployeeID, @Forename =Forename, @Surname = Surname, @Position = Position, @HireDate = HireDate, @YearsInIndustry = YearsInIndustry, @DriverLicenseClass = DriverLicenseClass, @SiteSafePhoto = SiteSafePhoto  from EMPLOYEE where Forename = @Q_Forename and Surname = @Q_Surname and EmployeeStatus = 'Y'
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			return
		end
	end
	set @Qualifications = ''
	set @GeneralCompetency = ''
	set @ToolCompetency = ''

	select @Qualifications = Qualifications, @GeneralCompetency = GeneralCompetency, @ToolCompetency = ToolCompetency from COMPETENCY where EmployeeID = @EmployeeID
	
	set @ErrCode = 0;
	set @ErrMsg = 'Query employee and competency successfully!';
end

go