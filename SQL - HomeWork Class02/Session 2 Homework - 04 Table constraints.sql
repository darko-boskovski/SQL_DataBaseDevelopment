
--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert

select * from dbo.GradeDetails

ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR [AchievementMaxPoints]
GO



--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints

ALTER TABLE dbo.GradeDetails WITH CHECK
ADD CONSTRAINT CK_GradeDetails_AchievementPoints
CHECK (AchievementPoints <= AchievementMaxPoints);


--Change AchievementType table to guarantee unique names across the Achievement types


ALTER TABLE dbo.AchievementType WITH CHECK
ADD CONSTRAINT CK_AchievementType_Name UNIQUE (Name)





