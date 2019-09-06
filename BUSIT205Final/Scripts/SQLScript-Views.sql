/*
Name:   Chris Singleton
Course: BUSIT205 - Final
Professor: Randal Root
Date: 06/12/2017
*/

/**************** DWBUSIT205Final ******************/
/*************** Tabular Modeling ******************/
/***************** Script Views ********************/

--Create views to speed up the data structure and not change anything.

USE [DW205Final];
GO
--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimCustomers' and TYPE='v')
DROP VIEW vDimCustomers;
GO
CREATE VIEW vDimCustomers 
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimCustomers Table.
*/
SELECT [CustomerKey]
	  ,[CustomerID]
	  ,CAST([CustomerName] AS NVARCHAR(50)) AS CustomerName
	  ,CAST([CustomerCity] AS NVARCHAR(50)) AS CustomerCity
	  ,CAST([CustomerState] AS NVARCHAR(50)) AS CustomerState
FROM [DW205Final].dbo.DimCustomers
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimDates' and TYPE='v')
DROP VIEW vDimDates;
GO
CREATE VIEW vDimDates
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimDates Table.
*/
--SELECT 
SELECT	[DateKey] 
       ,CAST(CAST(DateKey AS char(8)) AS Date) AS [Date]
	   ,[DateName]
	   ,[MonthKey]
	   ,[MonthName]
	   ,[YearKey]
	   ,[YearName] 
FROM [DW205Final].[dbo].[DimDates]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimProducts' and TYPE='v')
DROP VIEW vDimProducts;
GO
CREATE VIEW vDimProducts
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimProducts Table.
*/
SELECT [ProductKey] 
	  ,[ProductID]
	  ,CAST([ProductName] AS NVARCHAR(50)) AS ProductName
	  ,CONVERT(DECIMAL(7,2),[ProductStandardPrice]) AS ProductStandardPrice 
FROM [DW205Final].[dbo].[DimProducts]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimCategories' and TYPE='v')
DROP VIEW vDimCategories;
GO
CREATE VIEW vDimCategories
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimCategories Table.
*/
SELECT	[CategoryKey] 
	   ,[CategoryID] 
	   ,CAST([CategoryName] AS NVARCHAR(50)) AS CategoryName 
FROM [DW205Final].[dbo].[DimCategories]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimDeparments' and TYPE='v')
DROP VIEW vDimDeparments;
GO
CREATE VIEW vDimDeparments
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimDepartments Table.
*/
SELECT	[DepartmentKey] 
	   ,[DepartmentID]
	   ,[DepartmentName] 
FROM [DW205Final].[dbo].[DimDepartments]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vDimEmployees' and TYPE='v')
DROP VIEW vDimEmployees;
GO
CREATE VIEW vDimEmployees
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire DimEmployees Table.
*/
SELECT	[EmployeeKey] 
	   ,[EmployeeID]
	   ,CAST([EmployeeFullName] AS NVARCHAR(50)) AS EmployeeFullName
	   ,[DepartmentKey] 
	   ,[ManagerKey]
FROM [DW205Final].[dbo].[DimEmployees]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vFactInventories' and TYPE='v')
DROP VIEW vFactInventories;
GO
CREATE VIEW vFactInventories
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire FactInventories Table.
*/
SELECT	[InventoryID] 
	   ,[ProductKey] 
	   ,[InventoryDateKey] 
	   ,CAST(CAST(InventoryDateKey AS char(8)) AS Date) AS [InventoryDate]
	   ,[InventoryCounts] 
FROM [DW205Final].[dbo].[FactInventories]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vFactProductCategories' and TYPE='v')
DROP VIEW vFactProductCategories;
GO
CREATE VIEW vFactProductCategories
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire FactProductCategories Table.
*/
SELECT	[ProductKey] 
	   ,[CategoryKey] 
FROM [DW205Final].[dbo].[FactProductCategories]
GO

--If the view exists, then drop it first. 
IF EXISTS(SELECT 1 FROM sys.views WHERE NAME='vFactSales' and TYPE='v')
DROP VIEW vFactSales;
GO
CREATE VIEW vFactSales
AS
/*
Created By: Chris Singleton
Date: 06/05/2017
Objective: View of the entire FactSales Table.
*/
SELECT	[SalesID] 
	   ,[SalesLineItemID] 
	   ,[EmployeeKey] 
	   ,[SalesDateKey]
	   ,CAST(CAST(SalesDateKey AS char(8)) AS Date) AS [SalesDate]
	   ,[ShipDateKey]
	   ,CAST(CAST(ShipDateKey AS char(8)) AS Date) AS [ShipDate]
	   ,[CustomerKey]
	   ,[ProductKey] 
	   ,CONVERT(DECIMAL(7,2),[SalesDollars]) AS SalesDollars
	   ,[SalesUnits]
FROM [DW205Final].[dbo].[FactSales]
GO

