


--List all possible combinations of Courses names and AchievementType names that can be passed by student

select c.Name as CourseName, a.Name as AchievementTypeName
from dbo.Course c
cross join dbo.AchievementType a
GO


--List all Teachers that has any exam Grade

select DISTINCT t.FirstName as TeacherName, t.LastName as TeacherLastName, g.Grade as Grade
from dbo.Grade g
inner join dbo.Teacher t on t.ID = g.TeacherID
order by FirstName


--List all Teachers without exam Grade

select DISTINCT t.FirstName as TeacherName, t.LastName as TeacherLastName, g.Grade as Grade
from dbo.Teacher t
left join dbo.Grade g on g.TeacherID = t.ID
WHERE g.TeacherID is null



--List all Students without exam Grade (using Right Join)

select DISTINCT s.FirstName as StudentName, s.LastName as StudentLastName, g.Grade as Grade
from dbo.Grade g
right join dbo.Student s on s.ID = g.StudentID
WHERE g.StudentID is null

