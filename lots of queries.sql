use Northwind

SELECT *
FROM Categories
SELECT *
FROM Customers

SELECT TOP 5
    *
FROM Customers

SELECT *
FROM Employees
WHERE TitleOfCourtesy = 'Mr.'

SELECT *
FROM Employees
WHERE EmployeeID > 5
ORDER BY EmployeeID DESC

SELECT *
FROM Customers
WHERE Region IS NULL

SELECT MIN(EmployeeID) As FirstEmp
FROM Employees

SELECT MAX(CustomerID) As LastCust
FROM Customers

SELECT COUNT(*) As NumCust
FROM Customers

SELECT AVG(EmployeeID) As AvgEmp
FROM Employees

SELECT SUM(EmployeeID) As SumEmp
FROM Employees

SELECT *
FROM Customers
WHERE ContactName LIKE '%or%'

SELECT *
FROM Customers
WHERE ContactName LIKE 'T%Y'


SELECT *
FROM Customers
WHERE CustomerID LIKE 'a__%'