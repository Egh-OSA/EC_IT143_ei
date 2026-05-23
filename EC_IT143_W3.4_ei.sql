/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_ei
PURPOSE: AdventureWorks Questions and Answers SQL Script

MODIFICATION LOG:
Ver      Date        Author                Description
-----   ----------   -----------           -------------------------------------------------------------------------------
1.0     05/23/2026   EGHOSA IGBINIDU      1.Built this script for EC_IT143 Week 3.4 Assignment

RUNTIME: 
Xm Xs

NOTES: 
This script contains eight AdventureWorks business and metadata questions
along with SQL answers. Questions were selected from my own work and
classmates’ submissions. Queries demonstrate SQL concepts including
filtering, joins, grouping, aggregation, ordering and metadata analysis.

******************************************************************************************************************/

SELECT GETDATE() AS my_date;

USE AdventureWorks2022

-- Q1 Business User Question — Marginal Complexity
-- Author: Eghosa Igbinidu
-- Question:
-- What are the five most expensive products by list price?

-- A1:
-- This query returns the top five most expensive products based on ListPrice.

SELECT TOP 5
    Name,
    ProductNumber,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


-- Q2 Business User Question — Marginal Complexity
-- Author: Mary Mabowa Jabati
-- Question:
-- Which products have a StandardCost greater than $1,000?

-- A2:
-- This query lists products whose StandardCost exceeds $1,000.

SELECT
    Name,
    ProductNumber,
    StandardCost
FROM Production.Product
WHERE StandardCost > 1000
ORDER BY StandardCost DESC;


-- Q3 Business User Question — Moderate Complexity
-- Author: Mary Mabowa Jabati
-- Question:
-- I want to review pricing performance.
-- Which five product subcategories have the highest average ListPrice compared with average StandardCost?

-- A3:
-- This query compares average ListPrice and StandardCost by product subcategory.

SELECT TOP 5
    ps.Name AS ProductSubcategory,
    AVG(p.ListPrice) AS AverageListPrice,
    AVG(p.StandardCost) AS AverageStandardCost,
    AVG(p.ListPrice - p.StandardCost) AS AverageProfitMargin
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
ORDER BY AverageProfitMargin DESC;


-- Q4 Business User Question — Moderate Complexity
-- Author: Paul Joel
-- Question:
-- I need a list of sales orders from July 2014.
-- For each order, show the order number, the order date,
-- and the total amount due, but only for orders over $10,000.

-- A4:
-- This query returns July 2014 sales orders greater than $10,000.

SELECT
    SalesOrderID,
    OrderDate,
    TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014
    AND MONTH(OrderDate) = 7
    AND TotalDue > 10000
ORDER BY TotalDue DESC;


-- Q5 Business User Question — Increased Complexity
-- Author: Paul Joel
-- Question:
-- I'm analyzing our top-selling products.
-- Please create a list of the 10 most frequently ordered products.
-- For each product, show its name, the total quantity ordered,
-- standard cost, list price, and the calculated total profit.

-- A5:
-- This query calculates total quantity sold and estimated profit for products.

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantityOrdered,
    p.StandardCost,
    p.ListPrice,
    (p.ListPrice - p.StandardCost) * SUM(sod.OrderQty) AS TotalEstimatedProfit
FROM Production.Product p
INNER JOIN Sales.SalesOrderDetail sod
    ON p.ProductID = sod.ProductID
GROUP BY
    p.Name,
    p.StandardCost,
    p.ListPrice
ORDER BY TotalQuantityOrdered DESC;


-- Q6 Business User Question — Increased Complexity
-- Author: Dominic Ette
-- Question:
-- The management is considering awarding performance bonuses.
-- Use SalesOrderHeader, SalesTerritory, and Customer tables
-- to determine which sales territory generated the highest revenue from loyal customers last year.

-- A6:
-- This query calculates sales revenue by territory for customers with multiple orders.

SELECT TOP 1
    st.Name AS SalesTerritory,
    COUNT(DISTINCT soh.CustomerID) AS LoyalCustomers,
    SUM(soh.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
INNER JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
WHERE YEAR(soh.OrderDate) = 2014
GROUP BY st.Name
HAVING COUNT(soh.CustomerID) > 1
ORDER BY TotalRevenue DESC;


-- Q7 Metadata Question
-- Author: Dominic Ette
-- Question:
-- Which schema holds the highest number of distinct tables
-- according to the INFORMATION_SCHEMA.COLUMNS view?

-- A7:
-- This query identifies the schema containing the largest number of tables.

SELECT TOP 1
    TABLE_SCHEMA,
    COUNT(DISTINCT TABLE_NAME) AS TotalTables
FROM INFORMATION_SCHEMA.COLUMNS
GROUP BY TABLE_SCHEMA
ORDER BY TotalTables DESC;


-- Q8 Metadata Question
-- Author: Eghosa Igbinidu
-- Question:
-- Which AdventureWorks tables contain columns named ProductID, CustomerID, or SalesOrderID?

-- A8:
-- This query searches INFORMATION_SCHEMA.COLUMNS for matching column names.

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('ProductID', 'CustomerID', 'SalesOrderID')
ORDER BY TABLE_NAME;
