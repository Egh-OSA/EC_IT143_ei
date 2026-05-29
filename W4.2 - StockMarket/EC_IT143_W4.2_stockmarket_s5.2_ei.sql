

-- Q1: What is the average closing price for Apple stock?

ALTER TABLE t_stock_average_apple_price
ALTER COLUMN average_closing_price DECIMAL(10,2) NOT NULL;