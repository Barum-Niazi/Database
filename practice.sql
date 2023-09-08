SELECT employees.ename
FROM
    employees
    INNER JOIN aircraft ON aircraft.aname LIKE 'B%'

SELECT flights.ffrom, flights.fto
FROM flights
WHERE
flights.ffrom = 'Los Angeles' AND flights.fto = 'New York' AND flights.arrives = '18:00'

SELECT AVG(employees.salary) AS Average
FROM aircraft, employees
WHERE aircraft.cruisingrange > 4000

CREATE TABLE RandomTable(
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    RegDate DATETIME NOT NULL,
    Date2 DATETIME2 NOT NULL,
    Date3 SMALLDATETIME NOT NULL,
    Date4 DATE NOT NULL,
    Date5 TIME NOT NULL,
    PRIMARY KEY (id)
)

SELECT * FROM RandomTable

INSERT INTO RandomTable
VALUES(1, 'John', '2018-01-01 00:00:00', '2018-01-01 00:00:00', '2018-01-01 00:00:00', '2018-01-01', '00:00:00')

SELECT AVG(employees.salary) AS avg
FROM employees

SELECT aircraft.aname, employees.ename
FROM aircraft
    INNER JOIN employees on employees.salary > 80000

SELECT SUM(employees.salary) as total
from employees

SELECT TOP 3
    ename
from employees

SELECT COUNT(aircraft.cruisingrange) AS count
from aircraft

/* for all aircrafts with cruising range greater than 4000, show the aircraft name and average salary of employees flying them*/
SELECT aircraft.aname, AVG(employees.salary) AS avg
FROM aircraft, employees
WHERE aircraft.cruisingrange > 4000


SELECT *
FROM flights
SELECT *
FROM employees