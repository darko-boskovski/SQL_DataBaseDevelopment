
/*
-- Create multi-statement table value function that for specific 
-- Teacher and Course will return list of students (FirstName, LastName) 
-- who passed the exam, together with Grade and CreatedDate
*/


drop function if exists dbo.fn_StudentThatPassedExam
go


CREATE or alter FUNCTION dbo.fn_StudentThatPassedExam (@TeacherId int, @CourseId int)
RETURNS @output TABLE (FirstName nvarchar(100), LastName nvarchar(100), Grade int, CreatedDate date)
AS
BEGIN

	INSERT INTO @output 
	select s.FirstName, s.LastName, g.Grade , g.CreatedDate
	from dbo.[Grade] g
	join dbo.Student s on g.StudentID = s.ID
	join dbo.Teacher t on g.TeacherID = t.ID
	join dbo.Course c ON g.CourseID = c.ID
	where g.TeacherId = isnull (@TeacherId, TeacherID)
	and g.CourseID = isnull (@CourseId, CourseID) 	

RETURN 
END

GO


declare @TeacherId int = 3
declare @CourseId int = 3


select * from dbo.fn_StudentThatPassedExam (@TeacherId,  @CourseId)
order by Grade
