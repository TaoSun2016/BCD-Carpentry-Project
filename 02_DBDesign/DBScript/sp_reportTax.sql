use HRMSDB
go
drop procedure sp_reportTax
go
create procedure sp_reportTax(
	@BeginWeekEnding	date,
	@EndWeekEnding		date,
	@ErrCode			int output,
	@ErrMsg				varchar(60)	output)
as
begin
	declare	@OldEmployeeID	int
	declare @OldWeekEndingDate	date
	declare	@SeqNumber		int
	declare @EmployeeID		int
	declare @WeekEndingDate	date
	declare @Category		int
	declare @Amount			money
	declare @Note			varchar(256)

	declare @Forename		varchar(50)
	declare @Surname		varchar(50)
	declare @IRDNumber		varchar(20)
	declare	@TaxRate		int

	declare @WageAmount		money
	declare @TaxAmount		money
	declare @GSTAmount		money
	declare @DeductionAmount	money
	declare @DeductionNote	varchar(256)

	declare @SubWage	money			---subtotal of wage
	declare @SubTax		money			---subtotal of tax
	declare	@SubGST		money			---subtotal of GST
	declare @SubDeduction	money		---subtotal of deduction

	declare @GrandWage	money			---grand total of wage
	declare @GrandTax	money			---grand total of of tax
	declare @GrandDeduction	money		---grand total of of deduction
	declare @GrandGST	money			---grand total of of GST

	declare @count int
	set @count = 0
	declare cur_tax cursor for select * from TAX where WeekEndingDate between @BeginWeekEnding and @EndWeekEnding order by EmployeeID, WeekEndingDate, Category for read only

	set @SeqNumber = 0;
	set @OldEmployeeID = -1
	set @OldWeekEndingDate = ''
	set @WageAmount = 0.00
	set @TaxAmount = 0.00
	set @GSTAmount = 0.00
	set @DeductionAmount = 0.00

	set @SubWage = 0.00
	set @SubTax = 0.00
	set @SubGST = 0.00
	set @SubDeduction = 0.00

	set @GrandWage = 0.00
	set @GrandTax = 0.00
	set @GrandDeduction = 0.00
	set @GrandGST = 0.00

	delete from TAX_REPORT

	open cur_tax
	fetch next from cur_tax into @EmployeeID, @WeekEndingDate, @Category, @Amount, @Note
	while @@FETCH_STATUS = 0
	begin
		select @Forename = Forename, @Surname = Surname, @IRDNumber = IRDNumber, @TaxRate = TaxRate from EMPLOYEE where EmployeeID = @EmployeeID
		if @EmployeeID != @OldEmployeeID and @OldEmployeeID != -1
		begin
			select @Forename = Forename, @Surname = Surname, @IRDNumber = IRDNumber, @TaxRate = TaxRate from EMPLOYEE where EmployeeID = @OldEmployeeID
			set @SeqNumber = @SeqNumber + 1
			insert into TAX_REPORT values (@SeqNumber,@Forename,@Surname,@IRDNumber,@TaxRate,@OldWeekEndingDate, @WageAmount,@TaxAmount,@GSTAmount,@DeductionAmount,@DeductionNote)
			set @SeqNumber = @SeqNumber + 1
			insert into TAX_REPORT values (@SeqNumber,'Subtotal:',null,null,null,null,@SubWage, @SubTax, @SubGST, @SubDeduction,null)
			set @OldEmployeeID = @EmployeeID
			select @Forename = Forename, @Surname = Surname, @IRDNumber = IRDNumber, @TaxRate = TaxRate from EMPLOYEE where EmployeeID = @EmployeeID
			set @SubWage = 0.00
			set @SubTax = 0.00
			set @SubGST = 0.00
			set @SubDeduction = 0.00
			set @OldWeekEndingDate = @WeekEndingDate
		end

		if @WeekEndingDate != @OldWeekEndingDate and @OldEmployeeID != -1
		begin
			set @SeqNumber = @SeqNumber + 1
			insert into TAX_REPORT values (@SeqNumber,@Forename,@Surname,@IRDNumber,@TaxRate,@OldWeekEndingDate, @WageAmount,@TaxAmount,@GSTAmount,@DeductionAmount,@DeductionNote)
			set @WageAmount = 0.00
			set @TaxAmount = 0.00
			set @GSTAmount = 0.00
			set @DeductionAmount = 0.00
			set @DeductionNote = ''
			set @OldWeekEndingDate = @WeekEndingDate
		end 
	
		if @Category = 1  --gross wage
		begin
			set @WageAmount = @Amount
			set @SubWage = @SubWage + @Amount
			set @GrandWage = @GrandWage + @Amount
		end
		else if @Category = 2 --tax
		begin
			set @TaxAmount = @Amount
			set @SubTax = @SubTax + @Amount
			set @GrandTax = @GrandTax + @Amount
		end
		else if @Category = 3  --GST
		begin
			set @GSTAmount = @Amount
			set @SubGST = @SubGST + @Amount
			set @GrandGST = @GrandGST + @Amount
		end
		else if @Category = 4  --Deduction
		begin
			set @DeductionAmount = @Amount
			set @DeductionNote = @Note
			set @SubDeduction = @SubDeduction + @Amount
			set @GrandDeduction = @GrandDeduction + @Amount
		end
	
		set @OldWeekEndingDate = @WeekEndingDate
		set @OldEmployeeID = @EmployeeID
		fetch next from cur_tax into @EmployeeID, @WeekEndingDate, @Category, @Amount, @Note
	end
	close cur_tax
	deallocate cur_tax

	set @SeqNumber = @SeqNumber + 1
	insert into TAX_REPORT values (@SeqNumber,@Forename,@Surname,@IRDNumber,@TaxRate,@OldWeekEndingDate,@WageAmount,@TaxAmount,@GSTAmount,@DeductionAmount,@DeductionNote)

	set @SeqNumber = @SeqNumber + 1
	insert into TAX_REPORT values (@SeqNumber,'Subtotal:',null,null,null,null,@SubWage, @SubTax, @SubGST, @SubDeduction,null)

	set @SeqNumber = @SeqNumber + 1
	insert into TAX_REPORT values (@SeqNumber,'Grand Total:',null,null,null,null,@GrandWage, @GrandTax, @GrandGST, @GrandDeduction,null)
	set @ErrCode = 0
	set @ErrMsg = 'Success'
end
go