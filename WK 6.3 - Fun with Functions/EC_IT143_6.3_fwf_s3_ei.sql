/***************************************
NAME:    EC_IT143_6.3_fwf_s3_ei
PURPOSE: Create an ad hoc SQL query

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

SELECT t.ContactName
     , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) 
      AS first_name
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;



 /***************************************
NAME:    EC_IT143_6.3_fwf_s3_ei
PURPOSE: Create an ad hoc SQL query

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

SELECT t.ContactName
     , SUBSTRING(t.ContactName, CHARINDEX(' ', t.ContactName) + 1, LEN(t.ContactName)) AS last_name
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;