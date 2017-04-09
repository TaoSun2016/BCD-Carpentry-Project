----------------------------------------------------------------
---- Crate database user
----------------------------------------------------------------
use HRMSDB
go
create login hrms with password='aaa111', default_database=HRMSDB
create user hrms for login hrms with default_schema=dbo
exec sp_addrolemember 'db_owner', 'hrms'
go