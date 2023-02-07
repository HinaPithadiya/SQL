

--create table Department

Create table Department(
dept_id int primary key identity(101,1),
dept_name varchar(50) not null
)

--create table Employee

Create table Employee(
emp_id int primary key identity(1001,1),
dept_id int,
mngr_id int,
emp_name varchar(100) not null,
salary decimal(10,2) not null
)

--insert data into Department Table

insert into Department values('HR'),('QA'),('Frontend'),('Backend'),('R & D')

select * from Department

--insert data into employee Table

insert into Employee values(101,10001,'Henil Shah',30000),
						   (104,10004,'Jaimi Shah',50000),
						   (103,10004,'Sahil Pithadiya',70000),
						   (102,10005,'Janvi Patel',80000),
						   (104,10002,'Hely Patel',50000),
						   (104,10004,'Shrusti Deshmukh',100000),
						   (102,10002,'Jiyansh Patel',90000)

select * from Employee


--1. write a SQL query to find Employees who have the biggest salary in their Department


select d.dept_name, e.emp_name,salary
from Department d 
join Employee e on e.dept_id=d.dept_id
where salary in(
			select Max(salary)
			from Employee
			group by dept_id
)


--2. write a SQL query to find Departments that have less than 3 people in itselect d.dept_name,count(e.dept_id) as Less_Than_Three_Peoplefrom Department d left join Employee e on e.dept_id=d.dept_idGroup by e.dept_id,d.dept_namehaving count(e.dept_id)<3order by Less_Than_Three_People--3.  write a SQL query to find All Department along with the number of people thereSELECT d.dept_name, count(e.dept_id) as total_number_of_people
FROM Department d left join Employee e on e.dept_id=d.dept_id
GROUP BY e.dept_id,d.dept_nameorder by total_number_of_people --4.  write a SQL query to find All Department along with the total salary there
SELECT d.dept_name, SUM(e.salary) as Total_Salary
FROM  Department d left join Employee e on e.dept_id=d.dept_id
GROUP BY d.dept_name
order by Total_Salary


