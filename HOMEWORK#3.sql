-- 1. Calculate the count of all grades per Teacher in the system

SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS GradesGiven
FROM [dbo].[Grade] AS g
JOIN [dbo].[Teacher] AS t ON t.ID = g.TeacherID
GROUP BY t.FirstName , t.LastName

-- I CANNOT FUCKING BELIEVE THIS WORKED MAN 
-- ACTUALLY INSANE
-- AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
GO

-- 2. Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS GradesGiven
FROM [dbo].[Grade] AS g
JOIN [dbo].[Teacher] AS t ON t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.FirstName , t.LastName
GO

-- 3 Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT s.ID, s.FirstName, s.LastName, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Grade] AS g
JOIN [dbo].[Student] AS s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
GO

-- 4. Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS GradesGiven
FROM [dbo].[Grade] AS g
JOIN [dbo].[Teacher] AS t ON t.ID = g.TeacherID
GROUP BY t.FirstName , t.LastName
HAVING COUNT(g.Grade) > 200
GO

-- 5. Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system.
-- Filter only records where Maximal Grade is equal to Average Grade

SELECT s.ID, s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Grade] AS g
JOIN [dbo].[Student] AS s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING  MAX(g.Grade) = AVG(g.Grade)
GO

-- 6. List Student First Name and Last Name next to the other details from previous query

SELECT s.ID, s.FirstName, s.LastName, COUNT(g.Grade) AS GradeCount, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM [dbo].[Grade] AS g
JOIN [dbo].[Student] AS s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING  MAX(g.Grade) = AVG(g.Grade)

--ITS THE SAME LMAO
GO

-- 7. Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW [vv_StudentGrades]
AS
SELECT s.ID, COUNT(g.Grade) AS CountOfGrades 
FROM [dbo].[Grade] AS g
JOIN [dbo].[Student] AS s ON s.ID = g.StudentID
GROUP BY s.ID
GO

-- 8. Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW [dbo].[vv_StudentGrades]
AS
SELECT s.FirstName, s.LastName,  COUNT(g.Grade) AS CountOfGrades 
FROM [dbo].[Grade] AS g
JOIN [dbo].[Student] AS s ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName

--ne sum siguren dali morashe se ova da go prepisham ali od eksternite resursi sto gi imavte staveno vo readme-to, vaka go prikazaa 
GO

-- 9. List all rows from view ordered by biggest Grade Count
SELECT *
FROM [dbo].[vv_StudentGrades] sg
ORDER BY sg.CountOfGrades DESC
