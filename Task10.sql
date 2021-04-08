SELECT  ISNULL(e.FirstName+' '+e.LastName,'None') AS Employee,
		ISNULL(d.Name,'None') AS Department ,
		c.Name AS Category,
		r.Description AS Decription,
		FORMAT(r.OpenDate,'dd.MM.yyyy') AS OpenDate,
		s.Label  AS [Status],
		u.Name AS [User]
FROM Reports AS r
	 LEFT JOIN Users AS u ON r.UserId=u.Id
	 LEFT JOIN Status AS s ON r.StatusId=s.Id
	 LEFT JOIN Employees AS e ON e.Id=r.EmployeeId
	 LEFT JOIN Categories AS c ON c.Id=r.CategoryId
	 LEFT JOIN Departments AS d ON e.DepartmentId=d.Id
	 
ORDER BY e.FirstName DESC,e.LastName DESC, d.Name, c.Name,r.Description,FORMAT(r.OpenDate,'dd.MM.yyyy'),[Status],[User]

--------------------------------------------------------------------
SELECT ISNULL(FirstName + ' '+ LastName,'None') Employee, 
		ISNULL(d.Name , 'None') Department,
		c.Name Category, r.Description, CONVERT(VARCHAR, r.OpenDate, 104),
		s.Label Status, u.Name [User]
 FROM Reports r
 LEFT JOIN Users u ON u.Id = r.UserId
 LEFT JOIN Status s ON s.Id = r.StatusId
 LEFT JOIN Employees e ON e.Id = r.EmployeeId
 LEFT JOIN Categories c ON c.Id = r.CategoryId
 LEFT JOIN Departments d ON d.Id = e.DepartmentId
 ORDER BY FirstName DESC, LastName DESC , d.Name DESC, c.Name, Description, 
			CONVERT(VARCHAR, r.OpenDate, 104), s.Label, u.Name