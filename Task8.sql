
SELECT u.Username, c.Name AS CategoryName FROM Reports AS r
full JOIN Users AS u ON u.Id=r.UserId
full JOIN Categories AS c ON r.CategoryId = c.Id
WHERE DAY(Birthdate)=DAY(OpenDate) AND MONTH(Birthdate)=MONTH(OpenDate)
ORDER BY u.Username,c.Name