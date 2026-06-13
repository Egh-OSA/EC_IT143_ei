/***************************************
NAME:    EC_IT143_6.3_fwf_s2_ei
PURPOSE: Begin creating an answer

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
-- I need to find the space and return everything to the left of it

SELECT t.ContactName
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;



 /***************************************
NAME:    EC_IT143_6.3_fwf_s2_ei
PURPOSE: Begin creating an answer

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
-- The last name is everything AFTER the first space
-- I need to find the space and return everything to the right of it

SELECT t.ContactName
  FROM dbo.t_w3_schools_customers AS t
 ORDER BY 1;