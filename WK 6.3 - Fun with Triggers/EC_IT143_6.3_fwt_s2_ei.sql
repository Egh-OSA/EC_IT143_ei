/***************************************
NAME:    EC_IT143_6.3_fwt_s2_ei
PURPOSE: Begin creating an answer

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

ALTER TABLE dbo.t_hello_world
ADD last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?



/***************************************
NAME:    EC_IT143_6.3_fwt_s2_ei
PURPOSE: Begin creating an answer

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

ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();

-- Q2: How to keep track of who last modified a record?
-- A2: Maybe use an after update trigger?