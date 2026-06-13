/***************************************
NAME:    EC_IT143_6.4_performance_analysis_ei
PURPOSE: Performance Analysis - Execution Plans and Missing Index Recommendations

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2026   EI            Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
Querying Sales.SalesOrderDetail using an unindexed column to generate
a missing index recommendation
 
**************************************/

-- Step 1: Query a table in AdventureWorks database
-- Step 2: Add a WHERE clause on an unindexed character field

SELECT *
  FROM Sales.SalesOrderDetail
 WHERE UnitPriceDiscount > 0.10;

-- Step 3: Include the Actual Execution Plan
-- Enable with CTRL + M before executing the query above

-- Step 4: Review the execution plan
-- Physical Operation:       Clustered Index Scan
-- Logical Operation:        Clustered Index Scan
-- Estimated Subtree Cost:   1.07359

-- Step 5: Note the missing index recommendation
-- Missing Index Impact:     56.2671%


-- SQL Server recommends creating a nonclustered index on UnitPriceDiscount
-- This means SQL Server is scanning the ENTIRE table to find matching rows
-- which is inefficient for large tables

-- Step 6 & 7: Right click missing index recommendation and create the index
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_UnitPriceDiscount]
    ON Sales.SalesOrderDetail (UnitPriceDiscount)
    INCLUDE (CarrierTrackingNumber, OrderQty, ProductID,
             SpecialOfferID, UnitPrice, LineTotal, rowguid, ModifiedDate);

-- Step 8: Re-run the query to compare performance

SELECT *
  FROM Sales.SalesOrderDetail
 WHERE UnitPriceDiscount > 0.10;


-- Compare before and after:
-- Physical Operation BEFORE index:      Clustered Index Scan
-- Physical Operation AFTER index:       Index Seek (NonClustered)
-- Runtime BEFORE index:                 0.044s
-- Runtime AFTER index:                  0.002s
-- Estimated Subtree Cost BEFORE index:  1.07359
-- Estimated Subtree Cost AFTER index:   0.015078



-- QUERY 2: Production.TransactionHistory


-- Step 1: Query a table in AdventureWorks database

-- Step 2: Add a WHERE clause on unindexed columns
   -- Note: Enable Actual Execution Plan with CTRL + M before running

SELECT *
  FROM Production.TransactionHistory
 WHERE TransactionType = 'P'
   AND Quantity > 5;

-- Step 3: Include the Actual Execution Plan
   -- Enable with CTRL + M before executing the query above

-- Step 4: Review the execution plan
   -- Physical Operation:       Clustered Index Scan
   -- Logical Operation:        Clustered Index Scan
   -- Estimated Subtree Cost:  0.711032
   -- Runtime:                  0.024s
    

-- Step 5: The missing index recommendation
   -- Missing Index Impact:     72.2089%
   -- SQL Server recommends creating a nonclustered index on
   -- TransactionType and Quantity
   -- This means SQL Server is scanning the ENTIRE table
   -- to find matching rows which is very inefficient

-- Step 6 & 7: Right click missing index recommendation
-- and create the index

CREATE NONCLUSTERED INDEX [IX_TransactionHistory_TransactionType_Quantity]
    ON Production.TransactionHistory (TransactionType, Quantity)
    INCLUDE (ProductID, ReferenceOrderID, ReferenceOrderLineID,
             TransactionDate, ActualCost, ModifiedDate);

-- Step 8: Re-run the query to compare performance
SELECT *
  FROM Production.TransactionHistory
 WHERE TransactionType = 'P'
   AND Quantity > 5;

-- Compare before and after:
-- Physical Operation BEFORE index:     Clustered Index Scan
-- Physical Operation AFTER index:      Index Seek (NonClustered)
-- Runtime BEFORE index:                0.024s
-- Runtime AFTER index:                 0.005s
-- Estimated Subtree Cost BEFORE:       0.711032
-- Estimated Subtree Cost AFTER:        0.0233433
-- Result: Performance improved significantly!
--         Subtree cost reduced by 96.7%
--         SQL Server now uses Index Seek instead of full table scan


