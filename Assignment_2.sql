-- Create table Salesman

Create table Salesman(
salesman_id int primary key identity(101,1) not null,
s_name varchar(100) not null,
city varchar(50) not null,
commission decimal(3,2) not null
)

-- Create Table Customer

Create table Customer(
cust_id int primary key identity(101,1) not null,
c_name varchar(100) not null,
city varchar(100),
grade int,
salesman_id int 
)

--Create Table Order_

Create table Order_(
ord_id int primary key identity(101,1) not null,
purch_amt decimal(10,2) not null,
ord_date date not null,
cust_id int,
salesman_id int
)

--insert data in salesman table

insert into Salesman values('Ram Patel','Ahmedabad','0.78'),
						   ('Shreya Shah','Surat','0.12'),
						   ('Jay Gohil','Anand','0.10'),
						   ('Anand Ravat','Gandhinagar','0.50'),
						   ('Shrusti Deshmukh','Noyda','0.20'),
						   ('Anu Patel','Kalol','0.15'),
						   ('Mansi Acharya','Bhavnagar','0.30'),
						   ('Vyana jain', 'Rajkot','0.40'),
						   ('Sahil Pithadiya','Rajkot','0.05'),
						   ('Hiya Rajput','Surendranagar','0.10'),
						   ('Jaini Gohel','Ahmedanad','0.20'),
						   ('Juhi Patel','Surat','0.25'),
						   ('Jiyansh Shah','Ahmedabad','0.70'),
						   ('Janvi Patel','Jamnagar','0.11'),
						   ('Binal Gohel','Gandhinagr','0.35'),
						   ('Hardik Patel','Kalol','0.50')

select * from Salesman

--insert data in customer table

insert into Customer values('Raagi Shah','Jamnagar',100,103),
						   ('Hina Pithadiya','Ahmedabad',300,101),
						   ('Priyal Vaghela','Anand',200,102),
							('Siya Shah','Rajkot',null,105),
							('Jiya Jain','Gandhigar',160,110),
							('Vatsal Unkani','Bhavanagar',700,104),
							('Janvi Patel','Rajkot',null,106),
							('Jaini Shah','Rajkot',300,109),
							('Shrusti Deshmukh','Noyda',130,108),
							('Hetvi Patel','Gandhinagar',190,116),
							('Hely Shah','Kalol',190,115),
							('Priyansh Patel','Jamnagar',180,114),
							('Manveer Patel','Rajkot',180,113),
							('Hiyasha Patel','Jamnagar',180,112),
							('Hiyasha Jain','Jamnagar',100,111)
	
select * from Customer

-- insert data in order table

insert into Order_ values(400,'2021-09-23',101,101),
						 (1500,'2020-07-17',103,102),
						 (1000,'2022-06-16',102,103),
						 (150.5,'2012-10-05',101 ,102),
						(100.5, '2017-09-30',103 ,116),
						(2100, '2019-08-11',109 ,115),
						(78, '2022-09-10',107 ,114),
						(2000, '2023-01-10',110 ,111),
						(700, '2021-09-10',108 ,112),
						(568, '2009-09-10',111 ,104),
						(990, '2010-09-10',106 ,113),
						(289, '2019-09-10',112 ,105),
						(350, '2020-09-10',105 ,110),
						(2100, '2000-09-10',113 ,109),
						(2300, '2015-09-10',103 ,106),
						(230, '2017-09-10',114 ,107),
						(210, '2015-09-10',103 ,108),
						(200, '2014-09-10',115 ,102)

select * from Order_

-- 1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city


	 select s_name as Salesman,c_name as Customer_name,Customer.city
	 from Salesman, Customer
	 where Salesman.city=Customer.city


--2. write a SQL query to find those orders where the order amount exists between 500 and 2000.	    --Return ord_no, purch_amt, cust_name, city
	select o.ord_id as order_no,o.purch_amt,c.c_name as Customer_name,c.city
	from Order_ o 
	inner join Customer c on c.cust_id=o.ord_id
	where o.purch_amt between 500 and 2000


-- 3. write a SQL query to find the salesperson(s) and the customer(s) he represents. 
		--Return Customer Name, city, Salesman, commission

	select c.c_name as Customer_name,c.city,s.s_name as Salesman,s.commission
	from Customer c 
	inner join Salesman s on s.salesman_id=c.salesman_id


-- 4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
	   --Return Customer Name, customer city, Salesman, commission.

	select c.c_name as customer_name, c.city,s.s_name as salesman,s.commission
	from Customer c 
	inner join Salesman s on s.salesman_id=c.salesman_id
	where s.commission > 0.12


--5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and 		--have received a commission of more than 12% from the  company. Return Customer Name, customer city, Salesman, 		--salesman city, commission
	select c.c_name as customer_name, c.city,s.s_name as salesman, s.city, s.commission
	from Customer c
	inner join Salesman s on s.salesman_id = c.salesman_id
	where s.commission >.12 and c.city <> s.city

--6.  write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, 
		--commission

	select o.ord_id as order_no, o.ord_date, o.purch_amt,c.c_name as customer_name,c.grade,s.s_name as salesman,s.commission
	from Order_ o
	inner join Customer c on o.cust_id=c.cust_id
	inner join Salesman s on o.salesman_id= s.salesman_id


--7.  Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears 		--once and only the relational rows are returned.
	select * 
	from Order_ o
	full outer join Customer c on o.cust_id=c.cust_id
	full outer join Salesman s on o.salesman_id=s.salesman_id


--8.  write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 		--The results should be sorted by ascending customer_id.
	select c.c_name as customer_name,c.city,c.grade,s.s_name as salesman
	from Customer c
	inner join Salesman s on s.salesman_id=c.cust_id 
	order by c.cust_id asc


--9  write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman,		--salesman city. The result should be ordered by ascending customer_id.
	select c.c_name as customer_name,c.city,c.grade,s.s_name as salesman,s.city
	from Customer c 
	left outer join Salesman s on s.salesman_id=c.salesman_id
	where c.grade<300
	order by c.cust_id asc

--10   Write a SQL statement to make a report with customer name, city, order number, order date, and order amount 		--in ascending order according to the order date to determine whether any of the existing customers have placed an 		--order or not	select c.c_name,c.city,o.ord_id,o.ord_date,o.purch_amt	from Customer c 	left outer join Order_ o on c.cust_id=o.cust_id	order by o.ord_date asc
--11 Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, 		--salesperson name, and commission to determine if any of the existing customers have not placed orders or if they		--have placed orders through their salesman or by themselves	select c.c_name,c.city,o.ord_id as order_number,o.ord_date,o.purch_amt as order_amount,s.s_name as salesperson_name,s.commission	from Customer c	left outer join Order_ o on c.cust_id=o.cust_id	left outer join Salesman s on s.salesman_id=o.salesman_id

--12.  Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers 		--or have not yet joined any of the customers	select c.c_name,c.city,c.grade,s.s_name,s.city	from Customer c	right outer join Salesman s on s.salesman_id = c.salesman_id	order by s.salesman_id;
--13. write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.	select c.c_name,c.city,c.grade,o.ord_id,o.ord_date,o.purch_amt	from Customer c	right outer join Salesman s on s.salesman_id=c.salesman_id	right outer join Order_ o on c.cust_id=o.cust_id--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any 		--of the customers. The customer may have placed, either one or more orders on or above order amount 2000  and must 		--have a grade, or he may not have placed any order to the associated supplier.	select c.c_name,c.city,c.grade,s.s_name,o.ord_id,o.ord_date,o.purch_amt 	from Customer c	right outer join Salesman s on s.salesman_id=c.salesman_id	left outer join Order_ o on o.cust_id =c.cust_id	where o.purch_amt>=2000	and c.grade is not null;--15. Write a SQL statement to generate a list of all the salesmen who either work for one
		--or more customers or have yet to join any of them. The customer may have placed
		--one or more orders at or above order amount 2000, and must have a grade, or he
		--may not have placed any orders to the associated supplier					.	select c.c_name,c.city,c.grade,s.s_name,o.ord_id,o.ord_date,o.purch_amt 	from Customer c	right outer join Salesman s on s.salesman_id=c.salesman_id	left outer join Order_ o on o.cust_id =c.cust_id	where o.purch_amt>=2000	and c.grade is not null;--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only 
	  --those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by 	  --the customer who neither is on the list nor has a grade.	  select c.c_name,c.city,o.ord_id,o.ord_date,o.purch_amt	  from Customer c	  full outer join Order_ o on c.cust_id=o.cust_id	  where c.grade is not null;--17. Write a SQL query to combine each row of the salesman table with each row of the customer table	
	  select *
	  from Customer
	  cross join Salesman
--18. Write a SQL statement to create a Cartesian product between salesperson and
		--customer, i.e. each salesperson will appear for all customers and vice versa for that
		--alesperson who belongs to that city

	select * 
	from Salesman s
	cross join Customer c
	where s.city is not null

--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear
		--for every customer and vice versa for those salesmen who belong to a city and customers who require a grade	select * 
	from Salesman s
	cross join Customer c
	where s.city is not null
	and c.grade is not null--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all 
		--customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the
		--customers should have their own grade    select * 	from Salesman s	cross join Customer c	where s.city is not null	and c.grade is not null	and s.city<>c.city
select  top 1* from Salesman
select  top 1* from Customer
select TOP 1* from Order_