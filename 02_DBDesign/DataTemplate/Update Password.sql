use hrmsdb
go
update employee set password = pwdencrypt('aaa111') where employeeID=1
go