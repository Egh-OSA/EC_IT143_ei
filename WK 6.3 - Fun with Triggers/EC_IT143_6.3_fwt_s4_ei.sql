/***************************************
NAME:    dbo.trg_hello_world_last_mod
PURPOSE: Hello World - Last Modified By Trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Keep track of the last modified date for each row in the table
 
**************************************/

CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS

UPDATE dbo.t_hello_world
   SET last_modified_date = GETDATE()
 WHERE my_message IN
(
    SELECT DISTINCT
           my_message
      FROM Inserted
);
GO



/***************************************
NAME:    EC_IT143_6.3_fwt_s4_ei
PURPOSE: Create trigger to track last modified by

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

ALTER TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS

UPDATE dbo.t_hello_world
   SET last_modified_by   = SUSER_NAME()
     , last_modified_date = GETDATE()
 WHERE my_message IN
(
    SELECT DISTINCT
           my_message
      FROM Inserted
);
GO