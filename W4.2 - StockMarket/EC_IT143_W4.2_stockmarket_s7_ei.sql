
CREATE PROCEDURE p_load_stock_average_apple_price
AS

/***************************************
NAME:    EC_IT143_W4.2_stockmarket_s7_ei.sql
PURPOSE: Create stored procedure.


MODIFICATION LOG:
Ver      Date            Author               Description  
1.0      05/28/2026      Eghosa Igbinidu      Created Week 4.2 script.


RUNTIME: 
1s

NOTES: 
This script create stored procedure.
 
 
**************************************/

-- Q1: What is the average closing price for Apple stock?



   BEGIN

    TRUNCATE TABLE t_stock_average_apple_price;

    INSERT INTO t_stock_average_apple_price
    SELECT *
    FROM v_stock_average_apple_price;

END;
