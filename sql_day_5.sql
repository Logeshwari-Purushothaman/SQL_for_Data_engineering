-- FORIEGN KEY AND PRIMARY KEY
-- if you have 2 tables employee and department 
-- these 2 tables are related to eachother with some common values or common columns 
-- to access data from these 2 tables commonly then you can use foreign key to connect these 2 tables


--you can have departments aswell in employee table but departments are few and repeatitive for each employee
--hence duplication and redundancy of coloumns occurs 
-- to avoid this we are having a separate table as department with department id
-- now we use department id and in the employee table to avoid duplication and save memory

CREATE TABLE Employees(EmpID INT, EmpName varchar(100), Age TINYINT, DepartmentID TINYINT)

INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID)
Values (1,'Sourabh',30,1),
(2,'Deepak',32,2),
(3,'Ram',30,3),
(4,'Shruti',27,2)

CREATE TABLE Department (DepartmentID TINYINT PRIMARY KEY, DepartmentName varchar(100));

--in sql if you want to insert multiple values into multiple tables you can do as below
INSERT INTO Department(DepartmentID, DepartmentName) Values(1,'HR'),(2,'Sales'),(3,'Accounts');

Select * from Employees
Select * from Department

--if you insert a record with a department id as 6 you can do but there is no department id 6 which exists in department table

INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID) Values (1,'Akshara',30,6)

-- this is where foreign key comes into picture
-- FOREIGN KEY maintains referential integrity 
-- department ID is the primary key to department table
-- department ID is the foreign key to employee table

-- so while creating a column itself you need to declare which is a foreign key 
-- and to which table it is referenced to like below
 
--DROP is used to delete a table
DROP TABLE Employees;
DROP TABLE Department;

-- syntax to create a table with foreign key reference
CREATE TABLE Employees(EmpID INT, EmpName varchar(100), Age TINYINT, DepartmentID TINYINT,
Foreign key (DepartmentID) references Department(DepartmentID));

--here Department ID is the primary key
CREATE TABLE Department (DepartmentID TINYINT, DepartmentName varchar(100));

Select * from Employees
Select * from Department

INSERT INTO Department(DepartmentID, DepartmentName) Values(1,'HR'),(2,'Sales'),(3,'Accounts'),(NULL,'Medicine');


INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID)
Values (1,'Sourabh',30,1),
(2,'Deepak',32,2),
(3,'Ram',30,3),
(4,'Shruti',27,2)

--when I try to enter a department ID 6 now which does not exist in departmentID table
-- this will throw an error due to foreign key conflict
INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID) Values (1,'Akshara',30,6)

--use case
-- when u ask people to add a data and if they add a data that doesnt exit it may corrup the database and hence 
-- use of foreign key is always recommended

--provide employee along with departmentName
-- sourabh  | HR
-- Deepak   | Sales
-- Ram      | Accounts
-- Shruti   | Sales

-- but these 2 coloumns are in different tables
-- Use JOINS
-- use join only if 2 tables has common columns
-- in employees tables we have departmentID as common column

SELECT Emp.EmpName,Dept.DepartmentName 
from Employees as Emp
INNER JOIN Department as Dept
On Emp.DepartmentID=Dept.DepartmentID

-- INNER JOIN always gives records which has matching values in both tables
--hence null records which do not match with other table is ommited
--if department id is null in 1 table which is referenced into another table that record is omitted
-- if you have null values in both tables like below

INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID)
Values (6,'Wales',37,3)

INSERT INTO Department Values(4,NULL);


--Give me all employees with or without department (even if its null)
--note here left table is employees from where you want all records with or without department(for left side table)
-- hence we need to use LEFT JOIN

SELECT Emp.EmpName,Dept.DepartmentName  --left or right is determined here 
from Employees as Emp
LEFT JOIN Department as Dept
On Emp.DepartmentID=Dept.DepartmentID

Select * from Employees
Select * from Department

--all departments along with employee (for right side table)
--here department table is in right side 
-- RIGHT JOIN
SELECT Emp.EmpName,Dept.DepartmentName --left or right is determined here 
from Employees as Emp
Right JOIN Department as Dept
On Emp.DepartmentID=Dept.DepartmentID


--for retrieving all matching and non matching records also all those available records from both tables (for both sides of table)
-- use FULL JOIN

SELECT Emp.EmpName,Dept.DepartmentName 
from Employees as Emp
FULL JOIN Department as Dept
On Emp.DepartmentID=Dept.DepartmentID


--CROSS JOIN / CARTESIAN PRODUCT
--cross join is used when we want combination of records with all other records
--example - you need clothing product with all colours and all sizes hence all combos is required

SELECT Emp.EmpName,Dept.DepartmentName 
from Employees as Emp
CROSS JOIN Department as Dept

-------------SELF-JOIN---------------
--SELF JOIN is a concept of utilizing the same table as different tables to generate a data without duplicating it
-- like creating virtual copies for reuse
-- if you have a table which has columns
-- empID, EmpName, Age, DepartmentID, ManagerID
--manager is also an employee and hence he has a manager aswell
--to map empID-->ManagerID-->
--again ManagerID-->empID--repeat as above
--here only 1 table is used in different ways 
--how?


DROP TABLE Employees;

CREATE TABLE Employees(EmpID INT, EmpName varchar(100),Age TINYINT, DepartmentID TINYINT, ManagerID INT);

INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID, ManagerID)
Values (1,'Sourabh',30,1, 2),
(2,'Deepak',32,2,3),
(3,'Ram',30,3,4),
(4,'Shruti',27,2,1)

Select * from Employees;
--to return employee name and managername
--EmpName, ManagerName
-- Sourabh, Deepak
-- Deepak , Ram
-- Ram    , Shruti
-- Shruti , Sourabh

INSERT INTO Employees (EmpID , EmpName, Age, DepartmentID, ManagerID)
Values (1,'alaa',30,NULL, 5)

--no duplication here same table is utilised by assigning different names 
--same table on left and right side 
--this below concept is called self join
SELECT Emp.EmpName 'Employee', Mgr.EmpName 'Manager'
from Employees Emp 
INNER JOIN Employees Mgr
ON Emp.ManagerID=Mgr.EmpID

-----------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!------------------------
-----MOST IMPORTANT QUERY----------------------
---return record from a table that do not exist in other table (or)
-------return all employees that do no have department

Select * from Employees
Select * from Department

DROP TABLE Department;

--------------!!!!!!!!!!!!!----------------------
-----------------MOST IMPORTANT QUERY---------------
SELECT Emp.EmpName, Dept.DepartmentName from Employees Emp
LEFT JOIN Department Dept
ON Emp.DepartmentID=Dept.DepartmentID
where Dept.DepartmentID IS NULL
-----------------------------------------------------------------

--give me total number of employee that do not have department

select count(*) as no_department_employees from employees Emp 
LEFT JOIN Department Dept
ON Emp.DepartmentID=Dept.DepartmentID
where Dept.DepartmentID IS NULL

--give me all employees with department or without department but if department is not assigned 
--provide output as 'Not yet assigned'

select emp.EmpName, ISNULL(dept.DepartmentName,'dept not assigned') from employees emp 
LEFT JOIN Department dept 
ON emp.DepartmentID=dept.DepartmentID
where dept.DepartmentID is Null 

