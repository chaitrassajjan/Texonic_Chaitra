SELECT l.LanguageName AS Department, u.Name AS Employee, u.CommitCounts AS Salary
FROM Users u
JOIN Language l
ON u.LanguageID = l.Id
WHERE (LanguageID, CommitCounts) IN(
        SELECT  LanguageID, MAX(CommitCounts) AS Salary
        FROM Users u
        GROUP BY LanguageID
        )
ORDER BY LanguageName DESC;