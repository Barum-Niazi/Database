use test1
create table Salesman
(
    salesman_id int Primary Key,
    name Varchar (50),
    city Varchar(20),
    commission float
)

insert into Salesman
VALUES(5001, 'James Hoog', 'New York', 0.15)
insert into Salesman
VALUES(5002, 'Nail Knite', 'Paris', 0.13)
insert into Salesman
VALUES(5005 , 'Pit Alex', 'London', 0.11)
insert into Salesman
VALUES(5006, 'Mc Lyon', 'Paris', 0.14)
insert into Salesman
VALUES(5003, 'Lauson Hen', 'San Jose', 0.12)
insert into Salesman
VALUES(5007, 'Paul Adam' , 'Rome', 0.13)

select *
from Salesman

create table Orders
(
    ord_no int Primary Key,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int References salesman(salesman_id)
)

insert into orders
VALUES(70001, 150.5, '2012-10-05', 3005, 5002)


insert into orders
VALUES(70009, 270.65, '2012-09-10', 3001, 5005)
insert into orders
VALUES(70002, 65.26 , '2012-10-05' , 3002 , 5001)
insert into orders
VALUES(70004, 110.5 , '2012-08-17' , 3009  , 5003)
insert into orders
VALUES(70007, 948.5 , '2012-09-10', 3005  , 5002)
insert into orders
VALUES(70005, 2400.6 , '2012-07-27' , 3007 , 5001)
insert into orders
VALUES(70008, 5760    , '2012-09-10' , 3002   , 5001)
insert into orders
VALUES(70010, 1983.43  , '2012-10-10' , 3004  , 5006)
insert into orders
VALUES(70003, 2480.4  , '2012-10-10' , 3009   , 5003)
insert into orders
VALUES(70012, 250.45    , '2012-06-27' , 3008   , 5002)
insert into orders
VALUES(70011, 75.29  , '2012-08-17' , 3003    , 5007)
insert into orders
VALUES(70013, 3045.6   , '2012-04-25', 3002   , 5001)
select *
from Orders

SELECT *
FROM orders
WHERE salesman_id =
    (SELECT salesman_id
FROM salesman
WHERE name='Paul Adam');


SELECT *
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id
FROM salesman
WHERE city='paris')

SELECT *
FROM orders
WHERE salesman_id IN
	(SELECT salesman_id
FROM salesman
WHERE city = 'New York')

CREATE TABLE Customer
(
    customer_id int PRIMARY KEY,
    cust_name varchar(50),
    city varchar(20),
    grade int,
    salesman_id int FOREIGN KEY REFERENCES Salesman(salesman_id)
)

INSERT INTO Customer
VALUES(3002, 'Nick Rimando', 'New York', 100, 5001)
INSERT INTO Customer
VALUES(3007, 'Brad Davis', 'New York', 200, 5001)
INSERT INTO Customer
VALUES(3005, 'Graham Zusi', 'California', 200, 5002)
INSERT INTO Customer
VALUES(3008, 'Julian Green', 'London', 300, 5002)
INSERT INTO Customer
VALUES(3004, 'Fabian Johnson', 'Paris', 300, 5006)
INSERT INTO Customer
VALUES(3009, 'Geoff Cameron', 'Berlin', 100, 5003)
INSERT INTO Customer
VALUES(3003, 'Jozy Altidor', 'Moscow', 200, 5007)
INSERT INTO Customer
VALUES(3001, 'Brad Guzan', 'London', NULL, 5005)


SELECT *
FROM Orders
WHERE salesman_id IN
    (SELECT salesman_id
FROM salesman
WHERE commission IN
        (SELECT MAX(commission)
FROM salesman))


SELECT Orders.*, customer.cust_name
FROM Orders, Customer
WHERE Orders.customer_id = Customer.customer_id
    AND Orders.ord_date = '2012-08-17'

SELECT Orders.*, customer.cust_name
FROM Orders, Customer
WHERE Orders.ord_no IN 
    (SELECT Orders.ord_no
FROM Orders
WHERE ord_date = '2012-08-17')


SELECT *
FROM salesman
WHERE city IN
    (SELECT city
FROM customer);