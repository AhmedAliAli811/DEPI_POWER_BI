CREATE TABLE IF NOT EXISTS emp
(
    EMPNO integer,
    ENAME "varchar",
    JOB "varchar",
    DeptNo integer,
    HIREDATE date,
    SAL numeric
)
;
insert into  emp VALUES (7369 , 'SMITH', 'CLERK',1,'17-DEC-80',800);
insert into  emp VALUES (7499 , 'ALLEN' , 'SALESMAN',2,'20-FEB-81',1600);
insert into  emp VALUES (7521 , 'WARD' , 'SALESMAN',2,'22-FEB-81',1250);
insert into  emp VALUES (7566 , 'JONES' , 'MANAGER',3,'02-APR-81',2975);
insert into  emp VALUES (7654 , 'MARTIN' , 'SALESMAN',2,'28-SEP-81',1250);
insert into  emp VALUES (7698 , 'BLAKE' , 'MANAGER',3,'01-MAY-81',2850);
insert into  emp VALUES (7782 , 'CLARK' , 'MANAGER',3,'09-JUN-81',2450);
insert into  emp VALUES (7788 , 'SCOTT' , 'ANALYST',4,'19-APR-87',3000);
insert into  emp VALUES (7839 , 'KING' , 'PRESIDENT',0,'17-NOV-81',5000);
insert into  emp VALUES (7844 , 'TURNER' , 'SALESMAN',2,'08-SEP-81',1500);
insert into  emp VALUES (7876 , 'ADAMS' , 'CLERK',1,'23-MAY-87',1100);