--Find all reports that don't have an assigned employee. Order the results by OpenDate in ascending order, 
--then by description ascending. OpenDate must be in format - 'dd-MM-yyyy' 

SELECT [Description], FORMAT(OpenDate,'dd-MM-yyyy') AS OpenDates FROM Reports AS r
LEFT JOIN Employees AS e ON r.EmployeeId = e.Id
WHERE EmployeeId IS NULL
ORDER BY OpenDate ,[Description]

