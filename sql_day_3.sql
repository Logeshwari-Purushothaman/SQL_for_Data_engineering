
SELECT * from SalesLT.Customer;

--to only view top 3 records to avoid unneccessary overhead of the system
SELECT top(3) * from SalesLT.Customer;

--to arrange a data based on a particular column data eg. name/id/age (coloumn name)
-- use order by for ascending order or the older data
SELECT * from SalesLT.Customer order by ModifiedDate;

-- use order by with desc for descending order or the recent data
SELECT * from SalesLT.Customer order by ModifiedDate desc; 

--The most recent modified record from the database 
SELECT top(1) * from SalesLT.Customer order by ModifiedDate desc;

--Use where condition to implement a logic of displaying data with some condition
SELECT Distinct * from SalesLT.Customer where SalesPerson='adventure-works\jillian0';

--Display company name where the customers are females
SELECT CompanyName from SalesLT.Customer where Title='Ms.';


SELECT top(10) * from SalesLT.SalesOrderDetail;

--show the total price/total sales collection generated
-- use sum function
-- to name a column use as with the name for more neat data representation
SELECT sum(LineTotal) as 'Total Revenue' from SalesLT.SalesOrderDetail;

-- show data where the orderquantity is greater than 3 and order by highest quantity
SELECT * from SalesLT.SalesOrderDetail where OrderQty>3 order by OrderQty desc;

SELECT * from SalesLT.SalesOrderDetail where OrderQty>=3 order by OrderQty;

--you can use AND OR condition for multiple conditions
SELECT * from SalesLT.SalesOrderDetail where OrderQty>=1 and LineTotal>1000;

SELECT * from SalesLT.SalesOrderDetail where OrderQty >= 1 OR LineTotal > 1376.994;
 

SELECT sum(LineTotal) as Total_LineTotal_Amount from SalesLT.SalesOrderDetail;

SELECT * from SalesLT.SalesOrderHeader;

--avg quantity amt/sales/profit 
SELECT AVG(TaxAmt) as Average_Tax_Amt from SalesLT.SalesOrderHeader;

---sales orders with minimum tax amt price and find which record it is
--this can be done as separate query like below or with same query
select min(TaxAmt) as minimum_tax_amt from SalesLT.SalesOrderHeader;

select * from SalesLT.SalesOrderHeader where TaxAmt = 3.1163;

--how to extract year from a date record ?
--to exatract a particular we can use YEAR

--SellStartDate year 2005
select * from SalesLT.Product where YEAR(SellStartDate) = 2005;

--SellStartDate month 07 july
select * from SalesLT.Product where MONTH(SellStartDate) =07;

select * from SalesLT.Product where YEAR(SellStartDate) = 2005 and MONTH(SellStartDate) =07;

--to extract a period data
select * from SalesLT.Product where YEAR(SellStartDate) between 2005 and 2006;

--here both 700 and 750 are included in the output record
select * from SalesLT.Product where ProductID between 700 and 750;

--give me sales where  product category is between 18 to 25
select * from SalesLT.Product where ProductCategoryID between 18 and 25;

--to provide output for a multiple records use 'in'
--remember in is for the actual record value and like is for similar records
select * from SalesLT.Product where ProductCategoryID in (18,25,11) order by ProductCategoryID;

select * from SalesLT.Product;




--WILD CARD '%' and '_' ----------

--LIKE function--
-- if you want to return data with some patterns use like operator 
-- for eg 'S%H' - this will return data that start with letter S and ends with letter H and any data inbetween in accepted
-- '%' sign means anything and length of the character is not fixed
-- '_' use underscore to fix the length of the character

select * from SalesLT.Customer;

--this will return all records which has this pattern in the firstname
select * from SalesLT.Customer where FirstName like 'Jo';

--to avoid certain pattern we can specify the required patterns inside square bracket but it only assumes possibilities of single character
--if u give multiple characters it wont take that comnination but takes possibilities of that character that particular place
select * from SalesLT.Customer where FirstName like 'B[ry][ri]an'

--here the length of the character is fixed to print either brian or bryan
select * from SalesLT.Customer where FirstName like 'B__an'

--this will print all the records of firstname which start with b and ends with n with any length of characters between B and N
select * from SalesLT.Customer where FirstName like 'B%N';

--this will show all firstnames that starts with letter S
select * from SalesLT.Customer where FirstName like 'S%';

select * from SalesLT.Customer where FirstName like 'S[al]n%';

--this takes possibilities of 2nd place as (r or y or y or y )not as (ry or yy)
select * from SalesLT.Customer where FirstName like 'B[ry][yy]an'




---Assignment----
CREATE TABLE employees (emp_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),department VARCHAR(50),salary INT,joining_date DATE);

select * from employees;

INSERT INTO employees (emp_id, first_name, last_name, department, salary, joining_date)
VALUES (101, 'John', 'Doe', 'IT', 60000, '2018-05-21'),(102, 'Jane', 'Smith', 'HR', 50000, '2020-07-11'),(103, 'Michael', 'Brown', 'IT', 75000, '2016-03-03'),(104, 'Emily', 'Davis', 'Finance', 68000, '2019-10-01'),(105, 'Daniel', 'Johnson', 'IT', 56000, '2021-02-15'),(106, 'Sarah', 'Wilson', 'HR', 52000, '2017-11-25');


--Task3: Retrieve all employees from the IT department.
select * from employees where department = 'IT';

--Task 4: Find all employees whose first names start with 'J'.
select * from employees where first_name like ('J%');

--Task 5: Count the number of employees in the HR department.
select count(department) as HR_Department_employees from employees where department = 'HR';

--Task 6:  Get all employees whose salary is between 55000 and 70000.
select * from employees where salary between 55000 and 70000;

--Task 7: Retrieve the details of employees who are in the Finance or HR department.
select * from employees where department in ('HR','IT');

--Task 8: Retrieve all employees who joined after January 1, 2019.
select * from employees where YEAR(joining_date) > 2019 and MONTH(joining_date) > 01 and DAY(joining_date) > 01;

--Task. 9:Find employees whose last name ends with 'n'.
select * from employees where last_name like ('%n');

--Task 10: Display the first name and salary of employees with salaries not between 55000 and 70000.
select first_name from employees where salary not between  55000 and 70000;

--Task 11: Find all employees whose first name contains the letter 'a'
select * from employees where first_name like ('%a%');

--Task 12: Display all employees who joined between 2017 and 2020.
select * from employees where YEAR(joining_date) between 2017 and 2019;

select * from employees;










select * from employees;
























