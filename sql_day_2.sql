-------------------------DATATYPES----------------------------
--STRING/TEXT DATATYPES---

--1. Datatype Char
--Char(10) = When we use this, mentioned amount of memory is allocated even if the actual value is size 2 it will occupy 10 blocks
--So datatype Char is only be used when the value is of fixed size eg1. gender where Char(1) to specify  M/F
--eg2 Priority Char(1) H/M/L
CREATE TABLE Employee_Demo(EmpName Char(10))

SELECT * from Employee_Demo;

--inserts values into the table because the size matches condition less then or equal to 10
-- but the remained unused space memory is wasted 
INSERT INTO Employee_Demo(EmpName) VALUES ('ANOOP');
INSERT INTO Employee_Demo(EmpName) VALUES ('ANUSHA');

--Throws error because Char(10) but here the size greater than 10 
INSERT INTO Employee_Demo(EmpName) VALUES ('ANUSHA AYYANAR');

--2. Datatype varchar - used for larger datasets
--varchar(10) = When we use this, mentioned amount of max memory limit is set, but the character will be dynamically changed acc. to the name
--if name is akalya it will only occupy memory of 5 letters but max allowed limit should be 10
--so datatype varchar is used for the variable/dynamic character types eg. name

CREATE TABLE Employee_Demo1(EmpName varchar(10))

SELECT * from Employee_Demo1;


--inserts values into the table because the size matches 10
INSERT INTO Employee_Demo1(EmpName) VALUES ('ANOOP');
INSERT INTO Employee_Demo1(EmpName) VALUES ('ANUSHA');

--Throws error because Char(10) but here the size greater than 10 
INSERT INTO Employee_Demo1(EmpName) VALUES ('ANUSHA AYYANAR');


--3. Datatype nvarchar
--nvarchar - allows you to create letters from different languages which is a limitation in varchar datatype
--nvarchar(10) = When we use this, we can use letters of other languages aswell as previously mentioned amount of max memory limit is set, but the character will be dynamically changed acc. to the name
--if name is கங்குல் it will allow to use this name and only occupy memory of 5 letters but max allowed limit should be 10
--So datatype nvarchar is used for the other language character types eg. கங்குல்
--but should use n before allocating actual value like below

CREATE TABLE Employee_Demo2(EmpName varchar(10),Gender Char(1),name_in_language nvarchar(10))

SELECT * from Employee_Demo2;


--inserts values into the table because the size matches 10
INSERT INTO Employee_Demo2(EmpName,Gender,name_in_language) VALUES ('GANGUL','M',N'கங்குல்');
INSERT INTO Employee_Demo2(EmpName,Gender,name_in_language) VALUES ('TELUGU','M',N'తెలుగు');


----NUMERICAL DATATYPES---
--1. INT - used to store integers with larger values
--2. Decimal(P,S) --P=Precision and S=Scale (actual value is precision, decimal after value is scale, used for data's like salary and other banking datas
--3. tinyint - used for limited/smaller value of integer like age so that it wont allow 4 or 5 digit value as age 
CREATE TABLE Employee_Demo3(EmpName varchar(10),Gender Char(1),Age int,Salary decimal(7,2),Age_1 tinyint);  

SELECT * from Employee_Demo3;

INSERT INTO Employee_Demo3(EmpName,Gender,Age,Salary) VALUES ('GANGUL','M',43,15000.97);

--here the decimal values are automatically replaced with 2 zeros as 00 in the table
INSERT INTO Employee_Demo3(EmpName,Gender,Age,Salary) VALUES ('ANUP','M',29,90000);

--here we have 3 digits in decimal but it is automatically rounded off to 2 since we set it as 2
INSERT INTO Employee_Demo3(EmpName,Gender,Age,Salary) VALUES ('AKSHARA','M',34,8000.978);


CREATE TABLE Employee_Demo4(EmpName varchar(10),Gender Char(1),Age int,Salary decimal(7,2),Age_1 tinyint); 

SELECT * from Employee_Demo4;

--throws overflow error for datatype tinyint
INSERT INTO Employee_Demo4(EmpName,Gender,Age,Salary,Age_1) VALUES ('SHUBAM','M',34,8000.978,7888);
--no error is thrown here since Age_1 has limited value now
INSERT INTO Employee_Demo4(EmpName,Gender,Age,Salary,Age_1) VALUES ('ANAYAK','M',74,8000.978,78);


----BOOLEAN DATATYPES---
--1. bit - used to store 0 or 1 values

CREATE TABLE Employee_Demo5(EmpName varchar(10),Gender Char(1),Age int,Salary decimal(7,2),Age_1 tinyint,IsRetired bit);  

SELECT * from Employee_Demo5;

INSERT INTO Employee_Demo5(EmpName,Gender,Age,Salary,Age_1,IsRetired) VALUES ('PAVAI','M',34,8000.978,8,0);


----BINARY DATATYPES---
--used to store picture,images,audio,video used with syntax varbinary (not a use case for us)


----Date and Time DATATYPE----
CREATE TABLE Employee_Demo6(EmpName varchar(10),Gender Char(1),Age tinyint,Salary decimal(7,2),IsRetired bit,JoiningDate Date);  

SELECT * from Employee_Demo6;

INSERT INTO Employee_Demo6(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('PAVAI','F',34,8000.979,0,'1996-01-03');


-----------------------------------------------------------------------------------------------
CREATE TABLE Employee_Record(EmpName varchar(10),Gender Char(1),Age tinyint,Salary decimal(7,2),IsRetired bit,JoiningDate Date);  

SELECT * from Employee_Record;

--here we have 2 records with identical names as vishnu so when we need a particular record of vishnu is required
--it will create problems of which vishnu ? and hence to avoid this we are going with primary key concept
INSERT INTO Employee_Record(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('VISHNU','M',34,900.9,0,'1995-01-09');
INSERT INTO Employee_Record(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('VISHNU','F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('VISHNU','F',34,8000.979,0,'1996-01-03');

--PRIMARY KEY--

--primary key are usually id which will have int as datatype
--this key will always be unique and should be a null values and no duplicates

CREATE TABLE Employee_Record1(EmpId int Primary key,EmpName varchar(10),Gender Char(1),Age tinyint,Salary decimal(7,2),IsRetired bit,JoiningDate Date); 

SELECT * from Employee_Record1;

INSERT INTO Employee_Record1(EmpId,EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (1,'VISHNU','M',34,900.9,0,'1995-01-09');
INSERT INTO Employee_Record1(EmpId,EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (2,'VISHNU','F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record1(EmpId,EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (3,'VISHNU','F',34,8000.979,0,'1996-01-03');

-- since 0 is value that has been taken
INSERT INTO Employee_Record1(EmpId,EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (0,'VISHNU','F',34,8000.979,0,'1996-01-03');
--throws error violation of primary key because primary key value is duplicated
INSERT INTO Employee_Record1(EmpId,EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (2,'VISHNU','F',34,8000.979,0,'1996-01-03');

--Incase of large datasets we cannot manually enter id for each row hence we need to auto increment the id
-- for the we need to provide identity along with primary key with seed and increment value


CREATE TABLE Employee_Record2(EmpId int Primary key IDENTITY(1,1),EmpName varchar(10),Gender Char(1),Age tinyint,Salary decimal(7,2),IsRetired bit,JoiningDate Date); 

SELECT * from Employee_Record2;

--autoincrement values from 1 by 1
INSERT INTO Employee_Record2(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ALBA','M',34,900.9,0,'1995-01-09');
INSERT INTO Employee_Record2(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ESHA','F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record2(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('CASANDRA','F',34,8000.979,0,'1996-01-03');

--autoincrement values from 20 by 2

CREATE TABLE Employee_Record3(EmpId int Primary key IDENTITY(20,2),EmpName varchar(10),Gender Char(1),Age tinyint,Salary decimal(7,2),IsRetired bit,JoiningDate Date); 

SELECT * from Employee_Record3;

INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ALBA','M',34,900.9,0,'1995-01-09');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ESHA','F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('CASANDRA','F',34,8000.979,0,'1996-01-03');

------SELECT * from Employee_Record3; this will show entire table---


INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ALBA','M',34,900.9,0,'1995-01-09');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ALBA','F',34,7346,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('CASANDRA','F',34,24352.979,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('CASANDRA','M',34,.767,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('ANUYA','F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES ('SATHISH','M',34,78.979,0,'1996-01-03');

--for selective coloumn use below--
SELECT EmpId from Employee_Record3;

--for all employee names
SELECT EmpName from Employee_Record3;

--for unique names use DISTINCT
SELECT DISTINCT EmpName from Employee_Record3;

--total number of records in a table
SELECT COUNT(*) from Employee_Record3;
--this will also result the number of records in a table
SELECT COUNT(1) from Employee_Record3;
--this will count the number of EmpName records in a table
SELECT COUNT(EmpName) from Employee_Record3;
--this will count the unique number of EmpName in a table
SELECT COUNT(DISTINCT EmpName) from Employee_Record3;

--**NOTE**--
-- COUNT will not count null as a value--
--but when you have multiple null in a column and when you count with distinct in that column all of the null values will be counted as 1--
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (null,'F',34,8000.979,0,'1996-01-03');
INSERT INTO Employee_Record3(EmpName,Gender,Age,Salary,IsRetired,JoiningDate) VALUES (null,'M',34,78.979,0,'1996-01-03');

SELECT * from Employee_Record3;

SELECT COUNT(*) from Employee_Record3;
SELECT COUNT(EmpName) from Employee_Record3;
SELECT DISTINCT EmpName from Employee_Record3;


-------------------Assignment 2------------------------
/*a. Create a table Customer with following columns

Customer ID, should be able to identify each customer, should be autoincrement, should be numerical
FirstName
LastName
Gender
age
isSubscribed (1 if subscribed and o if not)
CreditLimit (should be floating)
City name should accept hindi names
b. Insert at least 5 rows with different values for all fields.

c. Select all customers.

d. Display only FirstName, LastName and City.

e. Count how many customers are subscribed.

f. Get all distinct cities.

g. Count total number of customers*/

CREATE TABLE CustomerRecord2(CusID INT PRIMARY KEY IDENTITY(1,1),FirstName varchar(10), 
LastName varchar(10),Gender char(1), Age tinyint, isSubscribed bit, CreditLimit decimal(10,2), CityName nvarchar(100))

INSERT INTO CustomerRecord2(FirstName,LastName,Gender,Age,isSubscribed,CreditLimit,CityName) 
VALUES ('Anusha','Prakash','F',29,1,9000.897,N'வில்லெனுவே')
INSERT INTO CustomerRecord2(FirstName,LastName,Gender,Age,isSubscribed,CreditLimit,CityName) 
VALUES ('Ilaykya','Manikam','F',28,0,673,N'విల్లెన్యూవ్')
INSERT INTO CustomerRecord2(FirstName,LastName,Gender,Age,isSubscribed,CreditLimit,CityName) 
VALUES ('Bipin','Nataraj','M',26,1,90988.65,N'ہیلو وہاں، کیٹی!')
INSERT INTO CustomerRecord2(FirstName,LastName,Gender,Age,isSubscribed,CreditLimit,CityName) 
VALUES ('Govind','samuel','M',43,1,809000.897,N'ഹലോ')
INSERT INTO CustomerRecord2(FirstName,LastName,Gender,Age,isSubscribed,CreditLimit,CityName) 
VALUES ('Peter','Sharom','M',90,0,81.897,N'ಹೆಲ್ಲೋಕನ್ನ')

SELECT FirstName,LastName,CityName from CustomerRecord2;

SELECT COUNT(isSubscribed) from CustomerRecord2;

SELECT DISTINCT COUNT(CityName) from CustomerRecord2;






















