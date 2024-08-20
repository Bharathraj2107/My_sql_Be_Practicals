#procedures
create database strd_procdurs;
use strd_procdurs;
--  procedure in sql is a group of sql statements that are stored together in database
-- based on the statement in the procedureand the parameters  you pass ,it can perform one or multiple
-- DML operations on the database and return function type
create table players(Id int,Name varchar(20),country varchar(20),goals int);
 insert into players values
 (101,"sam","usa",9),
 (102,"Bruno","swedon",6),
 (103,"daniel","usa",7),
 (104,"Anthony","France",10),
 (105,"alex","usa",5),
 (106,"matt","usa",5);
 
 #to display total num of players who has the goals>6
 delimiter //
 create procedure Top_players()
 begin
 select name,country,goals from players
 where goals>6;
 end //
 delimiter ;
 
 call Top_players();
 #players from usa
 delimiter //
 create procedure usa_people()
 begin
 select name,country from players
 where country="usa";
 end //
 delimiter ;
 
call usa_people();

#goal and usa people
 delimiter //
 create procedure usa_people_goal()
 begin
 select name,country,goals from players
 where country="usa" and goals >6;
 end //
 delimiter ;
 
call usa_people_goal();
CREATE TABLE Employee_Info (id int, name varchar(20), Age int, Gen char(1), 
 Location varchar(20), Department varchar(20), Salary float);

insert into Employee_Info values
(101,"Tom", 23, "M","Delhi","IT",25000),
(102, "Harry",24,"M","Delhi","Admin",40000),
(103,"Hannah",25,"F","Bangalore","IT",50000),
(104,"Sneha",26,"F", "Mumbai","Admin",39000),
(105,"Arun", 27,"M","Kolkatha","Mktg",28000),
(106,"Vanya",24,"F", "Delhi","IT",24000); 
select * from Employee_info ;
delimiter //
create procedure sort_by_sal(IN sal int)#this is like passing parameter inside the salary dept
begin
select name,age,department,salary from employee_info
order by salary limit sal;
end //
delimiter ;
call sort_by_sal(3);
 
 delimiter //
 create procedure updt_sal(IN temp_name varchar(20),IN new_sal int)
 begin
 update Employee_Info set salary=new_sal
 where name= temp_name;
 end //
 delimiter ;
 
 call updt_sal("vanya",40000);#here we are passing the name and salary so IN is used as Parameter
 select * from employee_info;
 #The function when we create and paranthesis() inside are called parameters #create procedure updt_sal(IN temp_name varchar(20),IN new_sal int)
 #and when calling the function we pass the value in paranthesis when we call is called as argument #  call updt_sal("vanya",40000)
 -- create procedure count_emp1(out tot_emp int)
--  begin
--  select count(name) into tot_emp
--  from Employee_info where Gen='F';
--  end //
--  delimiter ;

 delimiter //
create procedure count_femp()
begin
select count(*) as emp_count from employee_info
where gen="F";
end  //
delimiter ;
call count_femp();

delimiter //
create procedure count_emp1(out tot_emp int)#we use out to return something to the called function
begin
select count(name) into tot_emp
from Employee_Info where Gen="F";
end //
delimiter ;

call count_emp1(@f_emp);
select @f_emp as female_employees;
# call count_emp1(@f_emp);
#Explanation: This calls the stored procedure count_emp1 and passes a user-defined session variable @f_emp as the argument for the OUT parameter tot_emp.
#@f_emp: The @ symbol indicates that f_emp is a session variable. This variable will store the output value set by the procedure.
#Explanation: This selects the value of the session variable @f_emp and labels it as female_employees in the result set.
#The result will show the count of female employees, which was calculated by the stored procedure and stored in the @f_emp variable. 
 -- In SQL stored procedures, there are three types of parameter modes:

-- IN:

-- Indicates that the parameter is an input parameter.
-- The value of an IN parameter is passed from the caller to the procedure.
-- The procedure can use the value of the IN parameter, but it cannot modify the caller's variable that was passed in.
-- This is the most commonly used mode and is the default if no mode is specified.
-- OUT:

-- Indicates that the parameter is an output parameter.
-- The procedure can assign a value to an OUT parameter, which will be passed back to the caller.
-- The caller cannot pass a value to the procedure using an OUT parameter; it is only used for returning values from the procedure.
-- INOUT:

-- Indicates that the parameter is both an input and output parameter.
-- The caller can pass an initial value to the procedure, and the procedure can modify this value and pass it back to the caller.