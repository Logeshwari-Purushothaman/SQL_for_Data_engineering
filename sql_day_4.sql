select * from SalesLT.Customer;

--filter employee whose middle name is empty/not assigned/null

--this wont return any output as null is not a value but its an empty record and hence use 'is'
SELECT * from SalesLT.Customer where MiddleName = NULL;

--this will return the empty record of particular record
SELECT * from SalesLT.Customer where MiddleName IS NULL;

SELECT * from SalesLT.Customer where MiddleName IS NOT NULL;

--employee count where their middle name is not null
SELECT COUNT(*) from SalesLT.Customer where MiddleName IS NOT NULL;

select * from SalesLT.SalesOrderHeader;

--how to get particular columns data only?
--Student with their admission status
--Use COALESCE(this will jump to coloumn 1 and if the value is true rest of the columns are ignored)

CREATE TABLE AdmissionStatus (
    StudentName VARCHAR(100),
    CollegeA VARCHAR(20),
    CollegeB VARCHAR(20),
    CollegeC VARCHAR(20)
);

INSERT INTO AdmissionStatus (StudentName, CollegeA, CollegeB, CollegeC) VALUES
('John Doe',     'Admitted', NULL,      NULL),
('Alice Smith',  NULL,       'Admitted', NULL),
('Bob Johnson',  NULL,       NULL,       'Admitted'),
('Eve Jackson',  'Admitted', NULL,       NULL),
('Charlie King', NULL,       'Admitted', NULL);


INSERT INTO AdmissionStatus (StudentName, CollegeA, CollegeB, CollegeC) VALUES
('Kalina', NULL,NULL, NULL);


SELECT * FROM AdmissionStatus;


select StudentName, COALESCE(CollegeA,CollegeB,CollegeC) as student_admission_status from AdmissionStatus ;

--now if there is all not null in a student record instead of printing not null, i can create a name

select StudentName, COALESCE(CollegeA,CollegeB,CollegeC,'Not Admitted') as student_admission_status from AdmissionStatus ;
--COALESCE use for multiple column scenario

--we can also use ifnull/isnull
--if the value is null we can assign a default value

select StudentName, Isnull(CollegeA,'Not Admitted') as student_admission_status_CollegeA from AdmissionStatus ;

 select * from SalesLT.Customer;


--in SQL null is considered the lowest value
--here all the null values comes on top because null is considered the lowest value
select * from SalesLT.Customer order by Suffix;

select * from SalesLT.Customer order by Suffix;


select * from SalesLT.Customer;
select * from SalesLT.CustomerAddress;
select * from SalesLT.Address;
select * from SalesLT.Product;
select * from SalesLT.ProductCategory;
select * from SalesLT.ProductDescription;
select * from SalesLT.ProductModel;
select * from SalesLT.ProductModelProductDescription;
select * from SalesLT.SalesOrderDetail;
select * from SalesLT.SalesOrderHeader;


select * from SalesLT.SalesOrderDetail;

--when we want all records from 2 tables without any duplicates use union
--union removes duplicates from 2 tables
select Name from SalesLT.ProductModel
union 
select Name from SalesLT.ProductCategory;


--when we want all records from first table and second table with duplicates use union all
select Name from SalesLT.ProductModel
union all
select Name from SalesLT.ProductCategory;


select * from SalesLT.CustomerAddress;
select * from SalesLT.Customer;

select * from dbo.Customers;
select * from dbo.Orders;

--when we want all records from first table and second table without duplicates use union
select City from dbo.Customers
Union
select ShipCity from dbo.Orders;

--when we want all records from first table and second table with duplicates use union all
select City from dbo.Customers
Union
select ShipCity from dbo.Orders;

--Intersect - provides records that exist in both tables/provides common records
select City from dbo.Customers
intersect
select ShipCity from dbo.Orders;


select * from dbo.Customers;
select * from dbo.Orders;

--except provides records that are available in the 1st table but not 2nd table
select ShipCity from dbo.Orders
except
select City from dbo.Customers;

--intersect,union,except removes duplicate values
--union all provided duplicate values

select * from dbo.Products;

--number of products in each category
select * from dbo.Orders;

--now how to find number of products in each category
-- now do grouping and then count them
--whenever your are using you should specify the column along with select
select CategoryID,Count(*) as number_items_in_each_category from dbo.Products group by CategoryID;
having ReorderLevel > 2

--product category items which has items are greater than 10
--apply filter after groupby execution 
--filter using having

select CategoryID,Count(*) as number_items_in_each_category from dbo.Products group by CategoryID
having count(*)>10;

--provide total sales reorder wise
select ReorderLevel,count(*) as reorderlevel_of_each_item from dbo.Products group by ReorderLevel
having ReorderLevel >0;

-----------------------------------------------------------------------------------
select * from SalesLT.SalesOrderDetail;

--total revenue generated based on each productID
select ProductID, sum(LineTotal) as total_revenue_based_on_product_id from SalesLT.SalesOrderDetail group by ProductID;

--avg revenue generated in each category
select ProductID, avg(LineTotal) as total_revenue_based_on_product_id 
from SalesLT.SalesOrderDetail group by ProductID;

--avg quantity sold in each product
select ProductID, avg(OrderQty) as avg_quantity_sold_based_on_product_id from SalesLT.SalesOrderDetail group by ProductID;


--top 1 selling product id based on the orderqty
select top 1 ProductID, sum(OrderQty) as total_quantity_sold_based_on_product_id from SalesLT.SalesOrderDetail group by ProductID
order by sum(OrderQty) desc



select * from SalesLT.Product;
--- yearly sales

--total sales based on year
select YEAR(OrderDate), sum(TotalDue) as total_sales_based_on_year from SalesLT.SalesOrderHeader group by YEAR(OrderDate);

select * from SalesLT.Product;
select count(*) from SalesLT.Product; --total records with * includes null values also
select count(Size) from SalesLT.Product; --without start with some group will exclude null values

--to return all tables names oa particular schema of a database(include tables,views)
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo';


----------------------------------------------------
--assignment
CREATE TABLE Sales (
  OrderID INT PRIMARY KEY,

  CustomerName VARCHAR(50),

  Product VARCHAR(50),

  Category VARCHAR(50),

  Quantity INT,

  PricePerUnit DECIMAL(10, 2),

  OrderDate DATE

);


INSERT INTO Sales (OrderID, CustomerName, Product, Category, Quantity, PricePerUnit, OrderDate) VALUES

(101, 'Alice', 'Laptop', 'Electronics', 1, 60000.00, '2024-05-01'),

(102, 'Bob', 'Smartphone', 'Electronics', 2, 20000.00, '2024-05-01'),

(103, 'Alice', 'Headphones', 'Accessories', 3, 3000.00, '2024-05-02'),

(104, 'Charlie', 'Laptop', 'Electronics', 1, 55000.00, '2024-05-02'),

(105, 'Bob', 'Laptop Bag', 'Accessories', 2, 1500.00, '2024-05-03'),

(106, 'Alice', 'Tablet', 'Electronics', 1, 25000.00, '2024-05-04'),

(107, 'Charlie', 'Smartphone', 'Electronics', 1, 21000.00, '2024-05-05'),

(108, 'Bob', 'Power Bank', 'Accessories', 1, 2000.00, '2024-05-05');

--Write a query to find the total quantity of products purchased by each customer.
select CustomerName, sum(Quantity) as total_quantity_of_products from dbo.Sales group by CustomerName;

select * from sales;

--Display the total sales amount (Quantity * PricePerUnit) per customer.
select CustomerName , sum(Quantity * PricePerUnit) as total_sales_amt_per_customer from dbo.Sales group by CustomerName;

--Find the average sales amount per product category.
select Product, avg(PricePerUnit) as avg_amt_per_category from dbo.Sales group by Product;

--Customers with Total Sales Greater Than ₹50,000
select CustomerName , sum(Quantity * PricePerUnit) as total_sales_amt_per_customer from dbo.Sales group by CustomerName
having sum(Quantity * PricePerUnit) > 50000;

--Most Frequently Ordered Product by Quantity
--Identify the product that has been sold the most in terms of total quantity.
select top 1 Product, sum(Quantity) as most_frequently_ordered_product from dbo.Sales group by Product
order by sum(Quantity) desc;

--Total Number of Orders per Product
--Show the count of orders for each product using count
select product, sum(Quantity) as count_of_orders_per_product from dbo.sales group by Product
order by count(quantity);

--Highest and Lowest Price Per Unit for Each Category
select Category, max(PricePerUnit) as highest_price_each_category, min(PricePerUnit) as lowest_price_each_category from dbo.sales group by Category;

--Find the highest and lowest price per unit within each product category.
select Product, max(PricePerUnit) as highest_price_each_product, min(PricePerUnit) as lowest_price_each_Product from dbo.sales group by Product;

--For each day, display the total sales amount.
select OrderDate as Date_Of_Order, sum(PricePerUnit) as total_sales_per_day from dbo.sales group by OrderDate;







