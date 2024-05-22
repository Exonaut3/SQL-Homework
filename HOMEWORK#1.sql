CREATE DATABASE Homework1;
USE Homework1; 
CREATE TABLE Student (
ID int,
FirstName nvarchar(255),
LastName nvarchar(255),
DateOfBirth Date,
EnrolledDate Date,
NationalIDNumber int,
StudentCardNumber int
)


CREATE TABLE Teacher (
ID int,
FirstName nvarchar(255),
LastName nvarchar(255),
DateOfBirth Date,
AcademicRank tinyInt,      -- I guess it makes sense?
HireDate Date
)

CREATE TABLE Grade(
StudentID int,
CourseID int,
TeacherID int,
Grade tinyInt,
Comment text,
CreatedDate Date
)

CREATE TABLE Course (
Name nvarchar(255),
Credit tinyInt,
AcademicYear Date,
Semester tinyInt,
)

CREATE TABLE GradeDetails (
ID int,
GradeId int,
AchievementTypeId int,
AchievementPoints int,
AchievementMaxPoints int,
AchievementDate Date
)

CREATE TABLE AchievementType(
ID int,
Name nvarchar(255),
Description text,
ParticipationRate decimal,
)