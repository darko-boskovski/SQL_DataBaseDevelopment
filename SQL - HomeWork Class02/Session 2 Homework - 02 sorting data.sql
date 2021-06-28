

-- Find all Students with FirstName = Antonio ordered by Last Name

select * from dbo.Student 
where FirstName = 'Antonio'
order by LastName 



-- List all Students ordered by FirstName

select * from dbo.Student 
order by FirstName



--Find all Male students ordered by EnrolledDate, starting from the last enrolled

select * from dbo.Student 
where Gender = 'M'
order by EnrolledDate desc
