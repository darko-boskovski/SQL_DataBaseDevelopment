



 --Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student


 drop view if exists vv_StudentGrades
 go

 create view vv_StudentGrades
 as 
 select StudentID, count(Grade) as GradeCount  
 from dbo.[Grade] g
 inner join dbo.Student s on g.StudentID = s.ID
 group by StudentID
 go

 select * from vv_StudentGrades
 go

 --Change the view to show Student First and Last Names instead of StudentID


 create or alter view vv_StudentGrades
 as 
 select s.FirstName, s.LastName, StudentID, count(Grade) as GradeCount  
 from dbo.[Grade] g
 inner join dbo.Student s on g.StudentID = s.ID
 group by StudentID, s.FirstName,s.LastName
 go


 select * from vv_StudentGrades
 go


 --List all rows from view ordered by biggest Grade Count

  select * from vv_StudentGrades
  order by GradeCount desc
  go


 --Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit) 



 create or alter view vv_StudentGradeDetails
 as 
 select s.FirstName, s.LastName, count(CourseID) as ExamCount  
 from dbo.[Grade] g
 inner join dbo.Student s on g.StudentID = s.ID
 inner join dbo.GradeDetails gd on gd.GradeID = g.ID
 inner join dbo.Course c on g.CourseID = c.ID
 join dbo.AchievementType a on a.ID = gd.AchievementTypeID
 where a.Name = 'Ispit'
 group by s.FirstName,s.LastName
 go


 select * from vv_StudentGradeDetails
 order by ExamCount desc, FirstName
 go





