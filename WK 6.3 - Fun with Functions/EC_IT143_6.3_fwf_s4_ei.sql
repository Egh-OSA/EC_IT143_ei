/***************************************
NAME:    EC_IT143_6.3_fwf_s4_ei
PURPOSE: Research and test a solution

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to extract first name from Contact Name?
 
**************************************/

-- Q: How to extract first name from Contact Name?

-- A: ContactName contains first and last names.
-- ContactName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

-- Research Sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/left-transact-sql

SELECT t.ContactName
     , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) 
      AS first_name
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;



 /***************************************
NAME:    EC_IT143_6.3_fwf_s4_ei
PURPOSE: Research and test a solution

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to extract last name from Contact Name?
 
**************************************/

-- Q: How to extract last name from Contact Name?

-- A: ContactName contains first and last names.
-- ContactName = Alejandra Camino -> Camino
-- Google search "How to extract last name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

-- Research Sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/substring-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql

SELECT t.ContactName
     , CHARINDEX(' ', t.ContactName)                                                      AS space_position
     , SUBSTRING(t.ContactName, CHARINDEX(' ', t.ContactName) + 1, LEN(t.ContactName))   AS last_name
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;