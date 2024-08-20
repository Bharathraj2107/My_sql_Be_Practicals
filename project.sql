create table Salesman (salesman_id int not null ,name varchar(20), city varchar(20),commission float,primary key(salesman_id));
insert into salesman values
(5001,"JamesHog","New york","0.15"),
(5002,"Nail Knife","paris","0.13"),
(5005,"Pit Alex","London","0.11"),
(5006,"Mc Lyon","Paris","0.14"),
(5003,"Lauson Hense",NULL,"0.12"),
(5007,"Paul Adam","Rome","0.13");
#Drop table salesman;
select * from salesman;
create table orders (ord_no int primary key, purch_amt float, ord_date date, cust_id int, salesman_id int, foreign key (salesman_id) references salesman(salesman_id));
insert into orders values
(70001, 150.50, "2012-10-05", 3005, 5002),
(70009, 270.65, "2012-09-10", 3001, 5005),
(70002, 65.26, "2012-10-05", 3002, 5001),
(70004, 110.50, "2012-08-17", 3009,5003),
(7007, 948.50, "2012-09-10",  3005, 5002),
(70005, 2400.60, "2012-07-27", 3007, 5001),
(70008, 5760.00, "2012-09-10", 3002, 5001),
(70010, 1983.43, "2012-10-10", 3004, 5006),
(70003, 2480.40, "2012-10-10", 3009, 5003),
(70012, 250.45, "2012-06-27", 3008, 5002),
(70011, 75.29, "2012-08-17", 3003, 5007),
(70013, 3045.60, "2012-04-25", 3002, 5001);
select * from orders
create table customer1 (customer_id int primary key, customer_name varchar (30), city varchar (20), grade int, salesman_id int, foreign key (salesman_id) references salesman (salesman_id));
insert into customer1 values
(3002, "nick rimando", "new york", 100, 5001),
(3005, "graham zusi", "california", 200, 5002),
(3004, "fabian johnson", "paris", 300, 5006),
(3007, "brad davis", "new york", 200, 5001),
(3009, "geoff cameron", "berlin", 100, 5003),
(3008, "julian green", "london", 300, 5002),
(3003, "jozy altidore", "moscow", 200, 5007),
(3001, "brad guzan", "london", null, 5005); 

-- 1)select *  from salesman where commission between 0.12 and 0.14;
-- 2)select sum(purch_amt) from orders;
-- 3)select salesman_id,purch_amt from orders order by salesman_id,purch_amt; 
-- 4)select salesman_id,purch_amt from orders where ord_date="2012-08-17"; 
-- 5)select s.name,s.city,c.customer_name,c.city from salesman s
-- inner join customer1 c
-- where s.city=c.city;
-- 6)SELECT ord_no ,customer_name ,orders.cust_id ,orders.salesman_id FROM salesman,customer1,orders
-- WHERE customer1.city <> salesman.city
-- AND orders.cust_id = customer1.customer_id
-- AND orders.salesman_id = salesman.salesman_id;

-- select s.city,c.city from salesman s
-- inner join customer1 c
-- where s.city!=c.city;
-- union
-- select o.ord_no from orders o; 
-- inner join salesman s
-- where o.salesman_id=s.salesman_id;
-- union
-- select s.city,c.city from salesman s
-- inner join customer1 c
-- where s.city!=c.city;
-- 7)select o.ord_no from orders o
-- inner join salesman s
-- where s.salesman_id and o.salesman_id=5007;


-- 8)(select * from orders where salesman_id=(select salesman_id from salesman order by commission Desc limit 0,1));
-- select salesman_id from salesman
-- 9)SELECT * FROM salesman
-- WHERE salesman_id IN ( SELECT DISTINCT salesman_id
-- FROM customer1 a WHERE NOT EXISTS ( SELECT * FROM customer1 b WHERE a.salesman_id = b.salesman_id
-- AND a.customer_name <> b.customer_name));
-- 10)SELECT * FROM orders WHERE
-- salesman_id IN (SELECT salesman_id FROM salesman
-- WHERE city ='Paris'); 
