-- 1. Find all Students with FirstName = Antonio
SELECT * 
FROM [dbo].[Student] s
WHERE s.FirstName = 'Antonio'
GO

-- 2. Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM [dbo].[Student] s
WHERE s.DateOfBirth > '01.01.1999'
GO

-- 3. Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM [dbo].[Student] s
WHERE s.LastName LIKE 'J%' AND s.EnrolledDate >= '01.01.1998' AND s.EnrolledDate <= '01.31.1998'
GO
--No such student. I love scams
--me interesira dali ako stavam between i gi nabrojam dvata datumi, dali ke gi broi i samite datumi ili samo toa izmegju niv?

-- 4. List all Students ordered by FirstName
SELECT * 
FROM [dbo].[Student] s 
ORDER BY s.FirstName 


-- 5. List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT s.LastName
FROM [dbo].[Student] s 
UNION 
SELECT t.LastName
FROM [dbo].[Teacher] t

-- 6. List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT * 
FROM [dbo].[Course]
SELECT*
FROM [dbo].[AchievementType]

SELECT c.Name, a.*
FROM [dbo].[Course] c
CROSS JOIN [dbo].[AchievementType] as a

-- 7. List all Teachers without exam Grade
SELECT *
FROM [dbo].[Grade]

SELECT DISTINCT t.*
FROM [dbo].[Teacher] AS t
JOIN [dbo].[Grade] AS g ON  (SELECT DISTINCT g.TeacherID) = t.ID 

-- tuka malce zalgaviv 
-- ako koristam left join mi dava 88 a regularen join samo 84 
-- nekako ushte ne sum siguren zoshto taka pravi ali -----------it is what it is 

