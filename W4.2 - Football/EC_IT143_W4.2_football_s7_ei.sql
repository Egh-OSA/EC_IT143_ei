
CREATE PROCEDURE p_load_football_player_goals
AS


/***************************************
NAME:    EC_IT143_W4.2_football_s7_ei.sql
PURPOSE: Create stored procedure.

MODIFICATION LOG:
Ver      Date          Author              Description
1.0      05/28/2026    Eghosa Igbinidu     Created Week 4.2 script.

RUNTIME:
xx


NOTES: 
This script create stored procedure.
 
**************************************/

-- Q1: How many goals has each player scored?



   BEGIN

    TRUNCATE TABLE t_football_player_goals;

    INSERT INTO t_football_player_goals
    SELECT *
    FROM v_football_player_goals;

END;