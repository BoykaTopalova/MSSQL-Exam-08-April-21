CREATE FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT
AS
BEGIN 
DECLARE @result INT
	IF (@StartDate IS NULL)
	BEGIN
		SET @result = 0
	END
	ELSE IF (@EndDate IS NULL)
	BEGIN
		SET @result = 0
	END
	ELSE
	  BEGIN 
	   SET @result = DATEDIFF(HOUR,@StartDate,  @EndDate)
	  END
	  RETURN @result 
END


SELECT dbo.udf_HoursToComplete(OpenDate, CloseDate) AS TotalHours 

   FROM Reports 