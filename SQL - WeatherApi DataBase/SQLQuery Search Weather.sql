
CREATE OR ALTER PROCEDURE dbo.GetWeatherDetail    
(
           @CityName nvarChar(100) ,
		   @Language nvarChar(100) = "eng",
		   @Date datetime2 = NULL
		   )
AS 


IF @Date IS NULL

BEGIN

SET @Date = GETDATE() + 3; 

SELECT * FROM dbo.[WeatherData] w
			INNER JOIN dbo.Cities c ON w.CityId = c.Id
			where c.Name = @CityName AND w.Date <= @Date AND 
			@Language = w.Language

END

ELSE 

BEGIN

SELECT * FROM dbo.[WeatherData] w
			INNER JOIN dbo.Cities c ON w.CityId = c.Id
			where c.Name = @CityName AND w.Date = @Date AND 
			@Language = w.Language

END

exec dbo.GetWeatherDetail
           @CityName = 'London',
		   @Language = 'eng',
		   @Date = '2022-04-08'