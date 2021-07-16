 SELECT l.LanguageName as Department,
 u.Name as Employee, u.CommitCounts as Salary
 FROM Users u JOIN Language l ON u.LanguageID = l.Id
 ORDER BY CommitCounts DESC;