

-- Q1: What is the average closing price for Apple stock?

TRUNCATE TABLE t_stock_average_apple_price;

INSERT INTO t_stock_average_apple_price
SELECT *
FROM v_stock_average_apple_price;