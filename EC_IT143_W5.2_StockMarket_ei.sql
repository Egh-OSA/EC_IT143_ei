/***************************************
NAME:    EC_IT143_W5.2_StockMarket_ei.
PURPOSE: Answer stock market community analysis questions using SQL.

MODIFICATION LOG:
Ver      Date        Author            Description
-----   ----------   -----------       --------------------------------------------------
1.0     06/03/2026   Eghosa Igbinidu   Created stock market community analysis script.

RUNTIME:
xx

NOTES:
This script answers four business questions related to stock performance,
volume, and market activity using the MAANG Historical Stock Dataset.
**************************************/

-- Q1 (Author: Eghosa Igbinidu):
-- What is the average closing price for Apple stock?

-- A1:
-- This query calculates the average closing price for Apple stock.

SELECT
       AVG([Close]) AS average_closing_price
FROM Apple;

-- Q2 (Author: Raphael Igbinidu):
-- Which company has the highest average trading volume?

-- A2:
-- This query compares average trading volume across all five companies.

SELECT 'Apple' AS company,
       AVG(CAST(Volume AS BIGINT)) AS avg_volume
FROM Apple

UNION ALL

SELECT 'Amazon',
       AVG(CAST(Volume AS BIGINT))
FROM Amazon

UNION ALL

SELECT 'Google',
       AVG(CAST(Volume AS BIGINT))
FROM Google

UNION ALL

SELECT 'Microsoft',
       AVG(CAST(Volume AS BIGINT))
FROM Microsoft

UNION ALL

SELECT 'Netflix',
       AVG(CAST(Volume AS BIGINT))
FROM Netflix

ORDER BY avg_volume DESC;

-- Q3 (Author: Eghosa Igbinidu):
-- What is the highest closing price recorded for each company?

-- A3:
-- This query finds the maximum closing price for each company.

SELECT 'Apple' AS company,
       MAX([Close]) AS highest_close
FROM Apple

UNION ALL

SELECT 'Amazon',
       MAX([Close])
FROM Amazon

UNION ALL

SELECT 'Google',
       MAX([Close])
FROM Google

UNION ALL

SELECT 'Microsoft',
       MAX([Close])
FROM Microsoft

UNION ALL

SELECT 'Netflix',
       MAX([Close])
FROM Netflix;

-- Q4 (Author: Tanaka Ocean Mlambo):
-- How do tech stock trading volumes during the peak football season months
-- (August to May) compare to the summer off-season months?

-- A4:
-- This query compares average volume and average closing price during
-- football season versus off-season months.

SELECT
       CASE
            WHEN MONTH([Date]) IN (8,9,10,11,12,1,2,3,4,5)
                 THEN 'Football Season'
            ELSE 'Off Season'
       END AS season_period,
       AVG(Volume) AS average_volume,
       AVG([Close]) AS average_closing_price
FROM Apple
GROUP BY
       CASE
            WHEN MONTH([Date]) IN (8,9,10,11,12,1,2,3,4,5)
                 THEN 'Football Season'
            ELSE 'Off Season'
       END;
