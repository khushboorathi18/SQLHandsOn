Create database Assignmentdb
use Assignmentdb

create table salesman(
SALESMAN_ID numeric(5) primary key,
NAME  varchar(30),
CITY  varchar(15),
COMMISSION decimal(5,2)
)
create table customer(
CUSTOMER_ID numeric(5) primary key,
CUST_NAME  varchar(30),
CITY  varchar(15),
GRADE NUMERIC(3),
SALESMAN_ID numeric(5) 
)
create table orders(
ORD_NO numeric(5) primary key,
PURCH_AMT decimal(8,2),
ORD_DATE   Date,
CUSTOMER_ID numeric(5)references customer(CUSTOMER_ID),
SALESMAN_ID numeric(5)references salesman(SALESMAN_ID) 
)

insert into salesman(SALESMAN_ID,NAME,CITY,COMMISSION )
values (5003,'Lauson Hen','san Jose',0.12)
select * from salesman

insert into customer(CUSTOMER_ID,CUST_NAME,CITY,GRADE,SALESMAN_ID)
values(3001,'Grad Guzan','London',null,5005)
select * from customer

insert into orders(ORD_NO,PURCH_AMT,ORD_DATE,CUSTOMER_ID,SALESMAN_ID)
values(70013,3045.6,'2012-04-25',3002,5001)

select * from orders

update orders 
set PURCH_AMT=1983.3
where CUSTOMER_ID = 3004
// Day1
select ORD_DATE,SALESMAN_ID,ORD_NO,PURCH_AMT from ORDERS

select NAME as 'Salesman Name',CITY from salesman where city ='Paris'

select ORD_NO,ORD_DATE,PURCH_AMT from orders where SALESMAN_ID=5001

select CUSTOMER_ID,CUST_NAME,CITY,GRADE,SALESMAN_ID from customer where city='New York' and grade > 100

select * from salesman where COMMISSION between 0.10 and 0.12

select SUM(PURCH_AMT)as 'Total Purchase Amt' from orders

select avg(PURCH_AMT) as'Average Purchase Amount' from orders

 select count( distinct SALESMAN_ID) as 'count' from salesman


 select  customer_id,ORD_DATE,Max(PURCH_AMT)as 'Highest Purchase' from orders
 group by ORD_DATE,CUSTOMER_ID

 
 select orders.ORD_No,orders.PURCH_AMT,customer.CUST_NAME,customer.CITY from orders,customer where PURCH_AMT between 500 and 2000
 
 select NAME,
 customer.CUST_NAME,customer.CITY from salesman,customer where salesman.city = customer.city

 select customer.CUST_NAME,customer.CITY,salesman.NAME,salesman.COMMISSION from customer,salesman where salesman.COMMISSION >0.12

 select customer.CUST_NAME,customer.CITY,customer.GRADE,salesman.NAME,salesman.CITY from customer,salesman order by customer.CUSTOMER_ID

 // Day2
  select * from orders where salesman_id in(select salesman_id from salesman where name ='Paul Adam')//1
   
   select * from orders where salesman_id in (select salesman_id from salesman where CITY ='London') //2

      select * from orders where salesman_id in (select salesman_id from  orders where CUSTOMER_ID = 3007)//3
	  
	  select * from orders where purch_amt > (select avg(purch_amt)
	  from orders where ORD_DATE = '2012-10 -10')//4

	  select * from orders where salesman_id in (select salesman_id from salesman where CITY ='New york') //5

	  select salesman_id,name from salesman where salesman_id in(select salesman_id from customer
	  group by salesman_id having count(*)> 1)//6
	  select * from orders where purch_amt > (select avg(purch_amt)
	  from orders )//7

	  select * from customer where exists (select * from customer where city ='London')//9

	  select * from salesman where SALESMAN_ID in (select SALESMAN_ID from customer group by SALESMAN_ID having count(*) > 1)

