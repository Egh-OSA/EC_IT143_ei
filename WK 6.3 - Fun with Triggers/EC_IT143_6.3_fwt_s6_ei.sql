/***************************************
NAME:    EC_IT143_6.3_fwt_s6_ei
PURPOSE: Ask the next question

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to keep track of who last modified a record?
 
**************************************/

-- Q4: How to keep track of who last modified a record?
-- A4: This works for server user and the initial INSERT...

-- Remove stuff if it is already there
DELETE FROM dbo.t_hello_world
 WHERE my_message IN ('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world(my_message)
VALUES ('Hello World2'), ('Hello World3');

-- See if the trigger worked
SELECT t.*
  FROM dbo.t_hello_world AS t;

-- Try it again
UPDATE dbo.t_hello_world
   SET my_message = 'Hello World4'
 WHERE my_message = 'Hello World3';

-- See if the trigger worked
SELECT t.*
  FROM dbo.t_hello_world AS t;



  /***************************************
NAME:    EC_IT143_6.3_fwt_s6_ei
PURPOSE: Ask the next question

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to keep track of who last modified a record?
 
**************************************/

-- Q: How to keep track of who last modified a record?
-- A: A trigger using SUSER_NAME() automatically stores the SQL Server
--    login name whenever a record is updated

-- Q: How do I keep track of BOTH who modified a record AND when?
-- A: Update the trigger to set both last_modified_by AND last_modified_date together

SELECT t.*
  FROM dbo.t_hello_world AS t;