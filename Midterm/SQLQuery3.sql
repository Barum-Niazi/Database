use Result_db

SELECT * FROM Marks ORDER BY std_id
SELECT * FROM Marks ORDER BY course_id

SELECT * FROM Courses WHERE course_name LIKE 'S%n'  

Select * FROM Program WHERE program_name LIKE '%ba%'

SELECT * FROM Courses WHERE course_name LIKE '%s_a%'

SELECT DISTINCT course_id FROM Marks

SELECT students.std_name FROM students, Marks
WHERE Students.std_id = Marks.std_id AND Marks.course_id = 'CS101'

SELECT * FROM Marks WHERE course_id = 'CS371' AND Grade BETWEEN 70 AND 90

SELECT COUNT(Grade) As Num FROM Marks
SELECT AVG(GRADE) as AverageMarks FROM Marks 

ALTER TABLE Courses
DROP CONSTRAINT PK_Courses

ALTER TABLE Students
DROP CONSTRAINT PK_Students
