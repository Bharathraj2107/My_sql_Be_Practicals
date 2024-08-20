-- create database Employee;
-- use Employee;
-- create table Emp_table(id int ,Name Varchar(10),age int,location varchar(20));
-- desc Emp_table;
-- insert into Emp_table values
-- (1,'Ram',20,'Bangalore'),
-- (2,'sam',28,'chennai'),
-- (3,'rock',21,'andra'),
-- (4,'john',17,'Bangalore'),
-- (5,'Rey',22,'Teleangana'),
-- (6,'grey',23,'malasia'),
-- (7,'undertaker',20,'tumkur'),
-- (8,'kane',22,'Rajajinagar'),
-- (9,'big show',25,'Vijaynagar'),
-- (10,'mark',30,'Jaynagar');
-- select * from Emp_table;
-- alter table Emp_table add column education varchar(20);
-- desc  Emp_table;
-- truncate Emp_table 
create table Employee_Dtls_Info (E_Id int, Name varchar(20),
age int, Gen char(1), DOJ date, Department varchar(20), 
Location varchar(20), Salary int);
use Employee;
insert into Employee_Dtls_Info values
(1001,"Rajan",24,"M","2005-04-30","Sales","Bangalore",23000),
(1002,"Rajanith",24,"M","2006-04-30","IT","Hassan",25000),
(1003,"Shane",43,"F","1999-04-30","Marketing","Mandya",28000),
(1004,"Karuna",24,"F","2007-04-30","Sales","Tumkur",33000),
(1005,"Ram",34,"M","2005-04-30","Product","Bangalore",23000),
(1006,"Ashu",34,"F","2012-04-30","Tech","Bangalore",28000),
(1007,"Marry",34,"F","2015-04-30","Tech","Shimoga",28000),
(1008,"Robert",34,"M","2012-02-04","HR","Bangalore",30000),
(1009,"William",30,"M","2018-10-15","Tech","Tumkur",35000),
(1010,"Maya",34,"F","2014-10-20","Sales","Hassan",28000),
(1011,"Rajan",44,"M","2006-04-30","IT","Hassan",45000),
(10012,"Sara",33,"F","2000-04-30","Marketing","Mandya",28000),
(10013,"Kamal",24,"M","2020-04-30","Sales","Tumkur",33000),
(10014,"Rose",34,"F","2015-04-30","Product","Bangalore",23000),
(1015,"Anshu",34,"M","2019-04-30","Tech","Bangalore",28000),
(1016,"Madura",34,"F","2020-04-30","Tech","Shimoga",28000),
(1017,"Joseph",34,"M","2010-02-04","HR","Bangalore",40000),
(1018,"William",30,"M","2019-10-15","Tech","Tumkur",35000),
(1019,"Mayura",34,"F","2021-10-20","Sales","Hassan",28000),
(1020,"John",34,"M","2021-10-12","Tech","Shimoga",28000);
-- select * from  employee.Employee_Dtls_Info;
-- update Employee_Dtls_Info set age='30' 
-- where Location='Hassan';
-- alter table Employee_Dtls_Info add column college varchar(20);
--  select * from  employee.Employee_Dtls_Info; 
create table Emp_salary(E_id int,Designation varchar(20),Experience int,salary int,Department varchar(20));
insert into Emp_salary values
(001,"Developer",5,35000,"FullStack"),
(002,"Tester",4,33000,"Testing"),
(003,"HR",4,32000,"Finance"),
(004,"Admin",6,20000,"Admistration"),
(005,"TL",8,43000,"Testing");
select * from Emp_salary where Experience between 5 and 8;
-- Distinct,Order by,like,limt 
create table ds2stud_info(stud_Id int,Name varchar(20),courses varchar(20),Gen varchar(2),Location varchar(20),fees fixed);
insert into ds2stud_info values
(101,"megha","datascience","F","koppal",35000),
(102,"yashwanth","datascience","M","Bangalore",35000),
(103,"chandan","datascience","M","Tumkur",35000),
(104,"Basvaraj","datascience","M","Mandya",35000),
(105,"Divya","datascience","F","Bangalore",35000),
(106,"Pradeed","datascience","M","chitradurga",35000),
(107,"anusha","python","F","Bangalore",35000),
(108,"suguna","python","F","Bangalore",3500),
(109,"Divyashree","datascience","F","Mysore",35000),
(110,"namitha","python","F","Mysore",35000);
select name,gen,location,courses from ds2stud_info
order by gen;
select name,location,courses,fees from ds2stud_info
order by Location desc;#here desc means descending order
select distinct location from ds2stud_info
order by location desc;
select*from emp_salary order by salary
limit 0,3;#0,3 and3 bothare same
select*from emp_salary order by salary
limit 3,3;#here it gives based on index start from 0 and if we give value more than the number of rows present it will give all the rows are present 
#no errors in the above example start is index 3  from that index i including need 2 records.if the end > then rows actually containing then it will give remaining rows also along with starting
select * from employee_dtls_info where name like "%ra%";
select * from employee_dtls_info where name like "s%";
select * from employee_dtls_info where name like "_____";#here based on the number of underscore were each underscore is a character here it is 5 so only name who have 5 character will be printed
#aggregate functions
select count(*)from ds2stud_info#starts from 0 index 0-9 so total 10;
select count(courses) from ds2stud_info;
select count( distinct courses) as course_name from ds2stud_info;
select count( distinct location) as lo from ds2stud_info;
-- update ds2stud_info set fees=40000 where stud_Id=110;
select * from ds2stud_info;
-- select E_id,name,salary from employee_dtls_info
-- where department="sales" or location="Bangalore";
select location,count(*) from employee_dtls_info group by location;
select location,DOJ,count(*)from employee_dtls_info group by location,Doj;
select department,count(*) from employee_dtls_info group by department;
select department,location,count(*) from employee_dtls_info group by location;#error
select* from employee_dtls_info;
-- min and max
select min(age) from employee_dtls_info;
select max(age)from Employee_dtls_info;
select max(age) name,department,count(*)from employee_dtls_info group by Department;
select department,avg(age) from employee_dtls_info group by Department;
-- alter table employee_dtls_info change Name emp_name varchar(20);
-- desc employee_dtls_info
-- select Department,round((age),1) as avg_age from Employee_Dtls_info groupby Department;
create table sales(prod_id int,sell_price float,quantity int,state varchar(20));

insert into sales values
(121,320.0,3,"california"),
(121,320.0,6,"Texas"),
(121,320.0,4,"Alaska"),
(123,290.0,2,"Texas"),
(123,290.00,7,"california"),
(123,290.00,4,"Washington"),
(121,320.00,7,"ohio"),
(121,320.0,2,"Arizona"),
(123,290.0,8,"colorado");
select prod_id ,sum(sell_price*quantity) as revenue from sales group by prod_id;
select * from employee_dtls_info;
select count(E_id),LOCATION FROM employee_dtls_info GROUP BY LOCATION#from emp id 2 it takes and group by location greater than 2
HAVING COUNT(E_id)>2;
-- from here
select department,avg(salary) as avg_sal from employee_dtls_info
group by Department having avg(Salary)>30000;
select department,count(*) as emp_count from employee_dtls_info
group by (Department) having count(*)>2;
select location,count(*) as emp_count from employee_dtls_info
where Location="bangalore" group by location having count(*)>2;
select location,count(*) as emp_count from employee_dtls_info
where Location!="bangalore" group by location having count(*)>2;

create table c_product (prod_id int,cost_price float);
insert into c_product values(121,270.0),(123,250.0);

select c.prod_id, sum((s.sell_price - c.cost_price) * s.quantity ) as profit
from sales as s inner join c_product as c
where s.prod_id=c.prod_id
group by c.prod_id;

create table if not exists Employee_Department (
name varchar(100),id INT NOT NULL auto_increment,primary key(id));

insert into Employee_Department(name) values
('Information science'),
('HR'),
('Finance'),
('Accounting'),
('HouseKeeping'),
('security'),
('support'),
('contract staff'),
('sales'),
('management');
CREATE TABLE IF NOT EXISTS Employee (
    name varchar(100),id int not null auto_increment,address varchar(100),
    Department_id int,PRIMARY KEY (id),FOREIGN KEY (Department_id) references
    Employee_Department(id));
    
    INSERT INTO Employee VALUES 
('Veniam','1','640 Damon Junction\nEast Mathew, NY 68818','3'),
('Molestiae','2','6658 Hollis Club\nErnamouth, TX 19743','10'),
('Officiis','3','59965 Mason Neck Apt. 985\nKareemborough, NV 85535','9'),
('Rerum','4','91067 Geovany Fort\nHanefort, WA 92863','6'),
('Et','5','7647 Reva Shores Suite 970\nNew Audrafort, OH 17846-5397','2'),
('Et','6','9419 Carmela Burg Apt. 687\nAimeebury, SD 32389-4489','8'),
('Laborum','7','6961 Weissnat Drive\nDonnellyfort, MT 53947','6'),
('Cupiditate','8','117 Nellie Summit Suite 982\nSouth Heavenfurt, CA 45675','8'),
('Eveniet','9','9086 Mariam Square Suite 698\nSouth Dulce, MT 82861-3079','2'),
('Rerum','10','783 Goodwin Burgs Apt. 429\nWillmsfort, UT 42820-1019','9'),
('Quis','11','42928 Ernesto Trail\nEast Jules, WV 87169-2851','1'),
('Esse','12','161 Kassulke Stravenue Apt. 937\nWilliamsonton, MS 62622','7'),
('Dolores','13','22811 Liliana Trail Apt. 890\nSouth Ernesto, MT 04134','10'),
('Ut','14','981 Laron Overpass Suite 361\nWest Olahaven, FL 46982-7801','10'),
('Mollitia','15','411 Louisa Mill\nSouth Maximefort, MA 04903','8'),
('Necessitatibus','16','2853 Jonathon Turnpike\nQuitzonville, KY 54776','4'),
('Fugit','17','3647 Rosalinda Corner\nMaureenstad, RI 96605','5'),
('Corporis','18','03559 Nicholas Circle Apt. 364\nWest Zettaberg, ID 58592-3447','8'),
('Neque','19','56111 Alysson Gateway Apt. 212\nLeschbury, VT 90605-2306','8'),
('Velit','20','263 O\'Keefe Avenue Apt. 884\nWest Missouri, IL 50303','6');
select * from employee;

select employee.name as E_name,
Employee_Department.name as E_department
from employee
inner join employee_Department
on employee.department_id=employee_Department.id;

select * from employee
inner join Employee_Department
on Employee.Department_id = Employee_Department.id; 
use employee;
create table cricket(crik_id int auto_increment,name varchar(20),primary key(crik_id));
insert into cricket(name)values
("stuart"),("Micheal"),("John"),("Hyden"),("Mike");

create table football(fb_id int auto_increment,name varchar(20),primary key(fb_id));
insert into football (name) values
("stuart"),("John"),("Hyden"),("stieve"),("Nick");

select cricket.name as c_name,crik_id,
football.name as f_name,fb_id
from cricket
inner join football
on cricket.name=football.name;

-- select name, salary,designation
create table employee_info (id int auto_increment,name varchar(20),location varchar(20),salary float,primary key(id));
insert into employee_info (name,location,salary)values
("Tom","delhi",25000),
("Harry","delhi",40000),
("Hannah","Bangalore",50000),
("sneha","Mumbai",39000),
("Arun","Kolkatha",28000),
("vanya","delhi",300000);

create table department1(id int auto_increment,name varchar(20),location varchar(20),designation varchar(20),primary key(id));
insert into department1(name,location,designation)values
("Marketing","delhi","Manager"),
("operation","delhi","TL"),
("sales","Bangakore","executive"),
("Hr","Mumbai","intern"),
("production","kolkatha","sr.Executivr"),
("admin","delhi","admin_manager");

select employee_info.id as id,employee_info.name,employee_info.location,department1.designation
from employee_info
inner join department1
on employee_info.location=department1.location;

#cartesian join
select employee_info.id,employee_info.name,
department1.name,department1.designation
from employee_info,department1;

#outer join --left join
select* from employee_info as E left join department1 as D
on E.id=D.id;

#outer join--right join
select E.id,E.name,E.location,D.name,D.designation
from employee_info as E right join department1 as D
on E.id=D.id; 

#full outer join employeee U department
select E.id,D.name,D.designation
from employee_info as E left join department1 as D
on E.id=D.id;

#self join
#query to find out which employees belong to the samecity,A and B are
-- the alias for the same table
select A.location,A.name,B.name
from Employee_info A
inner join Employee_info B
on A.location =B.Location
and A.name>B.name;#for no repetation of names we use this 

select A.Location, A.emp_name, A.salary,B.emp_name,B.salary,B.Location 
from Employee_Dtls_Info A
inner join Employee_Dtls_Info B
on A.Department=B.Department
and A.emp_name > B.emp_name;

select * from employee_dtls_info;
#sub queries
select department,salary from employee_dtls_info where salary=(select max(Salary)from employee_dtls_info);

select * from employee_dtls_info where
Doj between "2015-01-01" and "2020-12-30"
<(select avg(Salary)  from employee_dtls_info);
#to insert into other table
create table products(p_id int,p_item varchar(20),sell_price float,p_type varchar(30));
insert into products values
(101,"jwelery",1500,"luxury"),
(102,"T-shirts",600,"Not luxury"),
(103,"Laptop",23000,"luxury"),
(104,"Table",1200,"Notl uxury"),
(105,"Keyboard",800,"Not luxury");
select * from products;
#creating an order table and inserting some records from products
create table orders1
(o_id int,prod_sold varchar(20),selling_price float);
select * from orders1;
#we using insert an subquerry to add records from products table to order table
insert into orders1
select p_id,p_item,sell_price from products where
p_id in(select p_id from products where sell_price>1000);
select * from orders1;

-- update Employee_Dtls_info set Salary=Salary * 0.35
-- -- where age in (select age from Employee_dtls_info where age>30);

-- delete from employee_dtls_info where age in (select age from employee_dtls_info where age>27);
-- select name,department,location from employee_dtls_info where E_id =any(select E_id from emoployee_dtls_info where location="shimoga");
create table newemployeeinfo( id int ,ename varchar(20), job varchar(20),Hiredate date ,salary varchar(20),comm varchar(10),deptino varchar(20));
drop table newemployee;
insert into newemployeeinfo values
(7369,"smith","clerk","17-12-08",800,7829,20),
(7499,"alien","salesman","20-2-18",300,7895,30),
(7521,"ward","salesman","22-2-18",500,7639,30),
(7566,"jones","manager","02-4-18","null",7896,20),
(7654,"martin","salesman","28-6-21",7698,1400,30),
(7698,"blake","salesman","1-5-18",7689,"null",30),
(7782,"scott","manager","5-10-17",7685,"null",30),
(7788,"mario","salesman","15-5-19",7853,"null",30),
(7839,"yivan","manager","23-7-20",7653,"null",30),
(7844,"yutuva","manager","29-8-20",7856,"null",30);
select * from newemployeeinfo;
-- select ename,salary,job from newemployee;
-- update newemployee set salary=salary * 0.25;
-- delete from newemployee where id=7566;
select ename,salary 
-- (salary+(salary)*0.25) as incr
from newemployeeinfo;
-- update newemployeeinfo set salary=salary+salary *0.50;
alter table newemployee change salary salary int;

create table  Students_info (Stud_Id int , Name varchar(20),
Courses varchar(20), Gen varchar(2), Location varchar(20),
fees fixed);
use employee;
insert into Students_info values 
(101, "Megha", "Data Science", "F","Koppal", 35000),
(102, "Jeshwanth", "Data Science","M", "Bangalore", 35000),
(103, "Basavaraju", "Data Science","M", "Tumkur", 35000),
(104, "Chandan", "Data Science","M", "Mandya", 35000),
(105, "Divya", "Data Science","F", "Bangalore", 35000),
(106, "Pradeep", "Data Science","M", "Chitradurga", 35000),
(107, "Anusha", "Python","F", "Bangalore", 35000),
(108, "Suguna", "Python","F", "Bangalore", 35000),
(109, "Divyashree", "Data Science","F", "Mysore", 35000),
(110, "Namitha", "Python","F", "Mysore", 35000);

-- select name from students_info where location="Bangalore";
-- select name from students_info where location!="Bangalore";
-- select *from students_info where Courses like "%Data%";
-- select * from students_info where location="Bangalore"and courses="Data Science" and Gen="F";
alter table students_info add column company varchar(20);
update students_info set company="FlipKart" where location="Bangalore"; 
update students_info set company="Microsoft" where location="koppal"; 
update students_info set company="Microsoft" where location="Mysore"; 
update students_info set company="Microsoft" where location="Chitradurga";
update students_info set company="Microsoft" where location="Mandya";  
update students_info set company="Microsoft" where location="Tumkur"; 
select * from students_info where company in('Flipkart','Microsoft');
select* from students_info;
alter table students_info add column course_duration varchar(10);
update students_info set course_duration="4"where location="Bangalore"; 
update students_info set course_duration="3" where location="koppal"; 
update students_info set course_duration="4" where location="Mysore"; 
update students_info set course_duration="3" where location="Chitradurga";
update students_info set course_duration="3" where location="Mandya";  
update students_info set course_duration="3" where location="Tumkur"; 
#cases
select stud_id,courses,fees,
case
	when course_duration >=4 then "masters"
	else "diploma"
    end as course_category
from students_info;    
select * from students_info;

select stud_id ,name,company,
case
	when company in ('Flipkart','walmart') then "product Based"
    else "service Based"
    end as company_type
from students_info;    

create table Medal_Of_Honor ( Id int  primary key, Mdl_Rank varchar(50),
 SoldierName varchar(50), YearOfAction varchar(4) );

insert into Medal_Of_Honor values
 (101,'Staff Sergeant', 'Ty Carter', '2009'),
 (102,'Captain', 'Florent Groberg', '2012'),
 (103,'Major', 'William D. Swenson', '2009'),
 (104,'Corporal', 'Frank L. Anders', '1899'),
 (105,'First Lieutenant', 'George C. Shaw', '1903');
 
 select MDl_Rank,soldierName,
 case MDl_Rank
	when 'staff sergent' then 'E-6'
    when 'Captain' then '0-3'
    when'Major'then '0-4'
    when 'corporal' then 'E-4'
    when 'first lieutenant' then '0-2'
    else 'no rank given'
    end as 'payGrade'
    from medal_of_honor;
    
select Mdl_Rank,soldierName,
case
		when Mdl_rank in ('caprain''major','first lieutenant')then 'officer'
        when Mdl_rank in ('staff sergent','corporal')then 'Enlished'
        else 'other'
        end as officer
from Medal_of_Honor
order by officer;

select soldierName,yearofAction,
case
	when yearofAction >='2001' then '21st'
    when yearofAction>='1901' then '20th'
    when yearofAction>='1801' then '19th'
    end as century
    from Medal_of_Honor
    order by century desc;
    
update Medal_of_Honor
set
 Mdl_Rank =
 (case
	when Mdl_Rank in ('captain','Major','first lieutenant') then 'officer'
    when Mdl_Rank in ('staff sergent','corporal') then 'Enlisted'
    else 'other'
    end);
select * from medal_of_honor;
select * from Employee_Dtls_info;

-- salary=salary+salary*010 as inc;
-- update newemployee set Salary=Salary - 0.10;
-- update newemployee set Salary=Salary -0.25;
-- select ename,salary
-- from newemployeeinfo
-- update newemployeeinfo set salary=salary+salary*0.05; 
select * from newemployee;
select ename from newemployee where deptino=20;
select * from newemployee where comm>salary;
select ename,deptino ,job from newemployee where deptino=10 and job="manager";
select ename,salary,deptino from newemployee  where salary >1250 and salary < 4000 and deptino=20;
select ename,job,deptino from newemployee where job="manager"and deptino=10 or 30;
select ename,job,deptino,salary from newemployee where job="clerk" or "salesman" and deptino=10 or 30 and salary > 1800;
select ename,job from newemployee where job="clerk" or "manager" or "salesman";
select * from newemployeeinfo;
select * from newemployeeinfo;

select ename,id,salary from newemployeeinfo where id=7902 or 7839 and salary >2925;
use employee;
-- Triggers
create table customers(C_id int,Age int,C_name varchar(20));
delimiter //
create trigger Age_verify
before insert on customers
for each row
begin
if new.Age < 0 then set new.Age=0;
end if;# this is for end of if 
end ;# this is to end rows
-- drop trigger trigger name(age_verify)
insert into customers values
(101,23,"james"),
(102,-34,"anten"),
(103,25,"Ben"),
(104,-56,"ammy"),
(105,12,"rose");
select * from customers;
create table customers1(id int auto_increment primary key,name varchar(20) not null,
email varchar(20),Birthdate date);

create table Message(id int auto_increment,messgId int,message varchar(200) not null,
primary key(id,messgId));#we can have 1 primary key also
#here the id is incremented in the message table whenever the date of birth is null 
#here we have 2 null values so its id is incremented 2 so only id display 1 and 2 only
delimiter //
create trigger check_null_dob
after insert on customers1
for each row
begin
if new.Birthdate is null then
insert into message(messgId,message)
values(new.id,concat('hi ',new.name,' please update your date of birth'));
end if;
end;

insert into customers1(name,email,Birthdate)
values("Nancy","nancy@123.com",Null),
("Ronald","rnld@123.com","1998-11-16"),
("chris","chris@234.com","1997-08-20"),
("Alice","alice@234.com",Null);

select * from message;
#before update trigger
create table Employee1(E_id int primary key,name varchar(20), age int,sal float);
insert into Employee1 values
(101,"Amy",34,45000),
(102,"Namcy",34,34000),
(103,"John",34,45000),
(104,"Robert",23,28000),
(105,"Tilak",24,25000),
(106,"Ronald",26,35000),
(107,"chris",34,40000),
(108,"antony",44,45000),
(109,"jessy",24,22000),
(110,"messy",34,45000);

delimiter //
create trigger update_salary
before update on Employee1
for each row
begin
if new.sal >25000 then set new.sal=30000;
else if new.sal<25000 then set new.sal=28000;
end if;
end;

update Employee1 set sal=29000;#based on this condition it goes salary of this 

select * from Employee1;
#before delete trigger
create table Salary(E_id int primary key,valid_from date not null,salary float not null);
insert into Salary(E_id,valid_from,salary)values
(101,"2005-05-01",55000),
(102,"2007-08-01",68000),
(103,"2006-09-01",54000),
(104,"2007-03-01",45000);

create table sal_del(id int primary key auto_increment,E_id int,valid_from date not null,
salary float not null,delete_at timestamp default now());

#timestamp--> this will return the time and date
#when the rec has been deleted from the table
#before delete trigger command
#table name and trigger name cannot be the same
delimiter //
create trigger sel_del
before delete on Salary
for each row
begin
insert into sal_del(E_id,valid_from,salary)values
(old.E_id,old.valid_from,old.salary);#her old means E_id: Uses the E_id of the record being deleted from the Salary table.
end;
delete from Salary where E_id=103;
select * from sal_del;
#Without default now(): The delete_at field will be NULL unless explicitly set during the insertion.
#With default now(): The delete_at field will be automatically set to the current timestamp during insertion if no value is provided.
#Having default now() is useful for tracking the exact time when a record was inserted into sal_del, especially for logging deletions or maintaining historical records.