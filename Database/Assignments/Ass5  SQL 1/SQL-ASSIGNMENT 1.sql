use Company_SD;
go
--Data Manipulating Language:--

-- Question 1 --
insert into 
Employee(
Fname , Lname , SSN , Bdate , Address , Sex , Salary , Superssn , Dno)
values ('Ahmed' , 'Ali' ,102672 ,  '11/8/2002' , 'Mokattam City' , 'M' , 15000 , 112233 , 30);

-- Question 2 --
insert into 
Employee(
Fname , Lname , SSN , Bdate , Address , Sex  , Dno)
values ('Mohamed' , 'Abdelaal' ,102660 ,  '7/4/2002' , 'Maadi City' , 'M' , 30);

-- Question 3 --
insert into Departments 
values('DEPT IT' , 100 , 112233  , '1-11-2006')

-- Question 4 --
update Departments
set MGRSSN = 968574
where Dnum = 100

update Departments
set MGRSSN = 102672 
where Dnum = 20

update Employee
set Superssn = 102672
where SSN = 102660 

-- Question 5 --
delete from Dependent
where ESSN = 223344

update Works_for
set ESSN = 102660 , Hours = 0
where ESSN = 223344

update Departments
where MGRSSN = 223344
set MGRSSN = 102660 , [MGRStart Date] = ''


update Employee
set Superssn = 102660
where Superssn = 223344

update Employee 
set Dno = (Select Dno from Employee where SSN = 223344)
where SSN = 102660

update Employee 
set Salary = (Select Salary from Employee where SSN = 223344)
where SSN = 102660

delete from Employee
where SSN = 223344

-- Question 6 --

update Employee
set Salary = Salary + Salary * 0.2
where SSN = 102672


-- Try to create the following Queries: --
-- Question 1 --
select * from Employee

-- Question 2 --
select Fname , Lname , Salary , Dno
from Employee

-- Question 3 --
select Pname , Plocation , Dnum
from Project

-- Question 4 --
select SSN , Fname + ' ' + Lname as [Full Name], Salary * 0.1 as [ANNUAL COMM] 
from Employee

-- Question 5--
select SSN , Fname + ' ' + Lname as [Full Name]  , Salary
from Employee
where Salary > 1000

-- Question 6 --
select SSN , Fname + ' ' + Lname as [Full Name]  , Salary * 12 as [annually salary]
from Employee
where Salary * 12 > 10000

-- Question 7--
select Fname + ' ' + Lname as [Full Name]  , Salary 
from Employee
where Sex = 'F'

-- Question 8 --
select Dnum , Dname 
from Departments
where MGRSSN = 968574

-- Question 9 --
select Pnumber , Pname  , Plocation 
from Project
where Dnum = 10