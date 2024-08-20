#common table expressions(CTE) these are only expressions
CREATE TABLE sales_transactions ( branch VARCHAR(10), date DATE, seller VARCHAR(20), item VARCHAR(50), 
quantity INT, unit_price DECIMAL(10, 2));
INSERT INTO sales_transactions (branch, date, seller, item, quantity, unit_price) VALUES
('Paris-1', '2021-12-07', 'Charles', 'Headphones A2', 1, 80.00),
('London-1', '2021-12-06', 'John', 'Cell Phone X2', 2, 120.00),
('London-2', '2021-12-07', 'Mary', 'Headphones A1', 1, 60.00),
('Paris-1', '2021-12-07', 'Charles', 'Battery Charger', 1, 50.00),
('London-2', '2021-12-07', 'Mary', 'Cell Phone B2', 2, 90.00),
('London-1', '2021-12-07', 'John', 'Headphones A0', 5, 75.00),
('London-1', '2021-12-07', 'Sean', 'Cell Phone X1', 2, 100.00);

-- script to obtain the price of most expensive item 
WITH highest as (select branch,date,MAX(unit_price) AS highest_price from sales_transactions
	GROUP BY branch,date)
select sales_transactions.*,h.highest_price from sales_transactions JOIN highest h 
	ON sales_transactions.branch=h.branch
	AND sales_transactions.date=h.date;
    
-- generating a report with the highest daily revenue by branch
with daily_revenue AS (select branch,date,SUM(unit_price*quantity) AS daily_revenue
from sales_transactions
Where EXTRACT(YEAR FROM date)=2021
group by 1,2
)
select branch,MAX(daily_revenue) max_daily_revenue from daily_revenue
group by 1 order by 2 desc;

#we want a report with the total monthly revenue in london in 2021 but we also want the revenue for each branch in london in the same report

with london1_monthly_revenue as (
select
EXTRACT(MONTH from date) as month,
SUM(unit_price*quantity) as revenue
from sales_transactions
where extract(year from date)=2021
and branch='london-1' group by 1),
london2_monthly_revenue as (select extract(month from date) as month,
SUM(unit_price*quantity)as revenue
from sales_transactions
where extract(year from date)=2021
and branch='london-2' group by 1)
select l1.month,l1.revenue+l2.revenue as london_revenue,
l1.revenue as london1_revenue,l2.revenue as london2_revenue
from london1_monthly_revenue l1,london2_monthly_revenue l2
where l1.month=l2.month;

-- to obtain a report to inform each branch of the date on which the largest ticket(i.e amount of the item quantity combination) was sold and the amount of this ticket to do this we 
-- need to create a CTE that ranks the tickets(the column position is the  ranking) for eacxh branch by the ticket amount
with tickets as(select distinct branch,date,unit_price*quantity as ticket_amount,row_number() over (Partition by branch order by unit_price*quantity DESC) as position
from sales_transactions order by 3 desc)
select branch,date,ticket_amount from tickets
where position=1; 

create table employees (employeeid int,managerid int);

insert into employees(employeeid,managerid)
values(1,NULL),(2,1),(3,1),(4,2),(5,2),(6,3),(7,6);

with recursive EmployeeHierarchy(EmployeeID,ManagerID,level)as(
#anchor member:Retrive the root manager
select EmployeeID,ManagerID,0
from Employees
where ManagerID is null
union all
#Reccurive member:Retrive employee reporting to each  manager
select e.EmployeeID,e.ManagerID,eh.level +1
from Employees e
join EmployeeHierarchy eh on e.ManagerID = eh.EmployeeID
)
select EmployeeID,ManagerID,level from EmployeeHierarchy;

