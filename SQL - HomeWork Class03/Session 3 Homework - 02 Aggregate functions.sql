



--Calculate the count of all grades in the system

SELECT count(Grade) as AllGradesCount	
from dbo.[Grade]
GO

--Calculate the count of all grades per Teacher in the system

SELECT t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as AllGradesCount
FROM dbo.[Grade] g
join dbo.Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName, t.LastName
order by count(Grade)
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as AllGradesFirst100
FROM dbo.Grade g
join dbo.Teacher t on g.TeacherID = t.ID
join dbo.Student s on g.StudentID = s.ID
where s.ID < 100
GROUP BY t.FirstName, t.LastName
order by count(Grade)
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system


SELECT s.FirstName + ' ' + s.LastName as StudentName, max(Grade) as MaxGrade, AVG(Grade) as AvarageGrade
FROM dbo.Grade g
join dbo.Teacher t on g.TeacherID = t.ID
join dbo.Student s on g.StudentID = s.ID
group by s.FirstName, s.LastName
order by max(Grade)desc, avg(Grade) desc
GO

