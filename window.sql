-- window functions -are used to solve analytical problems
-- over means it apply on all the rows
create table demo1(rnk_val int);
insert into demo1 values(101),(102),(103),(103),(104),(105),(106),(106),(107);
select rnk_val,rank() over (order by rnk_val)as test_rank from demo1;

create table sales_info(sales_id int,name varchar(20),sales_amt int,sales_date date);
insert into sales_info values
(1,'alice',300,"2023-01-01"),
(2,'bob',150,"2023-01-02"),
(3,'Bob',300,"2023-01-03"),
(4,'charlie',250,"2023-01-04"),
(5,'Bob',300,"2023-01-05"),
(6,'alice',100,"2023-01-06"),
(7,'charlie',350,"2023-01-07"),
(8,'alice',450,"2023-01-08"),
(9,'Bob',200,"2023-01-09"),
(10,'charlie',400,"2023-01-10");

select * from sales_info;

select
	sales_id,name,sales_amt,sales_date,SUM(sales_amt) over (order by sales_date) as runningTotal
    from sales_info;
-- row number-gives the sequential integer number to every row within the partition and  also finds a duplicate record in the table    
create table demo(id int,name varchar(20));
insert into demo values
(101,"shane"),
(102,"Bradely"),
(103,"Herath"),
(103,"Herath"),
(104,"Tom"),
(105,"Kevin"),
(105,"Kevin");

select id,name,row_number()
over (partition by id,name order by id) as row_num from demo;

create table Employee_Dtls_Info1 (E_Id int, Name varchar(20),
age int, Gen char(1), DOJ date, Department varchar(20), 
Location varchar(20), Salary int);
insert into Employee_Dtls_Info1 values
(1001,"Rajan",24,"M","2005-04-30","Sales","Bangalore",23000),
(1002,"Rajanith",24,"M","2006-04-30","IT","Hassan",25000),
(1003,"Shane",43,"F","1999-04-30","Marketing","Mandya",28000),
(1004,"Karuna",24,"F","2007-04-30","Sales","Tumkur",33000),
(1005,"Ram",34,"M","2005-04-30","Product","Bangalore",23000),
(1006,"Ashu",34,"F","2012-04-30","Tech","Bangalore",28000),
(1007,"Marry",34,"F","2015-04-30","Tech","Shimoga",28000),
(1008,"Robert",34,"M","2012-02-04","HR","Bangalore",30000),
(1009,"William",30,"M","2018-10-15","Tech","Tumkur",35000),
(1010,"Maya",34,"F","2014-10-20","Sales","Hassan",28000);

select name,age,department,SUM(salary) over (partition by Department) as tot_sal
from employee_dtls_info1;#here it displays total salary for each depa as tot_sal for the things which are repeating we use partition 

select row_number() over (order by salary) as row_num,name,salary from employee_dtls_info1
-- order by salary;#here it shows the salary by individual so it comes like index values

#first value--provides the output value of the specified expression
#wrt the first row in the window frame
#here first will replace the name of all the names with the person name of  highest salary
select name,age,salary,first_value(name) over (order by salary desc)
as Highest_sal from employee_dtls_info1;
-- to get the highest paid salary from the department;
select name,department,salary,first_value(name)
over (partition by department order by salary desc) as highest_sal
from employee_dtls_info1;
#here it shows the name of the person whose salary is high in that department
-- for ex karuna has highest in the sales so for sales her name will be printed