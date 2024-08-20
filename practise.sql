CREATE DATABASE Student;
SHOW DATABASEs;  
-- CREATE OR REPLACE DATABASE Employee;  why we cannot replace it
-- RENAME DATABASE student TO new_student;why we cant rename it
-- ALTER DATABASE Student MODIFY NAME = College ; 
use student;
CREATE TABLE STUDENTS (  
ID INT                           NOT NULL,  
NAME VARCHAR (20) NOT NULL,  
AGE INT                         NOT NULL,  
ADDRESS CHAR (25),  
PRIMARY KEY (ID)  
);  
DESC mc_STUDENTS;
truncate table students;
alter table students rename to mc_students;#to rename table we use this cmd
INSERT INTO mc_STUDENTS (ID, NAME, AGE, ADDRESS)  
VALUES (1, "ABHIRAM", 22, "ALLAHABAD");  
INSERT INTO mc_STUDENTS (ID, NAME, AGE, ADDRESS)  
VALUES (2, "ALKA", 20, "GHAZIABAD");  
INSERT INTO mc_STUDENTS (ID ,NAME, AGE, ADDRESS)  
VALUES (3, "DISHA", 21, "VARANASI");  
INSERT INTO mc_STUDENTS (ID, NAME, AGE, ADDRESS)  
VALUES (4, "ESHA", 21, "DELHI");  
INSERT INTO mc_STUDENTS (ID, NAME, AGE, ADDRESS)  
VALUES (5, "MANMEET", 23, "JALANDHAR");  
INSERT INTO mc_STUDENTS (ID, NAME, AGE, ADDRESS)  
VALUES (6, "MANMEET", 23, "JALANDHAR"); 
select id,age,name from mc_students where id=1;
select sum(age),name from mc_students group by id;

CREATE TABLE Employee_Having  
(  
Employee_Id INT PRIMARY KEY,  
Employee_Name VARCHAR (50),  
Employee_Salary INT NOT NULL,  
Employee_City VARCHAR (50)  
) ;  

INSERT INTO Employee_Having (Employee_Id, Employee_Name, Employee_Salary, Employee_City)   
VALUES (201, "Jone", 20000, "Goa"),  
(202, "Basant", 40000, "Delhi"),   
(203, "Rashet", 80000,"Jaipur"),  
(204, "Aunj", 20000, "Goa"),  
(205, "Sumit", 50000, "Delhi");
SELECT SUM(Employee_Salary), Employee_City FROM Employee_Having GROUP BY Employee_City HAVING SUM(Employee_Salary)>50000;  
UPDATE mc_students  
SET Name = 'beinghuman',ADDRESS="Bangalore"
WHERE Id = '3' ; 
select * from mc_students;
delete from mc_students where id=6;

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

-- select * from country FULLOUTER JOIN clienttable ON country.cid=clienttable.cid;#full outer join not working
select Last(cname) as last_name from country;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID, LastName)
);
desc persons;
insert into persons values
-- (1,"raj","bharath",23),
-- (2,"chethan","Gowda",23);
(1,"raj","bharath",23);
select * from persons;

alter table persons
drop index uc_person
