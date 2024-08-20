create table Employee2(
EmpId int,
EmpName varchar(25),
EmpAddress varchar(100),
EmpDept varchar(25)
);
insert into Employee2 values
(1,'Rambo','kolkata','IT'),
(2,'Rohit','Kolkata','IT');
create table Emp_Details1(
EmpId int,
EmpName varchar(20),
EmpLogin varchar(20),
EmpPassword varchar(20),
EmploymentDate date);

insert into Emp_Details1 values
(101,"employeeA","EmpA","EmpApwd","2006-01-29"),
(102,"employeeB","EmpB","EmpBpwd","2007-06-02"),
(103,"employeeC","EmpC","EmpCpwd","2007-05-17"),
(104,"employeeD","EmpD","EmpDpwd","2007-05-29"),
(105,"employeeE","EmpE","EmpEpwd","2008-05-29"),
(106,"employeeF","EmpF","EmpFpwd","2008-07-29"),
(107,"employeeG","EmpG","EmpGpwd","2009-06-29"),
(108,"employeeH","EmpH","EmpHpwd","2009-06-28"),
(109,"employeeI","EmpI","EmpIpwd","2010-05-29"),
(110,"employeeJ","EmpJ","EmpJpwd","2010-06-29");

create view View_Emp_Details as
select EmpId, EmpName,EmpLogin,EmpPassword,EmploymentDate from Emp_Details1;
-- drop view View_Emp_Details;
select * from  View_Emp_Details where EmpId=101;

create table EmpProjInfo(EmpId int,Projectname varchar(200));
insert into EmpProjInfo values(101,"onlineBookA"),
(102,"onlineBookB"),(103,"onlineBookC"),(104,"onlineBookD"),(105,"onlineBookE");
drop view join_table;

create view join_table as
select Emp_details1.Empid, Emp_details1.EmpName,EmpProjInfo.Projectname from Emp_details1
inner join EmpProjInfo on Emp_details1.EmpId=EmpProjInfo.EmpId;

select * from join_table where EmpId=102;

create table clients(id int primary key,name varchar(20),Email_id varchar(20));
insert into clients values
(1,'george','ge.com'),
(2,'David','da.com'),
(3,'chris','ch.com'),
(4,'morris','mo.com'),
(5,'brain','br.com');

create table clients_location(id int primary key,country varchar(20),country_code varchar(5));
insert into clients_location values
(1,'India','IND'),
(2,'Spain','SPA'),
(3,'france','FRA'),
(4,'England','ENG'),
(5,'poland','POL');

create view clients_1 as
select clients.id,clients.name,clients_location.country,clients_location.country_code from clients
inner join clients_location
on clients.id=clients_location.id;
select * from clients_1 where id=1;
#here view is used as separate copy so that we can change only the copy and see the orirginal will not be affected;
create view V_clients as 
Select * from clients; 
select * from V_clients;
insert into V_clients values(7,'NewZeland','update_later');
update V_clients Set Email_id='nz.com' where id=7;
delete from V_clients where id=7;