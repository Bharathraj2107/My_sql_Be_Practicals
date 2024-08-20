create table Employee3 (Empid int primary key ,EmpName varchar(20),department varchar(10),contactno varchar(20),emailid varchar(20),EmpHeadId int);
drop table employee3;
insert into Employee3 values
(101,"Isha","E-101","1234567890","isha@gmail.com",105),
(102,"Priya","E-104","1234567890","priya@yahoo.com",103),
(103,"Neha","E-101","1234567890","neha@gmail.com",101),
(104,"Rahul","E-102","1234567890","rahul@yahoo.com",105),
(105,"abhishek","E-101","1234567890","abhishek@gmail.com",102);
create table EMPDept(DeptId varchar(10) primary key,Deptname varchar(20),dept_off varchar(20),DeptHead int);
drop table EMPDept;
insert into EMPDept values
("E-101","HR","Monday",105),
("E-102","HR","Tuesday",101),
("E-103","HR","saturay",103),
("E-104","HR","sunday",104),
("E-105","HR","Tuesday",104);

create table EmpSalary(Empid int primary key,salary varchar(20),IsPermanent varchar(10));
insert into EmpSalary values
(101,25000,"Yes"),
(102,230000,"Yes"),
(103,8000,"no"),
(104,19000,"no"),
(105,23000,"Yes");

create table project(ProjectId varchar(10) primary key,Duration int);
insert into project values
("p-1",23),
("p-2",15),
("p-3",45),
("p-4",2),
("p-5",30);

create table country (cid varchar(10) primary key,cname varchar(10));
insert into country values
("c-1","india"),
("c-2","usa"),
("c-3","china"),
("c-4","pakistan"),
("c-5","Russia");

create table clienttable(clientId varchar(10) primary key,clientname varchar(10),cid varchar(10), foreign key(cid)references country(cid));
insert into clienttable values
("cl-1","ABC Group",'c-1'),
("cl-2","PQR",'c-2'),
("cl-3","XYZ",'c-3'),
("cl-4","Tech Alum",'c-4'),
("cl-5","MNP",'c-5');

