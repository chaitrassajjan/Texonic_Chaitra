
------------------
DataBase Creation

create database texonic4;
------------------------
-------------------------

Trips Table

CREATE table Trips(Id int PRIMARY KEY, Client_Id int, Driver_Id int, City_Id int, Status char(20), Request_at date);

Trips Table values

insert into trips values (1,1,10,1,"completed",'2013-10-01');
insert into trips values (2,2,11,1,"cancelled_by_driver",'2013-10-01');
insert into trips values (3,3,12,6,"completed",'2013-10-01');
insert into trips values (4,4,13,6,"cancelled_by_client",'2013-10-01');
insert into trips values (5,1,10,1,"completed",'2013-10-02');
insert into trips values (6,2,11,6,"completed",'2013-10-02');
insert into trips values (7,3,12,6,"completed",'2013-10-02');
insert into trips values (8,2,12,12,"completed",'2013-10-03');
insert into trips values (9,3,10,12,"completed",'2013-10-03');
insert into trips values (10,4,13,12,"cancelled_by_driver",'2013-10-03');

Trips Table values retriving

SELECT * FROM Trips t;

---------------------------------------------------------------------
---------------------------------------------------------------------

Users Table

create table users(Users_Id int, Banned char(20), Role char(20));

Users Table values

insert into users values(1,"No","client");
insert into users values(2,"Yes","client");
insert into users values(3,"No","client");
insert into users values(4,"No","client");
insert into users values(10,"No","driver");
insert into users values(11,"No","driver");
insert into users values(12,"No","driver");
insert into users values(13,"No","driver");

Users Table values retriving

SELECT * FROM Users u;

----------------------------------------------
----------------------------------------------

Result 

SELECT Request_at AS Day,
ROUND(SUM(IF(Status<>"completed", 1, 0))/COUNT(Status),2) AS "Cancellation Rate"
FROM Trips
WHERE Request_at BETWEEN "2013-10-01" AND "2013-10-03"
AND Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
GROUP BY Request_at;
--------------------------------------------------------
--------------------------------------------------------


Explaintation on Result

On 2013-10-01:

- There were 4 requests in total, 2 of which were canceled.
- However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
- Hence there are 3 unbanned requests in total, 1 of which was canceled.
- The Cancellation Rate is (1 / 3) = 0.33

  On 2013-10-02:
- There were 3 requests in total, 0 of which were canceled.
- The request with Id=6 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned requests in total, 0 of which were canceled.
- The Cancellation Rate is (0 / 2) = 0.00

  On 2013-10-03:
- There were 3 requests in total, 1 of which was canceled.
- The request with Id=8 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned request in total, 1 of which were canceled.
- The Cancellation Rate is (1 / 2) = 0.50

