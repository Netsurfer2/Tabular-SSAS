/*
Name: Chris Singleton
Course: BUSIT205 - Final
Professor: Randal Root
Date: 06/05/2017
*/

/*
Purpose: Place the FullName into two separate columns. 
Quarter is calculated from the SalesDateKey. 
datatype: Date(2010-01-01) and DateTime(2010-01-01 00:00:00.000)
Note: This can be done with any DateKey that is an Integer DataType.
*/
USE [DW205Final];
GO
--Sales Date Year:
SELECT Left(CONVERT(varchar(50), SalesDateKey, 112), 4)
FROM FactSales
GO
SELECT CAST(DATEPART(YEAR, CAST(CAST(SalesDateKey AS char(8)) AS DateTime)) AS VARCHAR(4)) +
       ' - ' +
   CASE
      WHEN MONTH(CAST(CAST(SalesDateKey AS CHAR(8)) AS DATE)) BETWEEN 1 AND 3
	  THEN 'Q1'
	  WHEN MONTH(CAST(CAST(SalesDateKey AS CHAR(8)) AS DATE)) BETWEEN 4 AND 6 
	  THEN 'Q2'
      WHEN MONTH(CAST(CAST(SalesDateKey AS CHAR(8)) AS DATE)) BETWEEN 7 AND 9 
	  THEN 'Q3'
    ELSE 'Q4'
   END	
FROM FactSales
GO
--Getting the Month from the SalesDateKey.
SELECT DATEPART(MONTH, CAST(CAST(SalesDateKey AS char(8)) AS DateTime))
FROM FactSales
GO

--Getting the Date from the SalesDateKey.
SELECT CAST(CAST(SalesDateKey AS char(8)) AS Date)
FROM FactSales
GO


--================================================================--
--================ Full Name to First and Last Name ==============--
--================= Concatenated Column Separation ===============--

--Syntax to take the full name and put it into individual FirstName, LastName columns.
SELECT
SUBSTRING([EmployeeFullName],1,CHARINDEX(' ',[EmployeeFullName]) -1) AS FirstName,
SUBSTRING([EmployeeFullName], CHARINDEX(' ',[EmployeeFullName]) + 1,250) AS LastName
FROM [DW205Final].dbo.DimEmployees

