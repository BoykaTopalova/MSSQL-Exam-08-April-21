SELECT u.Username, c.Name AS CategoryName  FROM Reports AS r
LEFT JOIN Users AS u ON u.Id=r.UserId
LEFT JOIN Categories AS c ON r.CategoryId = c.Id
WHERE DATEDIFF(DD,Birthdate,OpenDate)/365 = Age
ORDER BY u.Username,c.Name