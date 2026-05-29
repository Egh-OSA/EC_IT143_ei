
DROP VIEW IF EXISTS dbo.v_hello_world_current_date;



/***************************************
NAME:    EC_IT143_W4.2_hello_world_s4_ei.sql
PURPOSE: Create a SQL view.

MODIFICATION LOG:
Ver      Date          Author              Description
1.0      05/28/2026    Eghosa Igbinidu     Created Week 4.2 script.

RUNTIME:
xx
**************************************/



CREATE VIEW dbo.v_hello_world_current_date 
AS

SELECT 'Hello World' AS my_Message
    , GETDATE() AS current_date_time;