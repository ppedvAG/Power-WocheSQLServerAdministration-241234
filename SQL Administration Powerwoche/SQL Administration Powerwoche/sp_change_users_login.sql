EXEC sp_change_users_login 'Report';

--Create the new login.  
CREATE LOGIN MaryB WITH PASSWORD = '982734snfdHHkjj3';  
GO  
--Map database user MB-Sales to login MaryB.  
USE AdventureWorks2022;  
GO  
EXEC sp_change_users_login 'Update_One', 'MB-Sales', 'MaryB';  
GO

USE AdventureWorks2022;  
GO  
EXEC sp_change_users_login 'Auto_Fix', 'Mary', NULL, 'B3r12-3x$098f6';  
GO

use whoamiDB--fehlendes Login anlegen
EXEC sp_change_users_login 'Auto_Fix', 'JamesBond',NULL,'ppedv2023!'

--Login zuweisen, das aber dummerweise eine andere SID besitzt
EXEC sp_change_users_login 'Update_One','JamesBond','JamesBond'