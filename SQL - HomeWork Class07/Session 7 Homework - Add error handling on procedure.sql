/*
- Add error handling on CreateGradeDetail procedure
- Test the error handling by inserting not-existing values for AchievementTypeID
*/
ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_GradeDetails_GradeID] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[Grade]([Id]);
GO



CREATE OR ALTER PROCEDURE dbo.CreateGradeDetail    
		  (@GradeID int,
           @AchievementTypeID tinyint,
           @AchievementPoints tinyint,
           @AchievementMaxPoints tinyint,
           @AchievementDate datetime)
AS
BEGIN
	BEGIN TRY
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

	END TRY
	BEGIN CATCH  
		SELECT  
			ERROR_NUMBER() AS ErrorNumber
		,	ERROR_SEVERITY() AS ErrorSeverity
		,	ERROR_STATE() AS ErrorState
		,	ERROR_PROCEDURE() AS ErrorProcedure
		,	ERROR_LINE() AS ErrorLine
		,	ERROR_MESSAGE() AS ErrorMessage;

	END CATCH;  	
	


		   select 
		   cast(AchievementPoints as decimal(18,2))/cast(AchievementMaxPoints as decimal(18,2)) * cast(ParticipationRate as decimal (18,2)) as GradePoints
		   from dbo.GradeDetails gd
		   join dbo.AchievementType a on gd.AchievementTypeID = a.ID
		   where GradeID = @GradeID
		   
End
GO

-- **Gorniot Try Catch Block mi krashnuvashe pa go dodadov i ovoj dole na samiot Execute**



declare @today datetime = getdate()
begin try
exec  dbo.CreateGradeDetail    
		   @GradeID = -1,
           @AchievementTypeID  = 1,
           @AchievementPoints = -1,
           @AchievementMaxPoints = 100,
           @AchievementDate = @today
end try
	BEGIN CATCH  
		SELECT  
			ERROR_NUMBER() AS ErrorNumber
		,	ERROR_SEVERITY() AS ErrorSeverity
		,	ERROR_STATE() AS ErrorState
		,	ERROR_PROCEDURE() AS ErrorProcedure
		,	ERROR_LINE() AS ErrorLine
		,	ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;  

select * from GradeDetails where GradeID = 20127