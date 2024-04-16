create database HMBank;

create table Customers
(
 customer_id int primary key,
 first_name varchar(50),
 last_name varchar(50),
 DOB date,
 email varchar(40),
 phone_number bigint,
 address varchar(100)
);


create table Accounts
(
account_id int primary key,
customer_id int references Customers(customer_id),
account_type varchar(30),
balance int
);

create table Transactions
(
transaction_id int primary key,
account_id int references Accounts(account_id),
transaction_type varchar(30),
amount int,
transaction_date date
);

--Task-1
--1. Insert at least 10 sample records into each of the following tables.
-- Customers
-- Accounts
-- Transactions


INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) 
VALUES 
(1, 'John', 'Doe', '1990-01-15', 'john.doe@example.com', 1234567890, '123 Main St'),
(2, 'Jane', 'Smith', '1985-05-20', 'jane.smith@example.com', 9876543210, '456 Elm St'),
(3, 'Alice', 'Johnson', '1998-11-30', 'alice.johnson@example.com', 5555555555, '789 Oak St'),
(4, 'Bob', 'Brown', '1975-09-10', 'bob.brown@example.com', 3333333333, '101 Pine St'),
(5, 'Emma', 'Davis', '1988-03-25', 'emma.davis@example.com', 4444444444, '202 Maple St'),
(6, 'Michael', 'Wilson', '1995-07-12', 'michael.wilson@example.com', 6666666666, '303 Cedar St'),
(7, 'Sarah', 'Martinez', '1982-12-05', 'sarah.martinez@example.com', 7777777777, '404 Birch St'),
(8, 'Chris', 'Garcia', '1993-02-18', 'chris.garcia@example.com', 8888888888, '505 Oakwood St'),
(9, 'Laura', 'Rodriguez', '1970-06-08', 'laura.rodriguez@example.com', 9999999999, '606 Pinecrest St'),
(10, 'Kevin', 'Lopez', '1980-10-29', 'kevin.lopez@example.com', 2222222222, '707 Willow St');


INSERT INTO Accounts (account_id, customer_id, account_type, balance) 
VALUES 
(1, 1, 'Savings', 5000),
(2, 2, 'Checking', 2500),
(3, 3, 'Savings', 10000),
(4, 4, 'Checking', 7500),
(5, 5, 'Savings', 3000),
(6, 6, 'Checking', 6000),
(7, 7, 'Savings', 9000),
(8, 8, 'Checking', 4000),
(9, 9, 'Savings', 15000),
(10, 10, 'Checking', 2000);


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) 
VALUES 
(1, 1, 'Deposit', 1000, '2024-04-01'),
(2, 2, 'Withdrawal', 500, '2024-04-02'),
(3, 3, 'Deposit', 2000, '2024-04-03'),
(4, 4, 'Deposit', 1500, '2024-04-04'),
(5, 5, 'Withdrawal', 1000, '2024-04-05'),
(6, 6, 'Deposit', 3000, '2024-04-06'),
(7, 7, 'Withdrawal', 2000, '2024-04-07'),
(8, 8, 'Deposit', 500, '2024-04-08'),
(9, 9, 'Withdrawal', 3000, '2024-04-09'),
(10, 10, 'Deposit', 1000, '2024-04-10');


--1) Write a SQL query to retrieve the name, account type and email of all customers.
select c.first_name,c.last_name,a.account_type,c.email
from Customers c
inner join Accounts a
on c.customer_id=a.customer_id;

--2) Write a SQL query to list all transaction corresponding customer.
select c.customer_id, c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from customers c
join accounts a on c.customer_id = a.customer_id
join transactions t on a.account_id = t.account_id
order by c.customer_id, t.transaction_date;

--3) Write a SQL query to increase the balance of a specific account by a certain amount.

update accounts
set balance = balance + 1000
where account_id = 1;

--4)Write a SQL query to Combine first and last names of customers as a full_name.

select c.first_name,c.last_name,concat(c.first_name,' ',c.last_name)
from Customers c;

--5) Write a SQL query to remove accounts with a balance of zero where the account type is savings.

delete from Transactions where account_id in
(select account_id from Accounts where balance=0 and account_type='savings');
delete from Accounts where balance=0 and account_type='savings';

--6) Write a SQL query to Find customers living in a specific city.
select * from Customers where address like '%Birch%';
select * from Customers;

--7) Write a SQL query to Get the account balance for a specific account.

select balance from Accounts where account_id=1;

--8) Write a SQL query to List all current accounts with a balance greater than $1,000.

select * from Accounts;

select * from Accounts where account_type='Current' and balance>1000;

--9) Write a SQL query to Retrieve all transactions for a specific account.
select * from Transactions where account_id=1;

--10) Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
select
    a.account_id,
    a.balance as initial_balance,
    0.05 as interest_rate,
    CAST(a.balance as decimal)*0.05 as interest_accrued
from accounts a
where a.account_type = 'savings';

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.

select * from Accounts where balance<8000;

--12 Write a SQL query to Find customers not living in a specific city.

select * from Customers where address not like '%Birch%';


--Task-3

--1 Write a SQL query to Find the average account balance for all customers.

select avg(balance) from Accounts;

--2) Write a SQL query to Retrieve the top 10 highest account balances.
select * from Accounts order by balance desc
offset 0 row
fetch first 10 rows only;

--3) Write a SQL query to Calculate Total Deposits for All Customers in specific date.

select c.first_name,c.last_name, sum(t.amount) as total_deposit_amount  from Customers c
inner join Accounts a
on c.customer_id=a.customer_id
inner join Transactions t
on t.account_id=a.account_id
where t.transaction_type='deposit'
group by c.first_name,c.last_name;

select * from Customers;

--4) Write a SQL query to Find the Oldest and Newest Customers.

select first_name,last_name,DOB
from customers where DOB = (select min(DOB) from customers)or DOB = (select max(DOB) from customers)
order by DOB;

--5) Write a SQL query to Retrieve transaction details along with the account type.

select t.transaction_id,t.transaction_type,t.amount,t.transaction_date, a.account_type from Transactions t
inner join Accounts a
on t.account_id=a.account_id;

--6) Write a SQL query to Get a list of customers along with their account details.
select * from Accounts;
select * from Transactions;
select c.first_name,c.last_name,a.account_id,a.account_type,a.balance
from Customers c
left join Accounts a
on c.customer_id=a.customer_id;

--7) Write a SQL query to Retrieve transaction details along with customer information for a specific account.
select c.first_name,c.last_name,t.transaction_id,t.transaction_type,t.amount,t.transaction_date
from Transactions t
inner join Accounts a
on t.account_id=a.account_id
inner join Customers c
on c.customer_id=a.customer_id;

--8) Write a SQL query to Identify customers who have more than one account.
select c.first_name,c.last_name from 
Customers c inner join 
Accounts a
on c.customer_id=a.customer_id
group by c.customer_id,c.first_name,c.last_name
having count(a.account_id)>1;

--9)Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

select (select sum(amount) from transactions where transaction_type = 'Deposit') -
    (select sum(amount) from transactions where transaction_type = 'Withdrawal') as difference;

--10) Write a SQL query to Calculate the average daily balance for each account over a specified period.

--select avg(balance) from Accounts where 

--11) Calculate the total balance for each account type.
select * from Accounts;
select * from Transactions;

select account_type, sum(balance) as Total_balance from Accounts group by account_type;

--12) Identify accounts with the highest number of transactions order by descending order.

select account_id , count(transaction_id) as Total_transaction from Transactions group by account_id order by Total_transaction desc;

--13) List customers with high aggregate account balances, along with their account types.
select top 1 max(balance) as highest_balance, account_type from accounts group by account_type
order by highest_balance desc;

--14) Identify and list duplicate transactions based on transaction amount, date, and account.

select * from Transactions where amount=1000 and transaction_date='2024-04-01' and account_id=1;

--Task-4

--1) Retrieve the customer(s) with the highest account balance.

select * from Customers c where customer_id=(select customer_id from Accounts where balance=(select max(balance) from Accounts));

select * from Accounts;
select max(balance) from Accounts;

--2) Calculate the average account balance for customers who have more than one account.

select a.customer_id, avg(balance) as average_of_more_than_one_account_holders from Accounts a where a.customer_id
in (select customer_id from Accounts group by customer_id having count(account_id)>1)
group by a.customer_id;

--3) Retrieve accounts with transactions whose amounts exceed the average transaction amount.

select a.account_id,a.balance from Accounts a where a.balance >
(select avg(amount) from Transactions);

select * from Transactions;

--4) Identify customers who have no recorded transactions.

select c.customer_id, c.first_name, c.last_name
from customers c
where not exists (
    select 1
    from accounts a
    where a.customer_id = c.customer_id
);

--5) calculate the total balance of accounts with no recorded transactions.
sql
Copy code
select sum(balance) as total_balance
from accounts
where customer_id in (
    select customer_id
    from accounts
    group by customer_id
    having count(account_id) = 0
);

--6 retrieve transactions for accounts with the lowest balance.

select *
from transactions
where account_id in (
    select account_id
    from accounts
    where balance = (
        select min(balance)
        from accounts
    )
);
--7) identify customers who have accounts of multiple types.
select customer_id
from accounts
group by customer_id
having count(distinct account_type) > 1;

--8) calculate the percentage of each account type out of the total number of accounts.

select account_type, count(account_id) * 100.0 / (
    select count(account_id)
    from accounts
) as percentage
from accounts
group by account_type;
--9) retrieve all transactions for a customer with a given customer_id.

select *
from transactions
where account_id in (
    select account_id
    from accounts
    where customer_id = <customer_id>
);

--10) calculate the total balance for each account type, including a subquery within the select clause.

select account_type,
       (select sum(balance) from accounts where account_type = a.account_type) as total_balance
from accounts a
group by account_type;


