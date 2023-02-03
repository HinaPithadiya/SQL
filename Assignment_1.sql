--Product table--

create table products(
product_id int primary key identity(1,1) not null,
product_name varchar(200) not null,
supplier_id int,
category_id  int,
quantitiy_per_unit varchar(50) not null,
unit_price decimal(10,4) not null,
units_in_stock smallint not null,
units_in_order smallint not null,
recorder_level smallint not null,
discontinued bit not null
)

---insert record--

insert into products values('ABC',1,1,'24 - 12 oz bottles','18','39','0','10','1')
insert into products values('XYZ',2,1,'10 boxes x 20 bags','19','17','25','10','0')
insert into products values('OPQ',3,5,'12 - 550 ml bottles','21.3500','0','0','10','1')
insert into products values('AAA',3,6,'48 - 6 oz jars','18','39','0','10','1')
insert into products values('BBB',5,3,'36 boxes','28','39','90','10','0')
insert into products values('CCC',4,3,'10 boxes x 20 bags','40','17','25','10','1')
insert into products values('DDD',2,7,'40 - 100 g pkgs','28','19','25','10','1')
insert into products values('EEE',3,1,'24 - 250 ml bottles ','15','17','25','10','0')
insert into products values('FFF',1,3,'12 - 1 lb pkgs','19','13','25','10','1')
insert into products values('GGG',2,1,'2 kg box','10','17','25','10','0')


select* from products

--1. Write a query to get a Product list (id, name, unit price) where current products cost less than $20.select product_id, product_name, unit_pricefrom productswhere unit_price < 20order by unit_price asc   --or--						select product_id, product_name, unit_price						from products						where (((unit_price < 20) AND ((Discontinued)=0)))
						order by unit_price asc;
--2 Write a query to get Product list (id, name, unit price) where products cost between $15 and $25

select product_id, product_name, unit_pricefrom products
where unit_price between 15 and 25

	--or--

						select product_id, product_name, unit_price						from products						where ((unit_price >= 15) AND (unit_price <= 25))
						order by unit_price asc;

--3 Write a query to get Product list (name, unit price) of above average price.

select distinct  product_name, unit_price
from products
where unit_price > (select avg(unit_price) from products)
order by unit_price asc

--4 Write a query to get Product list (name, unit price) of ten most expensive products

select top 10 product_name as ten_most_expensive_product, unit_price 
from products
order by unit_price desc
						--or--
							select distinct product_name as ten_most_expensive_product, unit_price
							from products as a
							where 10 >= (select count(distinct unit_price)
											from products as b
											where b.unit_price >= a.unit_price)
							order by unit_price desc

--5 Write a query to count current and discontinued productsselect Count(product_name)as current_and_discontinued_products 
from Products
group by discontinued;

--6 Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order

select product_name,units_in_order , units_in_stock
from products
where (((discontinued)=0) AND ((units_in_stock)<units_in_order))
