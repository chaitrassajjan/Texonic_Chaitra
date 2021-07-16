
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
Insert into users values(4, "Max", 90000, 1);
Insert into users values(5, "Janet", 69000, 1);
Insert into users values(6, "Randy", 85000, 1);
Insert into users values(7, "Will", 70000, 1);

Users Table values retriving

SELECT * FROM Users u;

-----------------------------------------------
------------------------------------------------

Result 

 SELECT l.LanguageName as Department,
 u.Name as Employee, u.CommitCounts as Salary
 FROM Users u JOIN Language l ON u.LanguageID = l.Id
 ORDER BY CommitCounts DESC;

--------------------------------------------------------
--------------------------------------------------------



