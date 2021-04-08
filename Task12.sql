CREATE PROC usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
AS
	DECLARE @EmployeeDepartmentId INT =0

	SET @EmployeeDepartmentId=(SELECT DepartmentId FROM Employees  WHERE Id = @EmployeeId);
	DECLARE @ReportCategoryDepartmentId INT =0
	SET @ReportCategoryDepartmentId = (
		SELECT D.Id
		FROM Categories AS C
		JOIN Reports AS R ON C.Id = R.CategoryId
		JOIN Departments AS D ON C.DepartmentId = D.Id
		WHERE R.Id = @ReportId
		)
 
	IF (@EmployeeDepartmentId != @ReportCategoryDepartmentId)
	THROW 50001, 'Employee doesn''t belong to the appropriate department!', 1
 
	UPDATE Reports
	SET EmployeeId = @EmployeeId
	WHERE Id = @ReportId
 
GO

EXEC usp_AssignEmployeeToReport 30, 1 
--Employee doesn't belong to the appropriate department! 

EXEC usp_AssignEmployeeToReport 17, 2 
--(1 row affected) 