/***************************************
NAME:    EC_IT143_6.3_fwt_s5_ei
PURPOSE: Test results to see if they are as expected

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to keep track of when a record was last modified?
 
**************************************/

-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?
-- Q3: Did it work?
-- A3: Well, lets see...yup

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
NAME:    EC_IT143_6.3_fwt_s5_ei
PURPOSE: Test results to see if they are as expected

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
-- Q5: Did it work?
-- A5: Well, lets see...yup

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