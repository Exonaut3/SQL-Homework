USE SEDC_ACADEMY_HOMEWORK
GO

-- Declare scalar variable for storing FirstName values
-- Assign value ‘Antonio’ to the FirstName variable
-- Find all Students having FirstName same as the variable

DECLARE @FirstNameStorage nvarchar(100)
SET @FirstNameStorage = 'Antonio'

SELECT * FROM [dbo].[Student] s
WHERE s.FirstName = @FirstNameStorage
GO

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- Fill the table variable with all Female students


DECLARE @FemaleStudentInfo TABLE (StudentId int, StudentName nvarchar(100), DateOfBirth date)
INSERT INTO @FemaleStudentInfo
SELECT s.ID, s.FirstName + ' ' + s.LastName, s.DateOfBirth
FROM [dbo].[Student] s
WHERE s.Gender = 'F'
SELECT * FROM @FemaleStudentInfo
GO

-- Declare temp table that will contain LastName and EnrolledDate columns
-- Fill the temp table with all Male students having First Name starting with ‘A’

-- IMPORTANT!!!! 
-- The table is already created, don't shove more students in there, it will get cramped

CREATE TABLE #MaleStudentInfo (LastName nvarchar(100), EnrolledDate date)
INSERT INTO #MaleStudentInfo
SELECT s.LastName, s.EnrolledDate
FROM [dbo].[Student] s
WHERE s.FirstName LIKE 'A%' AND s.Gender = 'M'

SELECT * FROM #MaleStudentInfo
-- Retrieve the students from the table which last name is with 7 characters
SELECT * FROM #MaleStudentInfo msi
WHERE LEN(msi.LastName) = 7
GO

-- Find all teachers whose FirstName length is less than 5 and
-- the first 3 characters of their FirstName and LastName are the same
SELECT * FROM [dbo].[Teacher] t
WHERE LEN(t.FirstName) < 5
AND
LEFT(t.FirstName, 3) = LEFT(t.LastName, 3)
