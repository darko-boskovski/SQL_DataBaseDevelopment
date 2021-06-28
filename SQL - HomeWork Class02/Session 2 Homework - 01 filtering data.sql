




select * from dbo.Student



SELECT * 
FROM dbo.Student
WHERE FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT * 
FROM Student
WHERE DateOfBirth > '1999.01.01'
GO

--Find all Male students

SELECT * 
FROM dbo.Student
WHERE Gender = 'M'
GO

--Find all Students with LastName starting With ‘T’

SELECT * 
FROM dbo.Student
WHERE LastName like 'T%'
GO

--Find all Students Enrolled in January/1998

SELECT * 
FROM Student
WHERE EnrolledDate > '1998.01.01' and EnrolledDate < '1998.02.01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * 
FROM Student
WHERE LastName like 'J%'
and EnrolledDate > '1998.01.01' and EnrolledDate < '1998.02.01'
GO

