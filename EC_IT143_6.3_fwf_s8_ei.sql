/***************************************
NAME:    EC_IT143_6.3_fwf_s8_ei
PURPOSE: Ask the next question

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
     , dbo.udf_parse_first_name(t.ContactName) 
       AS first_name
     , SUBSTRING(t.ContactName, CHARINDEX(' ', t.ContactName) + 1, 
      LEN(t.ContactName)) AS last_name
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;



 /***************************************
NAME:    EC_IT143_6.3_fwf_s8_ei
PURPOSE: Ask the next question

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
How to extract last name from Contact Name?
 
**************************************/

-- Q: How to extract last name from Contact Name?

-- A: ContactName contains first and last names.
-- ContactName = Alejandra Camino -> Camino
-- Use SUBSTRING() and CHARINDEX() to get everything after the first space

SELECT t.CustomerID
     , t.CustomerName
     , t.ContactName
     , dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name
     , ''                                       AS ContactName_last_name -- How to extract last name?
     , t.Address
     , t.City
     , t.Country
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 3;