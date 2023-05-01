CREATE TABLE Salesman
(
    salesman_id INT PRIMARY KEY,
    name varchar(30),
    city varchar(30),
    comission float
)

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY,
    cust_name varchar(50),
    city varchar(20),
    grade INT,
    salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
)

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(customer_id),
    SalesmanID INT FOREIGN KEY REFERENCES Salesman(salesman_id)
)

INSERT INTO Salesman
VALUES(5001, 'James Hoog', 'New York', 0.15)
INSERT INTO Salesman
VALUES(5002, 'Nail Knite', 'Paris', 0.25)
INSERT INTO Salesman
VALUES(5003, 'Pit Alex', 'London', 0.20)
INSERT INTO Salesman
VALUES(5004, 'Mc Lyon', 'Paris', 0.25)
INSERT INTO Salesman
VALUES(5005, 'Paul Adam', 'Rome', 0.10)
INSERT INTO Salesman
VALUES(5006, 'Lauson Hen', 'San Jose', 0.12)

INSERT INTO Customer
VALUES(3001, 'Nick Rimando', 'New York', 100, 5001)
INSERT INTO Customer
VALUES(3002, 'Brad Davis', 'Paris', 200, 5002)
INSERT INTO Customer
VALUES(3003, 'Fabian Johnson', 'Paris', 200, 5003)
INSERT INTO Customer
VALUES(3004, 'Graham Zusi', 'California', 100, 5002)
INSERT INTO Customer
VALUES(3005, 'Julian Green', 'London', 200, 5002)
INSERT INTO Customer
VALUES(3006, 'Geoff Cameron', 'Moscow', 200, 5003)


INSERT INTO Orders
VALUES(2001, 3001, 5001)
INSERT INTO Orders
VALUES(2002, 3001, 5001)
INSERT INTO Orders
VALUES(2003, 3002, 5002)


SELECT Salesman.name AS 'Salesman', Customer.cust_name As 'Customer', Customer.city
FROM Salesman, Customer
WHERE Salesman.city = Customer.city


SELECT Orders.OrderID, Customer.cust_name AS 'Customer'
FROM Orders
    INNER JOIN Customer
    ON Orders.CustomerID = Customer.customer_id


