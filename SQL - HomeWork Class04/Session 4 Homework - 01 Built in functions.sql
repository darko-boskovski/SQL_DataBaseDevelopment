/*
Declare scalar variable for storing FirstName values
	Assign value ‘Antonio’ to the FirstName variable
	Find all Students having FirstName same as the variable
*/


DECLARE @FirstName nvarchar(100)
set @FirstName = 'Antonio'

SELECT * 
FROM Student
WHERE FirstName = @FirstName
GO



/*
Declare table variable that will contain StudentId, Student Name and DateOfBirth
	Fill the table variable with all Female students
*/

DECLARE @StudentList TABLE 
(StudentId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @StudentList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

select * from @StudentList
GO



/*
Declare temp table that will contain LastName and EnrolledDate columns
	Fill the temp table with all Male students having First Name starting with ‘A’
	Retrieve the students from the table which last name is with 7 characters
*/




CREATE TABLE #StudentEnrollDateList
(LastName NVARCHAR(100), EnrollDate date);

INSERT INTO #StudentEnrollDateList
SELECT LastName, EnrolledDate
from dbo.Student
where FirstName like 'A%' and Gender = 'M'

SELECT * 
FROM #StudentEnrollDateList
where Len(LastName) = 7


drop table #StudentEnrollDateList
GO



/*
Find all teachers whose FirstName length is less than 5
	, and the first 3 characters of their FirstName and LastName are the same
*/

CREATE TABLE #TeachersList
(FirstName NVARCHAR(100),LastName NVARCHAR(100));

INSERT INTO #TeachersList
SELECT FirstName, Lastname
from dbo.Teacher
where Len(FirstName) < 5 and Left(FirstName, 3) = Left(LastName, 3)

SELECT * 
FROM #TeachersList



drop table #TeachersList
GO

