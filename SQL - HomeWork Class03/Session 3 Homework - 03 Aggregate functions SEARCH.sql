

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as AllGradesCount
FROM dbo.[Grade] g
join dbo.Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName, t.LastName
having count(Grade) > 200
order by count(Grade) 
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as AllGradesFirst100
FROM dbo.Grade g
join dbo.Teacher t on g.TeacherID = t.ID
join dbo.Student s on g.StudentID = s.ID
where s.ID < 100
GROUP BY t.FirstName, t.LastName
having count(Grade) > 50
order by count(Grade)
GO


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT s.FirstName , max(Grade) as MaxGrade, AVG(Grade) as AvarageGrade
FROM dbo.Grade g
join dbo.Teacher t on g.TeacherID = t.ID
join dbo.Student s on g.StudentID = s.ID
group by s.FirstName, s.LastName
having max(Grade) = avg(Grade)
order by max(Grade)desc, avg(Grade) desc
GO


--List Student First Name and Last Name next to the other details from previous query

SELECT s.FirstName + ' ' + s.LastName as StudentName, max(Grade) as MaxGrade, AVG(Grade) as AvarageGrade
FROM dbo.Grade g
join dbo.Teacher t on g.TeacherID = t.ID
join dbo.Student s on g.StudentID = s.ID
group by s.FirstName, s.LastName
having max(Grade) = avg(Grade)
order by max(Grade)desc, avg(Grade) desc
GO


