
-- select statements
select * from Employees;
select emp_name,salary from Employees;
select emp_name,department from Employees;
select emp_name from Employees where department="IT";
select emp_name,experience from Employees;



-- where statements
select emp_name,salary
from Employees
where salary>70000;

select emp_name
from Employees
where city= "Hyderabad";

select emp_name
from Employees
where experience<4;

select emp_name
from Employees
where department="Finance";

select emp_name
from Employees
where salary=52000;

-- groupby statements
select department,sum(salary) as total_salary
from Employees
group by department;

select department,avg(salary) as average_salary
from Employees
group by department;

select city,count(*) as no_of_employees
from Employees
group by city;

select department,max(salary) as max_salary
from Employees
group by department;

select department,min(experience) as min_experience
from Employees
group by department;

-- having statements
select department,count(*) as count
from Employees
group by department
having count(*)>3;

select department
from Employees
group by department
having avg(salary)>60000;

select city
from Employees
group by city
having count(*)>2;

select department
from Employees
group by department
having sum(salary)>200000;

select department
from Employees
group by department
having max(salary)>90000;

-- top statements
select emp_name,salary
from Employees
order by salary desc
limit 5;


select emp_name,experience
from Employees
order by experience desc
limit 3;

select emp_name,salary
from Employees
where department="Finance"
order by salary desc
limit 2;

select emp_name,salary
from Employees
where city="Hyderabad"
order by salary desc
limit 4;

select emp_name,salary
from Employees
order by salary desc
limit 1;

-- distinct statements
select distinct department
from Employees;

select distinct city
from Employees;

select distinct salary
from Employees;

select distinct department,city
from Employees;

select distinct experience
from Employees;

-- comparision operators
select emp_name
from Employees
where salary>=80000;

select emp_name
from Employees
where experience<=3;

select emp_name
from Employees
where salary<>45000;

select emp_name
from Employees
where salary<50000;

select emp_name
from Employees
where experience >5;

-- logical operators
select emp_name
from Employees
where department="IT" and salary>70000;

select emp_name
from Employees
where city in ("Hyderabad","Bangalore");

select emp_name
from Employees
where department="HR" and experience<3;

select emp_name
from Employees
where salary>60000 or experience>6;

select emp_name
from Employees
where department!="Sales";

-- in and not in
select emp_name
from Employees
where city in ("Hyderabad","Mumbai");

select emp_name
from Employees
where department in ("IT","Finance");

select emp_name
from Employees
where city not in ("Chennai","Pune");

select emp_name
from Employees
where salary in (45000,75000,91000);

select emp_name
from Employees
where department not in ("HR","Sales");

-- between
select emp_name
from Employees
where salary between 50000 and 80000;

select emp_name
from Employees
where experience between 3 and 6;

select emp_name
from Employees
where emp_id between 105 and 112;

select emp_name
from Employees
where salary not between 40000 and 60000;

select emp_name
from Employees
where experience between 2 and 4;

-- like operators
select emp_name
from Employees
where emp_name like "R%";

select emp_name
from Employees
where emp_name like "%a";

select emp_name
from Employees
where emp_name like "%v%";

select emp_name
from Employees
where emp_name like "B%";

select emp_name
from Employees
where department like "%s";

