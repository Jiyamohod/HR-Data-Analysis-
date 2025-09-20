create database hrdata;
use hrdata;
select * from employees;
select count(*) as total_employees
from employees;
select count(*) as total_old_employees
from employees
where dateoftermination !='';
select count(*) as total_old_employees
from employees
where dateoftermination ='';
select avg(salary) as avg_salary
from employees;
select avg(timestampdiff(year,str_to_date(Dateofhire,'%d-%m-%Y'),curdate()))
as avg_years_in_company
from employees;
alter table employees
add employeecurrentstatus int;
set sql_safe_updates=0;
update employees
set employeecurrentstatus=case
when dateoftermination='' Then 1 
else 0
end;
# Cast help tp chnage data type
select (cast(count(case when employeecurrentstatus=0 then 1 end) as float)/count(*))*100 as attrition_rate
from employees;
describe employees;
# or (show columns from employees)
select * from employees limit 5;
select * from employees order by empid desc limit 5;
alter table employees
modify column salary decimal(10,2);
update employees
set dob = str_to_date(dob,'%d-%m-%Y');
update employees
set dateofhire = str_to_date(dateofhire,'%d-%m-%Y');
update employees
set lastperformancereview_date = str_to_date(lastperformancereview_date,'%d-%m-%Y');
alter table employees
modify column dob date,
modify column dateofhire date,
modify column lastperformancereview_date date; 
select dob,dateofhire,dateoftermination,lastperformancereview_date
from employees;
describe employees;
update employees
set dateoftermination='CurrentlyWorking'
where dateoftermination is null or dateoftermination ='';
select maritaldesc,count(*) as Count
from employees
group by maritaldesc
order by count desc;
select department,count(*) as Count
from employees
group by department
order by count desc;
select position,count(*) as Count
from employees
group by position
order by count desc;
select managername,count(*) as Count
from employees
group by managername
order by count desc;
select case
when salary < 30000 then '<30K'
when salary between 30000 and 49999 then '30k-49k'
when salary between 50000 and 69999 then '30k-49k'
when salary between 70000 and 89999 then '30k-49k'
when salary >=90000 then '90k and above'
end as salary_range,
count(*) as frequency
from employees group by salary_range order by salary_range;
select performancescore,count(*) as Count
from employees
group by performancescore
order by performancescore;
select department,avg(salary) as Averagesalary
from employees
group by department
order by department;
select
 termreason,count(*) as count
from employees
where termreason is not null
group by termreason
order by count desc;
select
 state,count(*) as count
from employees
group by state
order by count desc;
select
 gender,count(*) as count
from employees
group by gender
order by count desc;
alter table employees
add column age INt;
update employees
set age = timestampdiff(year,dob,curdate());
select case
when age < 20 then '20'
when age between 20 and 29 then '20-29'
when age between 30 and 39 then '30-39'
when age between 40 and 49 then '40-49'
when age between 50 and 59 then '50-59'
when age >= 60 then '60 and above'
end as age_range,
count(*) as count
from employees group by age_range;
select department,
sum(Absences) as Totalabsences
from employees
group by department
order by totalabsences desc;
select
 gender,sum(salary) as totalsalary
from employees
group by gender
order by totalsalary desc;
select maritaldesc,count(*) as terminatedcount
from employees
where termd=1
group by maritaldesc
order by terminatedcount desc;
select performancescore,avg(absences) as averageabsences
from employees
group by performancescore
order by performancescore;
select recruitmentsource,
count(*) as employeecount
from employees
group by recruitmentsource
order by employeecount desc;



