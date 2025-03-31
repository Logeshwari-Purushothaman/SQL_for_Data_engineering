--to create a database
CREATE DATABASE sql_for_data_engineering;

--incase of multiple databases this command chooses which database to use
USE sql_database_development;

USE sql_for_data_engineering;

--to create a table inside a database without a schema mentioned 
CREATE TABLE Products(ProductName Char(100), Price int, Category Char(100));

CREATE TABLE Products(ProductName Char(100), Price int, Category Char(100));

--to see what the table contains
SELECT * from Products;

--to insert rows/values into the products table
INSERT INTO Products(ProductName, Price, Category) VALUES('Iphone16',$122, 'SmartPhone');

DELETE TABLE Employee;

--to segregate tables we can use schema - dbo is default schema, tables created without schema goes under this schema
CREATE Schema HR;

CREATE TABLE HR.Employee(EmpName Char(100), Dob date, Designation Char(100));

--Create a database named StudentD
CREATE DATABASE StudentID;

USE StudentID;

--Create a schema named college
CREATE Schema College;

--Under this schema, create a table Students with the following columns:
--StudentID (INT), FullName (CHAR(100)), Age (INT),Department (CHAR(50)),EnrollmentDate (DATE)

CREATE TABLE College.Students(Studentid int, FullName char(100), Age int, Department char(100), Enrollmentdate date);

--Insert 3 records into the Students tabl
INSERT INTO College.Students(Studentid,FullName,Age,Department,Enrollmentdate) VALUES(01,'ANUSHA',18,'CloudComputing','2024-01-01');
INSERT INTO College.Students(Studentid,FullName,Age,Department,Enrollmentdate) VALUES(02,'AKALYA',17,'BigData','2024-01-10');
INSERT INTO College.Students(Studentid,FullName,Age,Department,Enrollmentdate) VALUES(02,'AMITHA',18,'Programming','2024-01-08');

--Write a SELECT statement to Display all columns from the table

SELECT * FROM College.Students;



