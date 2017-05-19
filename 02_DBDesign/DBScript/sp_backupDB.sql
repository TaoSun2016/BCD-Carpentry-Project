USE [testdb] 
GO 

SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
 
CREATE PROCEDURE [dbo].[sp_backupDB]  
            @DBName		varchar(300),
            @BackupPath	nvarchar(200) 
AS
BEGIN 
       SET NOCOUNT ON;        
        -- Declare variables
        DECLARE @BackupName varchar(100)
        DECLARE @BackupFile varchar(100)

        DECLARE @sqlCommand NVARCHAR(1000) 
        DECLARE @DateTime NVARCHAR(20)

		-- Set the current date and time n yyyyhhmmss format
		SET @DateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),101),'/','') + '_' +  REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')  
		SET @BackupFile = @BackupPath + @DBName + @DateTime+ '.BAK'
        SET @BackupName = @DBName + ' full backup for ' + @DateTime
		-- Generate the dynamic SQL command to be executed
        SET @sqlCommand = 'BACKUP DATABASE ' +@DBName+  ' TO DISK = '''+@BackupFile+ ''' WITH INIT, NAME= ''' +@BackupName+''', NOSKIP, NOFORMAT'
		-- Execute the generated SQL command
		EXEC(@sqlCommand)
END