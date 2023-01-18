--4.
/*
SELECT FirstName, LastName, HireDate FROM Employees	
WHERE 
	Title = 'Sales Representative' and
	Country = 'USA'
*/


-- 5.
/*
SELECT * FROM Orders
WHERE 
	EmployeeID = 5
*/


--9
/*
SELECT OrderId, CustomerId, ShipCountry FROM Orders
WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela')
*/

--11
/*
SELECT FirstName, LastName, Title, Convert(DATE, BirthDate) FROM Employees
ORDER BY BirthDate ASC

SELECT FirstName, LastName, Title, Cast(BirthDate as Date) FROM Employees
ORDER BY BirthDate ASC
*/

--12
-- ALTER TABLE Employees DROP COLUMN FullName
-- SELECT * FROM Employees
-- Use following command to just show the result and not store it
-- SELECT (FirstName + ' ' + LastName) AS FullName FROM Employees

-- Use following command to create a new column from 
-- SELECT FirstName, LastName, FullName FROM Employees

--13
/*
SELECT OrderID, ProductID, UnitPrice, Quantity, (UnitPrice * Quantity) AS TotalPrice FROM OrderDetails
*/

--14
/*
SELECT COUNT(CustomerID) FROM Customers
*/

--15
/*
SELECT Min(OrderDate) FROM Orders
*/

--16
-- Explanation: GROUP BY clause basically reduces all the results into unique groups
/*
SELECT Country FROM Customers
GROUP BY Country
*/

--17
/*
SELECT COUNT(ContactTitle) AS _Count, ContactTitle FROM Customers
GROUP BY ContactTitle 
ORDER BY _Count DESC
*/

--18
/*
SELECT Products.ProductID, Products.ProductName, Suppliers.CompanyName FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
*/

--19
/*
SELECT OrderID, CONVERT(DATE, OrderDate) AS OrderDate, Shippers.CompanyName FROM Orders 
INNER JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
WHERE OrderID < 10300
ORDER BY OrderID
*/

--20
/*
SELECT CategoryName, COUNT(Products.CategoryID) AS Count
FROM 
	Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID 
GROUP BY 
	CategoryName
ORDER BY
	Count DESC
*/

--21
/*
SELECT Country, City, COUNT(*) AS TotalCustomers FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC
*/

--22
/*
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel FROM Products
WHERE ReorderLevel > UnitsInStock
ORDER BY ProductID ASC
*/


--23
/*
SELECT ProductID, ProductName, ReorderLevel, UnitsInStock, UnitsOnOrder, Discontinued FROM Products
WHERE ReorderLevel >= (UnitsInStock + UnitsOnOrder) AND Discontinued = 0
ORDER BY ProductID ASC

	
*/

--24	

/*
-- The computed column 'SortByField' will be used to put rows with Region == NULL at the bottom
	NOTE:
		We did not simple CASE expression because the comparsion NULL = NULL is not a truthy value in SQL
SELECT 
	CustomerID, 
	Region, 
	CompanyName, 
	SortByFeild = CASE WHEN Region is NULL THEN 1 ELSE 0 END 
FROM 
	Customers
ORDER BY  
	SortByFeild ASC, Region, CustomerID
*/

--25
/*
SELECT TOP 3 AVG(Freight) AS AverageFreight, ShipCountry FROM Orders
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
*/

--26
/*
SELECT TOP 3 AVG(Freight) AS AverageFreight, ShipCountry FROM Orders
WHERE YEAR(OrderDate) = 2015
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
*/

-- 27
/*
Dont know whats going on here, maybe its excluding the outliers ?
SELECT * FROM Orders
ORDER BY OrderDate
*/

-- 28
/*
	NOTE:
		Notice the first use of query within a query, this is called a subquery

SELECT TOP 3 AVG(Freight) AS AverageFreight, ShipCountry FROM Orders
WHERE OrderDate >= DATEADD(yy, -1, (SELECT MAX(OrderDate) FROM Orders))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
*/


