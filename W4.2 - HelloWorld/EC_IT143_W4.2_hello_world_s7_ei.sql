
CREATE PROCEDURE p_load_hello_world_current_date
AS


/***************************************
NAME:    EC_IT143_W4.2_hello_world_s7_ei.sql
PURPOSE: Create stored procedure.

MODIFICATION LOG:
Ver      Date          Author              Description
1.0      05/28/2026    Eghosa Igbinidu     Created Week 4.2 script.

RUNTIME:
xx
**************************************/

-- Q1: What is today’s date and time?




  BEGIN

    TRUNCATE TABLE dbo.t_hello_world_current_date;

    INSERT INTO dbo.t_hello_world_current_date
           SELECT v.my_message
                , v.current_date_time
    FROM dbo.v_hello_world_current_date AS v;


    --2) Review Result

    SELECT t.*
      FROM dbo.t_hello_world AS t;

END;