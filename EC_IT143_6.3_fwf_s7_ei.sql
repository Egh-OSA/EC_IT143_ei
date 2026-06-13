/***************************************
NAME:    EC_IT143_6.3_fwf_s7_ei
PURPOSE: Perform a 0 results expected test

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

WITH s1
AS
(
    SELECT t.ContactName
         , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) 
           AS first_name
         , dbo.udf_parse_first_name(t.ContactName)                       
           AS first_name2
      FROM dbo.t_w3_schools_customers AS t
)
SELECT s1.*
  FROM s1
 WHERE s1.first_name <> s1.first_name2; -- Expected result is 0 rows



 /***************************************
NAME:    EC_IT143_6.3_fwf_s7_ei
PURPOSE: Perform a 0 results expected test

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

WITH s1
AS
(
    SELECT t.ContactName
         , SUBSTRING(t.ContactName, CHARINDEX(' ', t.ContactName) + 1, LEN(t.ContactName)) AS last_name
         , dbo.udf_parse_last_name(t.ContactName)                                           AS last_name2
      FROM dbo.t_w3_schools_customers AS t
)
SELECT s1.*
  FROM s1
 WHERE s1.last_name <> s1.last_name2; -- Expected result is 0 rows