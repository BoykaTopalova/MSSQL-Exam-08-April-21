--Select the user's username and category name in all reports in which
--users have submitted a report on their birthday. 
--Order them by username (ascending) and then by category name (ascending). 

SELECT u.Username, c.Name FROM Reports AS r
LEFT JOIN Users AS u ON u.Id=r.UserId
LEFT JOIN Categories AS c ON r.CategoryId = c.Id
WHERE CAST(DATEDIFF(dd,OpenDate, DATEADD(YEAR,Age,Birthdate)) AS INT)%365=0
ORDER BY u.Username,c.Name