/*
Create new procedure called CreateGrade
Procedure should create only Grade header info (not Grade Details) 
Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
*/


CREATE OR ALTER PROCEDURE dbo.CreateGrade
(@StudentID int,
  @CourseID smallint,
  @TeacherID smallint,
  @Grade tinyint,
  @Comment nvarchar(100),
  @CreatedDate datetime)
AS
BEGIN

INSERT INTO [dbo].[Grade]([StudentID],[CourseID],[TeacherID],[Grade],[Comment],[CreatedDate])
     VALUES
	 (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate)


	 select
		count(*) as TotalNumberOfGrades
	from
		[dbo].[Grade]
	where
		StudentID = @StudentID

	select
		Max(Grade) MaxGradeOfAll
	from
		[dbo].[Grade]
	where
		StudentID = @StudentID
	and TeacherID = @TeacherID

        
END
GO
declare @today datetime = getdate()

EXEC dbo.CreateGrade @StudentID = 1, @CourseID = 1, @TeacherID = 1, @Grade = 7, @Comment = 'New Create Grade Record', @CreatedDate = @today
GO

select
	top (10) * 
from
	[dbo].[Grade]
order by
	Id desc
GO