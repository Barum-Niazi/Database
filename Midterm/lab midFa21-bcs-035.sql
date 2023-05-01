CREATE DATABASE Result_db
use Result_db

CREATE TABLE Students(
std_id varchar(10) PRIMARY KEY,
std_name varchar(255),
std_address varchar(255),
program_id varchar(10) FOREIGN KEY REFERENCES Program(program_id)
)

CREATE TABLE Program(
program_id varchar(10) PRIMARY KEY,
program_name varchar(255) NOT NULL UNIQUE,
program_duration INT 
CHECK (program_duration>=2)
)

CREATE TABLE Courses(
course_id varchar(10) PRIMARY KEY,
course_name varchar(255) NOT NULL UNIQUE,
program_id varchar(10) FOREIGN KEY REFERENCES Program(program_id),
Credit_hours INT
CHECK (Credit_hours > 0)
)

CREATE TABLE Marks(
std_id varchar(10) FOREIGN KEY REFERENCES Students(std_id),
course_id varchar(10) FOREIGN KEY REFERENCES Courses(course_id),
Grade int
CONSTRAINT PK_Marks PRIMARY KEY(std_id, course_id)
)

INSERT INTO Students
VALUES('Std_1', 'Ali', '24 A DG Lahore', 'P-1')
INSERT INTO Students
VALUES('Std_2', 'Bilal', '101 H wapda town Lahore', 'P-1')
INSERT INTO Students
VALUES('Std_3', 'Amjad', '26 Kamran Block Lahore', 'P-2')
INSERT INTO Students
VALUES('Std_4', 'Akhtar', 'H. #25 H7 Islamabad', 'P-1')
INSERT INTO Students
VALUES('Std_5', 'Amjad', '25 Azmat Road Multan Cantt', 'P-2')

INSERT INTO Program
VALUES('P-1', 'BSCS', 4)
INSERT INTO Program
VALUES('P-2', 'BSSE', 4)
INSERT INTO Program
VALUES('P-3', 'BSEE', 4)
INSERT INTO Program
VALUES('P-4', 'MSCS', 2)
INSERT INTO Program
VALUES('P-5', 'MSEE', 2)

INSERT INTO Courses
VALUES('CS101', 'Intro to computing', 'P-1', 4)
INSERT INTO Courses
VALUES('CS201', 'Programming Fundamentals', 'P-1', 4)
INSERT INTO Courses
VALUES('CS371', 'Database Systems I', 'P-1', 4)
INSERT INTO Courses
VALUES('CS420', 'Software Engineering','P-1', 3)
INSERT INTO Courses
VALUES('CS702', 'Adv Databases', 'P-1', 3)


INSERT INTO MARKS
VALUES('Std_1', 'CS101', 80)
INSERT INTO MARKS
VALUES('Std_1', 'CS201', 80)
INSERT INTO MARKS
VALUES('Std_2', 'CS101', 70)
INSERT INTO MARKS
VALUES('Std_3', 'CS201', 60)
INSERT INTO MARKS
VALUES('Std_3', 'CS371', 80)
