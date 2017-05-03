use HRMSDB
go
create procedure sp_addAttendance(
	@Forname	varchar(50),
	@Surname	varchar(50),
	@Email		varchar(100),
	@Year		int,
	@Month		int,
	@Day1		int,
	@Day2		int,
	@Day3		int,
	@Day4		int,
	@Day5		int,
	@Day6		int,
	@Day7		int,
	@Day8		int,
	@Day9		int,
	@Day10		int,
	@Day11		int,
	@Day12		int,
	@Day13		int,
	@Day14		int,
	@Day15		int,
	@Day16		int,
	@Day17		int,
	@Day18		int,
	@Day19		int,
	@Day20		int,
	@Day21		int,
	@Day22		int,
	@Day23		int,
	@Day24		int,
	@Day25		int,
	@Day26		int,
	@Day27		int,
	@Day28		int,
	@Day29		int,
	@Day30		int,
	@Day31		int,

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
		select @EmployeeID = EmployeeID from EMPLOYEE where Email = @Email;
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
			set @Count = (select count(*) from EMPLOYEE where Forname = @Forname and Surname = @Surname)
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
			select @EmployeeID = EmployeeID from EMPLOYEE where Forname = @Forname and Surname = @Surname
		end
		else
		begin
			set @ErrCode = -1
			set @ErrMsg = 'Please input employee''s information!'
			return
		end
	end
	begin try
		insert into ATTENDANCE  values (@EmployeeID,@Year,@Month,@Day1,@Day2,@Day3,@Day4,@Day5,@Day6,@Day7,@Day8,@Day9,@Day10
										,@Day11,@Day12,@Day13,@Day14,@Day15,@Day16,@Day17,@Day18,@Day19,@Day20
										,@Day21,@Day22,@Day23,@Day24,@Day25,@Day26,@Day27,@Day28,@Day29,@Day30,@Day31);
	end try
	begin catch
		insert into LOGTBL values (GETDATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());
		set @ErrCode = -1;
		set @ErrMsg = 'Add new attendance error!';
		return;
	end catch
	set @ErrCode = 0;
	set @ErrMsg = 'Add new attendance successfully!';
end

go