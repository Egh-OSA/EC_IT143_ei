/***************************************
NAME:    dbo.udf_parse_first_name
PURPOSE: Parse First Name from combined name

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Adapted from the following...
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
 
**************************************/

CREATE FUNCTION [dbo].[udf_parse_first_name]
(
    @v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

BEGIN

    DECLARE @v_first_name AS VARCHAR(100);

    SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') - 1);

    RETURN @v_first_name;

END;
GO



/***************************************
NAME:    dbo.udf_parse_last_name
PURPOSE: Parse Last Name from combined name

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Adapted from the following...
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
 
**************************************/

CREATE FUNCTION [dbo].[udf_parse_last_name]
(
    @v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

BEGIN

    DECLARE @v_last_name AS VARCHAR(100);

    SET @v_last_name = SUBSTRING(@v_combined_name, CHARINDEX(' ', @v_combined_name) + 1, LEN(@v_combined_name));

    RETURN @v_last_name;

END;
GO