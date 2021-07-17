
------------------
DataBase Creation

create database texonic3;
------------------------
-------------------------

Language Table

create table Language(Id int PRIMARY KEY, LanguageName varchar(20));

Langauge Table values

Insert into language values(1, "Python");
Insert into language values(2, "JavaScript");
Insert into language values(3, "PHP");
Insert into language values(4, "C++");
Insert into language values(5, "SQL");

Langauage Table values retriving

SELECT * FROM Language l;

---------------------------------------------------------------------
---------------------------------------------------------------------

Users Table

create table Users(Id int PRIMARY KEY, Name varchar(20), CommitCounts int, LanguageID int, FOREIGN KEY(LanguageID) REFERENCES Language(Id));

Users Table values

Insert into users values(1, "Joe", 85000, 1);
Insert into users values(2, "Henry", 80000, 2);
Insert into users values(3, "Sam", 60000, 2);
Insert into users values(4, "Max", 90000, 3);
Insert into users values(5, "Janet", 69000, 5);
Insert into users values(6, "Randy", 85000, 3);
Insert into users values(7, "Will", 70000, 4);
Insert into users values(8, "John", 82000, 1);
Insert into users values(9, "Virat", 92000, 4);
Insert into users values(10, "Rohit", 62000, 5);

Users Table values retriving

SELECT * FROM Users u;

-----------------------------------------------
------------------------------------------------

Result 

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

--------------------------------------------------------
--------------------------------------------------------

Explaination on Result

- In SQL programming language Janet has done maximum number of commits so Janet will get highest Salary.
- In Python programming language Joe has done maximum number of commits so Joe will get highest Salary.
- In PHP programming language Max has done maximum number of commits so Max will get highest Salary.
- In JavaScript programming language Henry has done maximum number of commits so Henry will get highest Salary.
- In C++ programming language Virat has done maximum number of commits so Virat will get highest Salary.

