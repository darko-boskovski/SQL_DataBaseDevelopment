
-- List all Teacher First Names and Student First Names in single result set with duplicates


select * from dbo.Teacher

SELECT FirstName
FROM dbo.Teacher
UNION ALL
SELECT FirstName
FROM dbo.Student
GO


--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates

SELECT LastName
FROM dbo.Teacher
UNION 
SELECT LastName
FROM dbo.Student
GO

--List all common First Names for Teachers and Students

SELECT FirstName
FROM dbo.Teacher
INTERSECT
SELECT FirstName
FROM dbo.Student
GO


