use Company_SD;
go

-- Assignment 2 --

-- Q1 --
select d.Dname as depart_name, d.Dnum as depart_Number , d.MGRSSN , e.Fname + ' ' + e.Lname as Manager_name
from Departments d join Employee e 
on d.MGRSSN = e.SSN

-- Q2 --
select d.Dname as Department_name , p.Pname as project_name
from Departments d join Project p
on p.Dnum = d.Dnum

-- Q3 --
select e.Fname + ' ' + e.Lname as Full_name , d.* 
from Dependent d join Employee e
on e.SSN = d.ESSN

-- Q4 --
select *
from Project p
where p.City = 'cairo' or p.City = 'alex'

-- Q5 --
select *
from Project p
where p.Pname like 'a%'

-- Q6 --
select *
from Employee e
where e.Dno = 30 AND e.Salary between 1000 and 2000;

-- Q7 --
select e.Fname + ' ' + e.Lname as Full_name 
from Employee e join Works_for w 
on e.SSN = w.ESSn and e.Dno = 10
join Project p
on p.Pnumber = w.Pno
where p.Pname = 'AL Rabwah'

-- Q8 --
select *
from Employee e join Employee s
on e.Superssn = s.SSN
where s.Fname + ' ' + s.Lname = 'Kamel Mohamed'

-- Q9 --
select e.Fname + ' ' + e.Lname as employee_name , p.Pname as project_name
from Employee e join Works_for w
on e.SSN = w.ESSn join Project p 
on p.Pnumber = w.Pno
order by p.Pname

-- Q10 --
select p.Pnumber , p.Pname , d.Dname , e.Lname , e.Address , e.Bdate
from Project p join Departments d 
on p.Dnum = d.Dnum and p.City = 'cairo'
join Employee e on e.SSN = d.MGRSSN 

-- Q11 --
select e.*
from Departments d join Employee e
on d.MGRSSN = e.SSN

-- Q12 --
select *
from Employee e left join Dependent d 
on e.SSN = d.ESSN