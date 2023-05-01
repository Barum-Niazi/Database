use student

DROP TABLE Student
DROP TABLE Course
DROP TABLE Marks

CREATE TABLE Student
(
    StudentID int,
    StdName varchar(50),
    Address varchar(100),
    PhoneNum int UNIQUE
)

CREATE TABLE Course
(
    CourseID int,
    CourseName varchar(50) UNIQUE,
    Credits int
)

CREATE TABLE Marks
(
    StudentID int,
    CourseID int,
    Marks int
)

TRUNCATE TABLE Marks

sp_help Student

ALTER TABLE Student ALTER COLUMN StudentID int NOT NULL
ALTER TABLE Student ADD PRIMARY KEY (StudentID)
ALTER TABLE Course ALTER COLUMN CourseID int NOT NULL
ALTER TABLE Course ADD PRIMARY KEY (CourseID)
ALTER TABLE Marks ADD FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
ALTER TABLE Marks ADD FOREIGN KEY (CourseID) REFERENCES Course(CourseID)

SELECT *
FROM Student
SELECT *
FROM Course
SELECT *
FROM Marks

INSERT INTO Student
VALUES(1, 'Barum', 'Lahore', 1234567890)
INSERT INTO Student
VALUES(2, 'Anas', 'Lahore', 1234567891)
INSERT INTO Student
VALUES(3, 'Duaa', 'Lahore', 1234567892)
INSERT INTO Student
VALUES(4, 'Huzaifa', 'Lahore', 1234567893)
INSERT INTO Student
VALUES(5, 'Hamza', 'Lahore', 1234567894)

INSERT INTO Course
VALUES(1, 'Biology', 3)
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
VALUES(2,1, 70)
INSERT INTO Marks
VALUES(2,2, 85)
INSERT INTO Marks
VALUES(2,3, 90)

INSERT INTO Marks
VALUES(3,1, 80)
INSERT INTO Marks
VALUES(3,2, 70)
INSERT INTO Marks
VALUES(3,3, 60)

INSERT INTO Marks
VALUES(4,1, 75)
INSERT INTO Marks
VALUES(4,2, 65)
INSERT INTO Marks
VALUES(4,3, 55)

INSERT INTO Marks
VALUES(5,1, 60)
INSERT INTO Marks
VALUES(5,2, 50)
INSERT INTO Marks
VALUES(5,3, 70)