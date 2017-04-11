CREATE DATABASE HRMSDB
go
Use HRMSDB
go

CREATE TABLE EMPLOYEE (
  EmployeeID              int  IDENTITY(1,1) NOT NULL, 
  Position                varchar(10) NOT NULL, 
  Forname                 varchar(50) NOT NULL, 
  Surname                 varchar(50) NOT NULL, 
  HomeNumber              varchar(20) NULL, 
  MobileNumber            varchar(20) NOT NULL, 
  Email                   varchar(100) NOT NULL, 
  DOB                     date NOT NULL, 
  KinName                 varchar(100) NULL, 
  KinNumber               varchar(20) NULL, 
  BankName                varchar(30) NOT NULL, 
  AccountNumber           varchar(30) NOT NULL, 
  IRDNumber               varchar(20) NOT NULL, 
  PayRate                 int NOT NULL CHECK(PayRate > 0), 
  TaxRate                 int NOT NULL CHECK(TaxRate >= 0), 
  DriverLicenseNumber     varchar(30) NULL, 
  DriverLicenseClass      varchar(10) NULL, 
  DriverLicenseExpiryDate date NULL, 
  DriverLicensePhoto      varchar(255) NULL, 
  SiteSafePhoto           varchar(255) NULL, 
  HireDate                date NOT NULL, 
  ResignDate              date NULL, 
  YearsInBCD              int NOT NULL, 
  YearsInIndustry         int NOT NULL, 
  Country                 varchar(30) NOT NULL, 
  City                    varchar(30) NOT NULL, 
  Suburb                  varchar(30) NULL, 
  Street                  varchar(100) NOT NULL, 
  PostCode                varchar(10) NULL, 
  Note                    varchar(255) NULL, 
  PassWord                varchar(60) NULL, 
  LogTime                 datetime NULL, 
  State                   char(1) NOT NULL, 
  PRIMARY KEY (EmployeeID));
go

CREATE TABLE INDIVIDUAL_DEBT (
  EmployeeID      int NOT NULL, 
  [Date]          date NOT NULL, 
  [INV#]          varchar(30) NULL, 
  Company         varchar(60) NULL, 
  Item            varchar(60) NULL, 
  Amount          float(16) NULL, 
  DeductionAmount float(16) NULL, 
  WINZ            float(16) NULL, 
  IRD             float(16) NULL, 
  InvoiceFlag     int NULL, 
  ATPAFlag        int NULL, 
  Description     varchar(120) NULL);
go
CREATE TABLE UNIFORM (
  EmployeeID int NOT NULL, 
  Category   varchar(20) NOT NULL, 
  [SIZE]     varchar(15) NOT NULL, 
  PRIMARY KEY (EmployeeID, 
  Category));
go
CREATE TABLE COURSE (
  EmployeeID   int NOT NULL, 
  CourseName   varchar(60) NOT NULL, 
  [Date]       date NOT NULL, 
  Company      varchar(60) NOT NULL, 
  DebtEntered  int DEFAULT 0 NOT NULL CHECK(DebtEntered in (0,1)), 
  CertReceived int DEFAULT 0 NOT NULL CHECK(CertReceived in (0,1)), 
  Copied       int DEFAULT 0 NOT NULL CHECK(Copied in (0,1)), 
  Scanned      int DEFAULT 0 NOT NULL CHECK(Scanned in (0,1)), 
  Presented    int DEFAULT 0 NOT NULL CHECK(Presented in (0,1)), 
  PRIMARY KEY (EmployeeID, 
  CourseName, 
  [Date]));
go
CREATE TABLE ATTENDANCE (
  EmplyeeID int NOT NULL, 
  [Date]    date NOT NULL, 
  Attended  int NOT NULL CHECK(Attended in (0,1)), 
  PRIMARY KEY (EmplyeeID, 
  [Date]));
go
CREATE TABLE TOOL_USER_EGISTER (
  ToolNumber varchar(20) NOT NULL, 
  [Date]     date NOT NULL, 
  EmployeeID int NOT NULL, 
  InOut      char(1) NOT NULL CHECK(InOut in ('I','O')), 
  ToolName   varchar(60) NOT NULL, 
  Comment    varchar(120) NULL, 
  PRIMARY KEY (ToolNumber, 
  [Date], 
  EmployeeID, 
  InOut));
go
CREATE TABLE WAGE (
  EmployeeID     int NOT NULL, 
  WeekEndingDate date NOT NULL, 
  Amount         float(16) DEFAULT 0.00 NOT NULL CHECK(Amount >= 0.00), 
  Travel         float(16) DEFAULT 0.00 NOT NULL CHECK(Travel >= 0.00), 
  Deduction      float(16) DEFAULT 0.00 NOT NULL CHECK(Deduction >= 0.00), 
  GST            float(16) DEFAULT 0.00 NOT NULL CHECK(GST >= 0.00), 
  WINZ           float(16) DEFAULT 0.00 NOT NULL CHECK(WINZ >= 0.00), 
  IRD            float(16) DEFAULT 0.00 NOT NULL CHECK(IRD >= 0.00), 
  PRIMARY KEY (EmployeeID, 
  WeekEndingDate));
go
CREATE TABLE COMPETENCY (
  EmployeeID        int NOT NULL, 
  [Date]            date NOT NULL, 
  GeneralCompetency varchar(7) NOT NULL CHECK(GeneralCompetency in ('LOW','AVERAGE','HIGH')), 
  ToolCompetency    varchar(7) NOT NULL CHECK(ToolCompetency in ('LOW','AVERAGE','HIGH')), 
  PRIMARY KEY (EmployeeID, 
  [Date]));
go
CREATE TABLE CERTIFICATION (
  EmployeeID     int NOT NULL, 
  CertCategory   varchar(60) NOT NULL, 
  CertGetDate    date NOT NULL, 
  CertExpiryDate date NULL, 
  CertNumber     varchar(60) NULL, 
  CopyFlag       int DEFAULT 0 NOT NULL CHECK(CopyFlag in (0,1)), 
  Comments       varchar(120) NULL, 
  PRIMARY KEY (EmployeeID, 
  CertCategory, 
  CertGetDate));
go
CREATE TABLE TOOL_LIST (
  EmployeeID      int NOT NULL, 
  ToolName        varchar(60) NOT NULL, 
  RRP             float(16) NULL, 
  OnSite          int DEFAULT 0 NOT NULL CHECK(OnSite in (0,1)), 
  Need            int DEFAULT 0 NOT NULL CHECK(Need in (0,1)), 
  Compitenet      int DEFAULT 0 NOT NULL CHECK(Compitenet in (0,1)), 
  RequireTraining int DEFAULT 0 NOT NULL CHECK(RequireTraining in (0,1)), 
  Purchased       int DEFAULT 0 NOT NULL CHECK(Purchased in (0,1)), 
  PRIMARY KEY (EmployeeID, 
  ToolName));
go
CREATE TABLE TOOL_CATEGORY (
  ToolName     varchar(60) NOT NULL, 
  Descriptiion varchar(120) NULL, 
  PRIMARY KEY (ToolName));
go
CREATE TABLE POSITION (
  PositionName varchar(10) NOT NULL, 
  Description  varchar(120) NULL, 
  PRIMARY KEY (PositionName));
go
CREATE TABLE TOOL_TRAINING (
  [Date]       date NOT NULL, 
  TrainingType int NOT NULL CHECK(TrainingType in (1,2,3)), 
  EmployeeID   int NOT NULL, 
  PRIMARY KEY ([Date], 
  TrainingType, 
  EmployeeID));
go

CREATE TABLE VEHICLE (
  RegisterNumber   varchar(10) NOT NULL, 
  SaleAgreement    int DEFAULT 0 NOT NULL CHECK(SaleAgreement in (0,1)), 
  OwnershipChanged int DEFAULT 0 NOT NULL CHECK(OwnershipChanged in (0,1)), 
  Insured          int DEFAULT 0 NOT NULL CHECK(Insured in (0,1)), 
  WOFDueDate       date NOT NULL, 
  ServiceDue       int NOT NULL, 
  REGODueDate      date NOT NULL, 
  FuelCardNumber   varchar(30) NULL, 
  GPSInstalled     int DEFAULT 0 NOT NULL CHECK(GPSInstalled in (0,1)), 
  GPSSerialNumber  varchar(60) NULL, 
  SimCardNumber    varchar(60) NULL, 
  PRIMARY KEY (RegisterNumber));
go
CREATE TABLE EMPLOYEE_HISTORY (
  EmployeeID              int NOT NULL, 
  Position                varchar(10) NOT NULL, 
  Forname                 varchar(50) NOT NULL, 
  Surname                 varchar(50) NOT NULL, 
  HomeNumber              varchar(20) NULL, 
  MobileNumber            varchar(20) NOT NULL, 
  Email                   varchar(100) NOT NULL, 
  DOB                     date NOT NULL, 
  KinName                 varchar(100) NULL, 
  KinNumber               varchar(20) NULL, 
  BankName                varchar(30) NOT NULL, 
  AccountNumber           varchar(30) NOT NULL, 
  IRDNumber               varchar(20) NOT NULL, 
  PayRate                 int NOT NULL, 
  TaxRate                 int NOT NULL, 
  DriverLicenseNumber     varchar(30) NULL, 
  DriverLicenseClass      varchar(10) NULL, 
  DriverLicenseExpiryDate date NULL, 
  DriverLicensePhoto      varchar(255) NULL,
  SiteSafePhoto           varchar(255) NULL, 
  HireDate                date NOT NULL, 
  ResignDate              date NULL, 
  YearsInBCD              int NOT NULL, 
  YearsInIndustry         int NOT NULL, 
  Country                 varchar(30) NOT NULL, 
  City                    varchar(30) NOT NULL, 
  Suburb                  varchar(30) NULL, 
  Street                  varchar(100) NOT NULL, 
  PostCode                varchar(10) NULL, 
  Note                    varchar(255) NULL, 
  ModTime                 datetime NOT NULL);
go
CREATE TABLE TIME_SHEET (
  EmployeeID     int NOT NULL, 
  WorkEndingDate date NOT NULL, 
  MainContractor varchar(60) NOT NULL, 
  JobName        varchar(60) NOT NULL, 
  [Date]         date NOT NULL, 
  Description    varchar(255) NOT NULL, 
  StartTime      time NOT NULL, 
  EndTime        time NOT NULL, 
  Hours          float(10) DEFAULT 0.00 NOT NULL CHECK(Hours >= 0.00));
go

CREATE TABLE SYS_PARAMETER(
  Name   varchar(30) NOT NULL, 
  Value  varchar(60) NOT NULL, 
  Description varchar(255) NULL, 
  PRIMARY KEY (Name));
go

INSERT INTO SYS_PARAMETER VALUES ('UPD_YEAR','2017','The year when the YearsInIndustry is updated.')
go

ALTER TABLE UNIFORM ADD CONSTRAINT FK_UNIFORM_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE WAGE ADD CONSTRAINT FK_WAGE_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE TOOL_USER_EGISTER ADD CONSTRAINT FK_TOOLUSER_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE TOOL_LIST ADD CONSTRAINT FK_TOOLLIST_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE TOOL_TRAINING ADD CONSTRAINT FK_TOOLTRAINING_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE COURSE ADD CONSTRAINT FK_COURSE_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE CERTIFICATION ADD CONSTRAINT FK_CERTIFICATION_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE INDIVIDUAL_DEBT ADD CONSTRAINT FK_INDIVIDUALDEBT_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE COMPETENCY ADD CONSTRAINT FK_COMPETENCY_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE TOOL_USER_EGISTER ADD CONSTRAINT FK_TOOLUSER_CATEGORY FOREIGN KEY (ToolName) REFERENCES TOOL_CATEGORY (ToolName);
ALTER TABLE TOOL_LIST ADD CONSTRAINT FK_TOOLLIST_CATEGORY FOREIGN KEY (ToolName) REFERENCES TOOL_CATEGORY (ToolName);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_POSITION FOREIGN KEY (Position) REFERENCES POSITION (PositionName);
ALTER TABLE ATTENDANCE ADD CONSTRAINT FK_ATTENDANCE_EMPLOYEE FOREIGN KEY (EmplyeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE EMPLOYEE_HISTORY ADD CONSTRAINT FK_EMPLOYEEHIST_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
ALTER TABLE TIME_SHEET ADD CONSTRAINT FK_TIMESHEET_EMPLOYEE FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID);
go

create trigger tgr_update_employee
on employee
for update
as 
insert into employee_history 
select EmployeeID,Position,Forname,Surname,HomeNumber,MobileNumber,
       Email,DOB,KinName,KinNumber,BankName,AccountNumber,IRDNumber,
	   PayRate,TaxRate,DriverLicenseNumber,DriverLicenseClass,
	   DriverLicenseExpiryDate,DriverLicensePhoto,SiteSafePhoto,
	   HireDate,ResignDate,YearsInBCD,YearsInIndustry,
	   Country,City,Suburb,Street,PostCode,Note,getdate() from deleted;
go