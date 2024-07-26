use Company_SD;
go


-- Assignment 3 --
-- Q1 --

select e.Fname + ' ' + e.Lname as employee_Full_Name , e.Sex employee_sex, d.Dependent_name , d.Sex as Dependent_sex
from Employee e join Dependent d
on e.SSN = d.ESSN
where  d.Sex = 'F' and e.sex = 'F'

union 

select e.Fname + ' ' + e.Lname as employee_Full_Name , e.Sex employee_sex, d.Dependent_name , d.Sex as Dependent_sex
from Employee e join Dependent d
on e.SSN = d.ESSN
where  d.Sex = 'M' and e.sex = 'M'

-- Q2 -- Works_for --> project 
select Pnumber as Project_Number, Pname as Project_Name, sum(hours) as Total_Hours
from Works_for w join Project p
on w.Pno = p.Pnumber
group by Pnumber , Pname

-- Q3 -- employee --> department

select top 1 d.*
from Employee e join Departments d 
on d.Dnum = e.Dno
order by e.SSN 

-- Q4 -- employee --> department
select  Dnum , Dname, min(e.Salary) as min_salary ,max(e.Salary) as max_salary ,  avg(e.Salary) as avg_salary
from Employee e join Departments d 
on d.Dnum = e.Dno
group by Dnum , Dname

-- Q5 -- departments --> dependent --> employee
select e.*
from Departments d left outer join Dependent dp
on d.MGRSSN = dp.ESSN join Employee e 
on d.MGRSSN = e.SSN
where dp.ESSN is null 

-- Q6 -- department --> employee --> employee
select Dnum , Dname , AVG(salary) as Avg_Depart_Salary 
from 
Departments d join Employee e 
on d.Dnum = e.Dno
group by Dnum , Dname
having avg(Salary) < (
select avg(Salary) 
from 
Employee e2 where e2.Dno is not null  
)

-- Q7 -- employee --> works_for --> project

select e.Fname + ' ' + e.Lname  as Full_Name , e.SSN as Employee_SSN , e.Dno as employee_department,
p.Pname as Project_Name , p.Plocation as Project_location , p.City as Project_city , p.Dnum as Project_department 
from Employee e join Works_for w
on e.SSN = w.ESSn join Project p
on w.Pno = p.Pnumber
order by p.Dnum ,  e.Lname , e.Fname 

-- Q8 --
select Salary 
from Employee 
where Salary in (
select top 2 Salary
from Employee
order by Salary desc
)
-- Q9 -- employee -- dependant 
select e.Fname + ' ' + e.Lname as employee_name , d.*
from Employee e join Dependent d
on e.SSN = d.ESSN
where d.Dependent_name like '%' + e.Fname + ' ' + e.Lname + '%'

-- Q 10 -- employee --> works_for --> project 
 
update Employee
set Salary = Salary + Salary * 0.3
from Employee e join Works_for w
on e.SSN = w.ESSn join Project p 
on p.Pnumber = w.Pno
where Pname = 'Al Rabwah'

-- Q 11 --
select e.SSN , e.Fname + ' ' + e.Lname as employee_name 
from Employee e 
where exists (select * from Dependent d where e.SSN = d.ESSN)