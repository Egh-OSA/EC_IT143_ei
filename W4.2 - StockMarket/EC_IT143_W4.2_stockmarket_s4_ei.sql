
DROP VIEW IF EXISTS v_stock_average_apple_price


/***************************************
NAME:    EC_IT143_W4.2_stockmarket_s4_ei.sql
PURPOSE: Create stock market analysis view

MODIFICATION LOG:
Ver      Date            Author               Description  
1.0      05/28/2026      Eghosa Igbinidu      Created Week 4.2 script.


RUNTIME: 
1s

NOTES: 
This script converts the ad hoc query into a reusable SQL Server view.
 
**************************************/

-- Q1: What is the average closing price for Apple stock?


CREATE VIEW v_stock_average_apple_price 
AS

SELECT
    AVG([Close]) AS average_closing_price
FROM Apple;