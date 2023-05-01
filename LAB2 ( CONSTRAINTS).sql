use student

DROP TABLE Student
DROP TABLE Course
DROP TABLE Marks

TRUNCATE TABLE Student

CREATE TABLE Student
(
    StudentID int PRIMARY KEY,
    StdName varchar(50) NOT NULL,
    Address varchar(100),
    PhoneNum int UNIQUE
)

CREATE TABLE Course
(
    CourseID int PRIMARY KEY,
    CourseName varchar(50) UNIQUE NOT NULL,
    Credits int
)

CREATE TABLE Marks
(
    StudentID int,
    CourseID int,
    Marks int
        CONSTRAINT PK_Marks PRIMARY KEY (StudentID, CourseID),
)

ALTER TABLE Student
ADD Age int

ALTER TABLE Student
ADD CHECK(AGE >= 18)

ALTER TABLE Student
ADD CONSTRAINT df_Address
DEFAULT 'Lahore' FOR Address

ALTER TABLE Student 
ADD CONSTRAINT df_Age
DEFAULT 18 FOR Age

ALTER TABLE Course 
ALTER COLUMN Credits int NOT NULL

INSERT INTO Student
VALUES(1, 'Barum', 'Lahore', 1234567890, 18)
INSERT INTO Student
VALUES(2, 'Anas', 'Karachi', 1234567891, 18)
INSERT INTO Student
VALUES(3, 'Duaa', 'Islamabad', 1234567892, 18)
INSERT INTO Student
VALUES(4, 'Hamza', 'Lahore', 1234567893, 18)
INSERT INTO Student
VALUES(5, 'Huzaifa', 'Lahore', 1234567894, 18)
INSERT INTO Student
    (StudentID, StdName, PhoneNum)
VALUES(6, 'Arose', 1234567895)

INSERT INTO Course
VALUES(1, 'Maths', 3)
INSERT INTO Course
VALUES(2, 'Physics', 3)
INSERT INTO Course
VALUES(3, 'Chemistry', 3)

INSERT INTO Marks
VALUES(1, 1, 90)
INSERT INTO Marks
VALUES(1, 2, 80)
INSERT INTO Marks
VALUES(1, 3, 70)
INSERT INTO Marks
VALUES(2, 1, 60)
INSERT INTO Marks
VALUES(2, 2, 50)
INSERT INTO Marks
VALUES(2, 3, 70)
INSERT INTO Marks
VALUES(3, 1, 80)
INSERT INTO Marks
VALUES(3, 2, 70)
INSERT INTO Marks
VALUES(3, 3, 67)

SELECT *
FROM Marks
WHERE Marks >= 50 AND Marks <= 80
SELECT *
FROM Course
SELECT *
FROM Marks
