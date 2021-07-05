/*
Create new procedure called CreateGradeDetail
Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
Output from this procedure should be resultset with SUM of GradePoints calculated with 
formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
*/

--select * from dbo.GradeDetails
--go 

--select * from dbo.AchievementType
--go

CREATE OR ALTER PROCEDURE dbo.CreateGradeDetail    
		  (@GradeID int,
           @AchievementTypeID tinyint,
           @AchievementPoints tinyint,
           @AchievementMaxPoints tinyint,
           @AchievementDate datetime)
AS
BEGIN


INSERT INTO [dbo].[GradeDetails]
           ([GradeID]
           ,[AchievementTypeID]
           ,[AchievementPoints]
           ,[AchievementMaxPoints]
           ,[AchievementDate])
     VALUES
          (@GradeID,
           @AchievementTypeID,
           @AchievementPoints,
           @AchievementMaxPoints,
           @AchievementDate)
		   
		   select 
		   cast(AchievementPoints as decimal(18,2))/cast(AchievementMaxPoints as decimal(18,2)) * cast(ParticipationRate as decimal (18,2)) as GradePoints
		   from dbo.GradeDetails gd
		   join dbo.AchievementType a on gd.AchievementTypeID = a.ID
		   where GradeID = @GradeID
		   
End
GO



declare @today datetime = getdate()

exec  dbo.CreateGradeDetail    
		   @GradeID = 20127,
           @AchievementTypeID  = 0,
           @AchievementPoints = 60,
           @AchievementMaxPoints = 100,
           @AchievementDate = @today


select * from GradeDetails where GradeID = 20127
