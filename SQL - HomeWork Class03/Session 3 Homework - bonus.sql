
--  List all student First Name that are duplicated more than 3 time

	select Student.FirstName from Student 
	group by Student.FirstName
	having count(Student.FirstName) > 3
	go


--  List the First Name for all the student's that their Last Name is duplicated and they are born in 1985  (Hint use View)
	create or alter view vv_DuplicateLastName
	as 
	select FirstName 
	from dbo.Student
	where year(DateOfBirth) = 1985
	group by FirstName
	having count(LastName) >=2
	go


	select * from vv_DuplicateLastName
	go



--  Find how many courses each student (using Name and Last Name) has attended
	

 select s.FirstName, s.LastName, count(c.ID) as NumberOfCourses
 from dbo.[Grade] g
 inner join dbo.Course c on g.CourseID = c.ID
 inner join dbo.Student s on g.StudentID = s.ID
 group by StudentID, s.FirstName,s.LastName
 order by NumberOfCourses
 go


--  Find the students (using Name and Last Name) that have attended less than 20 courses and get their Min, Max and Average grade ordered by the Average Grade ascending


 select s.FirstName + ' ' + s.LastName as Student, count(c.ID) as NumberOfCourses, min(Grade) as LowestGrade, max(Grade) as MaxGrade, avg(Grade) as Average
 from dbo.[Grade] g
 inner join dbo.Course c on g.CourseID = c.ID
 inner join dbo.Student s on g.StudentID = s.ID
 group by s.FirstName + ' ' + s.LastName 
 having count(c.ID) < 20
 order by avg(Grade) asc
 go


--  For all the students (using First Name and Last Name) get their Min, Max and Average grade (Create view vv_StudentSuccess)

 create or alter view vv_StudentSuccess
	as 
 select s.FirstName + ' ' + s.LastName as Student,  min(Grade) as LowestGrade, max(Grade) as MaxGrade, avg(Grade) as Average
 from dbo.[Grade] g
 inner join dbo.Course c on g.CourseID = c.ID
 inner join dbo.Student s on g.StudentID = s.ID
 group by s.FirstName + ' ' + s.LastName 
 go

 select * from vv_StudentSuccess
 go


--  Find all the students that have achieved less than 25% from the AchievementMaxPoints for the AchievementType  'Domasni'

 select DISTINCT s.FirstName + ' ' + s.LastName as Student,  c.Name, gd.AchievementPoints as HomeworkPoints,gd.AchievementMaxPoints as MaxHomeworkPoints
 from dbo.[Grade] g
 inner join dbo.Student s on g.StudentID = s.ID
 inner join dbo.GradeDetails gd on gd.GradeID = g.ID
 inner join dbo.Course c on g.CourseID = c.ID
 join dbo.AchievementType a on a.ID = gd.AchievementTypeID
 where a.Name = 'Domasni'
 group by s.FirstName + ' ' + s.LastName, gd.AchievementPoints, gd.AchievementMaxPoints, c.Name
 having gd.AchievementPoints < (25 * 100 / gd.AchievementMaxPoints) 
 go




--  For the Students from the above list check what is their Success (Min, Max and Average grade) and order them by the AVG grade



