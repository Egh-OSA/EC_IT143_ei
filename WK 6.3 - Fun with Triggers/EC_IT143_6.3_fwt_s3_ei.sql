/***************************************
NAME:    EC_IT143_6.3_fwt_s3_ei
PURPOSE: Research and test a solution

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to keep track of when a record was last modified?
 
**************************************/

-- Q1: How to keep track of when a record was last modified?
-- A1: This works for the initial INSERT...

-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data

-- Research Sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/getdate-transact-sql



/***************************************
NAME:    EC_IT143_6.3_fwt_s3_ei
PURPOSE: Research and test a solution

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to keep track of who last modified a record?
 
**************************************/

-- Q1: How to keep track of who last modified a record?
-- A1: This works for server user and the initial INSERT...

-- Q2: How to keep track of who last modified a record?
-- A2: Maybe use an after update trigger?
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data

-- Research Sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/suser-name-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql

-- Test SQL Server login name
SELECT SUSER_NAME() AS user_login;