--Select all employees and show how many unique users each of them has served to. 

--Order by users count  (descending) and then by full name (ascending). 

SELECT  e.FirstName+' '+e.LastName AS FullName , COUNT(u.Username) AS UsersCount FROM Employees AS e
LEFT JOIN Reports AS r ON r.EmployeeId=e.Id
LEFT JOIN Users AS u ON u.Id=r.UserId
GROUP BY e.FirstName+' '+e.LastName
ORDER BY COUNT(u.Username) DESC,e.FirstName+' '+e.LastName