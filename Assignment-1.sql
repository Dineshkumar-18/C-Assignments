--Task-1

create table Customers
(
	CustomerID int primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Email varchar(40) unique not null,
	Phone bigint not null,
	Address varchar(100) not null
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 1234567890, '123 Main St'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210, '456 Elm St'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 5555555555, '789 Oak St'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 2222222222, '101 Pine St'),
(5, 'Mary', 'Davis', 'mary.davis@example.com', 3333333333, '202 Maple St'),
(6, 'Tom', 'Wilson', 'tom.wilson@example.com', 4444444444, '303 Cedar St'),
(7, 'Sarah', 'Anderson', 'sarah.anderson@example.com', 6666666666, '404 Oak St'),
(8, 'Chris', 'Roberts', 'chris.roberts@example.com', 7777777777, '505 Elm St'),
(9, 'Laura', 'Garcia', 'laura.garcia@example.com', 8888888888, '606 Pine St'),
(10, 'Alex', 'Martinez', 'alex.martinez@example.com', 9999999999, '707 Maple St'),
(11, 'Jessica', 'Lee', 'jessica.lee@example.com', 1111111111, '808 Cedar St'),
(12, 'Michael', 'Lopez', 'michael.lopez@example.com', 5555555555, '909 Oak St'),
(13, 'David', 'Hernandez', 'david.hernandez@example.com', 6666666666, '010 Elm St'),
(14, 'Jennifer', 'Young', 'jennifer.young@example.com', 7777777777, '111 Pine St'),
(15, 'Amanda', 'King', 'amanda.king@example.com', 8888888888, '212 Maple St');

create table Products
(
ProductID int primary key,
ProductName varchar(30) not null,
Description varchar(100),
Price int not null
);
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(101, 'Smartphone', 'A high-quality smartphone with advanced features.', 5000),
(102, 'Laptop', 'A powerful laptop for work and entertainment.', 10000),
(103, 'Tablet', 'A lightweight and portable tablet for on-the-go use.', 3000),
(104, 'Headphones', 'Comfortable headphones with great sound quality.', 500),
(105, 'Smartwatch', 'A smartwatch that tracks fitness and provides notifications.', 2000),
(106, 'Camera', 'A digital camera with high-resolution images and video recording.', 4000),
(107, 'Printer', 'A printer that produces high-quality prints.', 15000),
(108, 'External Hard Drive', 'An external hard drive for extra storage.', 1200),
(109, 'Wireless Router', 'A wireless router for fast and reliable internet connections.', 8000),
(110, 'Gaming Console', 'A gaming console for immersive gaming experiences.', 3000),
(111, 'Desktop Computer', 'A desktop computer with powerful performance.', 7000),
(112, 'Monitor', 'A high-resolution monitor for clear visuals.', 2000),
(113, 'Keyboard', 'A durable keyboard for comfortable typing.', 500),
(114, 'Mouse', 'An ergonomic mouse for precise cursor control.', 2000),
(115, 'Speaker System', 'A speaker system for rich and immersive audio.', 1000);



create table Category
(
 Category_id int primary key,
 Category_name varchar(20)
);

insert into Category values(401,'Electronics'),(402,'Furniture'),(403,'Clothing'),(404,'Books');

alter table Products add Category_id int;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Category
FOREIGN KEY (Category_id) REFERENCES Category(Category_id);

create table Orders
(
OrderID int primary key,
CustomerID int references Customers(CustomerID),
OrderDate date,
TotalAmount int,
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES
(201, 1, '2024-04-01', 30, 'ordered'),
(202, 1, '2024-04-02', 20, 'shipped'),
(203, 2, '2024-04-03', 15, 'pending'),
(204, 4, '2024-04-04', 25, 'ordered'),
(205, 5, '2024-04-05', 50, 'shipped'),
(206, 6, '2024-04-06', 30, 'pending'),
(207, 7, '2024-04-07', 40, 'ordered'),
(208, 8, '2024-04-08', 35, 'shipped'),
(209, 3, '2024-04-09', 60, 'pending'),
(210, 10, '2024-04-10', 45, 'ordered'),
(211, 11, '2024-04-11', 70, 'shipped'),
(212, 12, '2024-04-12', 55, 'pending'),
(213, 13, '2024-04-13', 80, 'ordered'),
(214, 14, '2024-04-14', 65, 'shipped'),
(215, 14, '2024-04-15', 90, 'pending');

create table OrderDetails
(
OrderDetailID int primary key,
OrderID int references Orders(OrderID),
ProductID int references Products(ProductID),
Quantity int
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(501, 201, 101, 2),
(502, 201, 102, 1),
(503, 202, 103, 2),
(504, 204, 104, 1),
(505, 205, 105, 5),
(506, 206, 103, 1),
(507, 207, 107, 4),
(508, 208, 106, 1),
(509, 209, 109, 3),
(510, 210, 109, 2),
(511, 211, 110, 3),
(512, 212, 112, 4),
(513, 213, 113, 5),
(514, 214, 114, 2),
(515, 215, 115, 3);

create table Inventory
(
InventoryID int primary key,
ProductID int references Products(ProductID),
QuantityStock int,
LastStockUpdate date
);

INSERT INTO Inventory (InventoryID, ProductID, QuantityStock, LastStockUpdate)
VALUES
(601, 101, 10, '2024-04-01'),
(602, 102, 5, '2024-04-01'),
(603, 103, 8, '2024-04-01'),
(604, 104, 12, '2024-04-01'),
(605, 105, 15, '2024-04-01'),
(606, 106, 20, '2024-04-01'),
(607, 107, 25, '2024-04-01'),
(608, 108, 30, '2024-04-01'),
(609, 109, 35, '2024-04-01'),
(610, 110, 40, '2024-04-01'),
(611, 111, 45, '2024-04-01'),
(612, 112, 50, '2024-04-01'),
(613, 113, 50, '2024-04-01'),
(614, 114, 50, '2024-04-01'),
(615, 115, 50, '2024-04-01');

--Task-2

--1) Write an SQL query to retrieve the names and emails of all customers. 

select FirstName,LastName, Email from Customers;

-- 2) Write an SQL query to list all orders with their order dates and corresponding customer 
--names.

select o.OrderID,o.OrderDate, c.FirstName,c.LastName
from Orders o
inner join Customers c
on o.CustomerID=c.CustomerID;

--3) Write an SQL query to insert a new customer record into the "Customers" table. Include 
--customer information such as name, email, and address.

insert into Customers values(17,'mathan','kumar','mathan@gmail.com','107,neduncheliyan str, sivagiri');

--4) Write an SQL query to update the prices of all electronic gadgets in the "Products" table by 
--increasing them by 10%.

select * from Products;
update Products set Price=(price+price*0.1) ;

--5)  Write an SQL query to delete a specific order and its associated order details from the 
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

declare @inputOrderID int;
set @inputOrderID=4;
delete from OrderDetails where OrderID 
in (select OrderID from Orders where OrderID=@inputOrderID);

delete from Orders where OrderID=@inputOrderID;

--6) Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
--order date, and any other necessary information

select * from Orders;
insert into Orders values(4,4,'2024-02-02',6000);

--7) . Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact 
--information.

declare @inputEmail varchar(40);
declare @inputPhone bigint;
declare @inputAddress varchar(100);
declare @inputCustomerID int;
set @inputEmail='dinesh2@gmail.com';
set @inputPhone=7373783871;
set @inputAddress='107, Nedu. Sivagiri';
set @inputCustomerID=5;

update Customers set email=@inputEmail,Phone=@inputPhone,
Address=@inputAddress where CustomerID=@inputCustomerID;

--8) Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--table based on the prices and quantities in the "OrderDetails" table.

update Orders set TotalAmount=
(select sum(od.Quantity * p.Price)
from OrderDetails od
inner join Products p
on od.ProductID=p.ProductID
)
where exists (select 1 from OrderDetails od
where od.OrderID=Orders.OrderID);

select * from Orders;

--9) Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
--as a parameter.
declare @inputID int;
set @inputID=6;

delete from OrderDetails where OrderID in
(select OrderID from Orders where CustomerID=@inputID);

delete from Orders where CustomerID=@inputID;

--10) Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details

insert into Products values(17,'Grinder','super fast machine',5000);


--11) Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

Alter table Orders add Status varchar(20);

select * from Orders;
declare @inputStatus varchar(20);
declare @inputOrder_id int;
set @inputStatus='Shipped';
set @inputOrder_id=201;

update Orders set Status=@inputStatus where OrderID=@inputOrder_id;

--12) Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table.

select c.CustomerID, count(o.OrderID) as total_orders
from Customers c
left join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID;

--Task-3

--1) Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order.

select Orders.OrderID, Customers.FirstName,Customers.LastName
from Orders
inner join Customers
on Orders.CustomerID=Customers.CustomerID;

--2) Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue

select p.ProductID,p.ProductName, sum(od.Quantity* p.Price) as Total_Revenue
from Products p
inner join OrderDetails od
on p.ProductID=od.ProductID
group by p.ProductID,p.ProductName;
--3) Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.

select c.FirstName,c.LastName,c.Email,c.Phone,c.Address, count(o.OrderID) as Total_orders_placed
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName,c.Email,c.Phone,c.Address
having count(o.OrderID)>0;

--4) Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered

select top 1 p.ProductName, od.Quantity
from Products p
inner join OrderDetails od
on p.ProductID=od.ProductID
order by od.Quantity desc;

--5) Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--categories.

select p.ProductName,c.Category_name
from Products p
left join Category c
on p.Category_id=c.Category_id;


--6) Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.

select  c.FirstName,c.LastName, avg(o.TotalAmount) as Average_order_value
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName;

--7) Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.

select top 1 o.OrderID,c.FirstName,c.LastName, sum(p.Price*od.Quantity) as Total_Revenue
from Orders o
inner join Customers c
on c.CustomerID=o.CustomerID
inner join OrderDetails od
on od.OrderID=o.OrderID
inner join Products p
on p.ProductID=od.ProductID
group by o.OrderID,c.FirstName,c.LastName
order by sum(p.Price*od.Quantity);

--8)  Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.

select p.ProductName, count(od.OrderID) as Total_order
from Products p 
inner join OrderDetails od
on p.ProductID=od.ProductID
group by p.ProductID,p.ProductName;

--9) Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(20);
SET @ProductName = 'SmartPhone';
SELECT c.CustomerID,c.FirstName,c.LastName,c.Email,c.Phone,c.Address
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;

--10) Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
declare @inputStartDate date;
set @inputStartDate='2023-04-01';
declare @inputEndDate date;
set @inputEndDate='2024-07-01';
select sum(TotalAmount) as TotalRevenue
from orders where OrderDate between @inputStartDate
and @inputEndDate;

--Task -4

--1) Write an SQL query to find out which customers have not placed any orders.

select c.customerID, c.FirstName,c.Lastname from Customers c
where c.CustomerID not in (select o.CustomerID
from Orders o);
select * from Orders;

--2) Write an SQL query to find the total number of products available for sale.

select count(ProductID) as Total_products from Products
where ProductID in (select ProductID from OrderDetails group by ProductID);

--3) Write an SQL query to calculate the total revenue generated by TechShop.

select sum(od.Quantity* p.Price) as Total_Revenue
from Products p
inner join OrderDetails od
on p.ProductID=od.ProductID;
--inner join Orders o
--on od.OrderID=o.OrderID;
select sum(TotalAmount) as Total_revenue from Orders;
select * from Orders;
select * from OrderDetails;

--4) Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
declare @inputCatogoryName varchar(20);
set @inputCatogoryName='Electronics';
select avg(quantity) from OrderDetails where ProductID
in (select p.ProductID from Products p
inner join Category c
on p.Category_id=c.Category_id
where c.Category_name=@inputCatogoryName);

--5) Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.


declare @cusid int;
set @cusid=1;
select sum(od.Quantity* p.Price) as Total_revenue_by_cusid1
from OrderDetails od 
inner join Products p
on od.ProductID=p.ProductID
where od.OrderID in
(select o.OrderID from Orders o
inner join Customers c
on o.CustomerID=c.CustomerID
where c.CustomerID=@cusid);

select * from OrderDetails;
select * from Orders;
select * from Products;

--6) Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.

select c.FirstName,c.LastName,count(o.OrderID) as TotalOrders
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName
order by count(o.OrderID) desc
offset 0 row
fetch first 1 row only;

--7) Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

select c.Category_name,count(p.ProductID) from Category c
inner join Products p
on c.Category_id=p.Category_id
where p.ProductID in
(select p.ProductID from Products
inner join OrderDetails od 
on p.ProductID=od.ProductID)
group by c.Category_name
order by count(p.ProductID) desc;

--8) Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.
SELECT TOP 1
    p.Category_id AS MostPopularCategory,
    SUM(od.Quantity) AS TotalQuantityOrdered
FROM
    OrderDetails od
JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY
    p.Category_id
ORDER BY
    sum(od.Quantity) DESC;

--9) Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.

select  c.FirstName,c.LastName, avg(o.TotalAmount) as Average_order_value
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName;

--10) Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.
select c.FirstName,c.LastName,count(od.OrderID) as total_order
from OrderDetails od 
inner join Orders o
on od.OrderID=o.OrderID
inner join Customers c
on o.CustomerID=c.CustomerID
group by c.CustomerID,c.FirstName,c.LastName;


select c.FirstName, c.LastName, o.OrderCount
from Customers c
left join (SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders group by CustomerID) o on c.CustomerID = o.CustomerID
order by OrderCount desc;






































