/*
Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	- StudentCardNumber without “sc-”
	- “ – “
	- First character of student FirstName
	- “.”
	- Student LastName
	
	example:
	sc-77712 => 77712-P.Manaskov

*/

use SEDCHome
select * from Student

DROP FUNCTION IF EXISTS dbo.fn_FormaStudentName;
GO

CREATE or Alter FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS Nvarchar(100)
AS 
BEGIN

DECLARE @Output Nvarchar(100)

select @Output = replace(StudentCardNumber,'sc-', ' ')  + '-' + left(FirstName,1) + '.' + LastName
from [dbo].[Student]
where ID = @StudentId

RETURN @Output

END
GO


select *,dbo.fn_FormatStudentName(ID) 
from dbo.Student
