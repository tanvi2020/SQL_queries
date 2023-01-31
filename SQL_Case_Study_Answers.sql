create table Locations(Location_id int NOT NULL PRIMARY KEY, City varchar(15));
insert into Locations values(122,'New York');
insert into Locations values(123,'Dallas');
insert into Locations values(124,'Chicago');
insert into Locations values(167,'Boston');

select * from Locations;

create table Department(department_id int NOT NULL PRIMARY KEY,
dept_name varchar(20),
Location_id int FOREIGN KEY REFERENCES Locations(Location_id)
);
insert into Department values(10,'Accounting',122);
insert into Department values(20,'Sales',124);
insert into Department values(30,'Research',123);
insert into Department values(40,'Operations',167);

select * from Department;

create table JOB(Job_ID int NOT NULL PRIMARY KEY,Designation varchar(20));
insert into JOB values(667,'Clerk');
insert into JOB values(668,'Staff');
insert into JOB values(669,'Analyst');
insert into JOB values(670,'SalesPerson');
insert into JOB values(671,'Manager');
insert into JOB values(672,'President');
select * from JOB;



create table Manager(Manager_id int NOT NULL PRIMARY KEY , First_name varchar(10), Last_name varchar(10), Manager_salary int);
insert into Manager values(7902,'Pravin','Joshi',5000);
insert into Manager values(7698,'Nidhi','Pathak',3500);
insert into Manager values(7839,'Rima','Roy',1500);
insert into Manager values(7736,'Niraj','Rathod',4000);
insert into Manager values(7823,'Kaushal','Sapre',3300);

create table SalGrade(grade char(1),Salary int, Employee_id int FOREIGN KEY REFERENCES  EMPLOYEE(Employee_id));
insert into SalGrade values('C',800,7369);
insert into SalGrade values('B',1600,7499);
insert into SalGrade values('A',2850,7505);
insert into SalGrade values('A',2750,7506);
insert into SalGrade values('B',2200,7507);
insert into SalGrade values('C',1250,7521);

create table EMPLOYEE(Employee_id int NOT NULL PRIMARY KEY,First_name varchar(10), Last_name varchar(10), Middle_name varchar(10),
Job_ID int FOREIGN KEY REFERENCES JOB(Job_ID),Manager_id int FOREIGN KEY  REFERENCES Manager(Manager_id)
, Hire_date date,Salary int , Comm int ,
Department_id int FOREIGN KEY REFERENCES Department(department_id));



insert into EMPLOYEE values(7369,'Smith','John','Q',667,7902,'17-Dec-84',800,NULL,20);
insert into EMPLOYEE values(7499,'Allen','Kevin','J',670,7698,'20-Feb-85',1600,300,30);
insert into EMPLOYEE values(7505,'Doyle','Jean','K',671,7839,'04-APR-85',2850,NULL,30);
insert into EMPLOYEE values(7506,'Dennis','Lynn','S',671,7839,'15-MAY-85',2750,NULL,30);
insert into EMPLOYEE values(7507,'Baker','Lislie','D',671,7839,'10-JUN-85',2200,NULL,40);
insert into EMPLOYEE values(7521,'Wark','Cynthia','D',670,7698,'22-Feb-85',1250,500,30);


--LIST ALL THE EMPLOYEE DETAILS.
select * from EMPLOYEE;

--LIST ALL THE DEPARTMENT DETAILS
select * from Department;

--LIST ALL JOB DETAILS.
select * from JOB;

--LIST ALL THE LOCATIONS
select * from Locations;

--LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.
select First_name,Last_name,Salary,Comm from EMPLOYEE;

--LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
--EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE",
--DEPARTMENTID AS "DEP_ID"
select Employee_id as ID_of_the_Employee, Last_name as Name_of_the_employee ,Department_id as DEP_ID from EMPLOYEE ;

--LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.select First_name,Salary as Annual_salary from EMPLOYEE;--LIST THE DETAILS ABOUT "SMITH"select * from EMPLOYEE where First_name='Smith';--LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20select First_name,Last_name,Department_id from EMPLOYEE where Department_id=20;--LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.select * from EMPLOYEE where Salary Between 3000 and 4500;--LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select * from EMPLOYEE where Department_id=10 or Department_id=30;

--FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
select * from EMPLOYEE where not Department_id=30 or Department_id=10;

--LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
select * from EMPLOYEE where First_name like 'S%';

--LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'
Select * from EMPLOYEE where First_name like 'S%H';

--LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'
select * from EMPLOYEE where First_name LIKE 'S____' ;

--LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500.
select First_name,Last_name,Salary from EMPLOYEE where Department_id=10 and Salary>3500;

--LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION
select * from EMPLOYEE where Comm is NULL;

--LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
select Employee_id , Last_name from EMPLOYEE order by Employee_id ASC;

--LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
select Employee_id , First_name+' '+Last_name as Ename from EMPLOYEE order by Salary DESC;

--LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
select * from EMPLOYEE order by Last_name ;

--LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER
select * from EMPLOYEE order by Last_name ASC ;
select * from EMPLOYEE order by Department_id DESC;

--HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION
select count(Employee_id) as Count_of_employees_in_Department ,Department_id from EMPLOYEE group by Department_id;

--LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
select max(Salary)as Max_sal,min(Salary)as Min_sal,avg(Salary) as AVG_sal from EMPLOYEE group by Department_id;

--LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.select max(Salary)as Max_sal,min(Salary)as Min_sal,avg(Salary)as AVG_sal ,Job_ID from EMPLOYEE group by Job_ID;

--LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER
Select count(*) as Number_of_EMP ,Datename(Month,Hire_date) Months from EMPLOYEE
group by (hire_date) order by month(Hire_date);

select * from EMPLOYEE

--LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
 select DATENAME(Month,Hire_date)Month ,DATENAME(Year,Hire_date)Year ,count(*) as Number_of_EMP from EMPLOYEE
 group by  DATENAME(Month,Hire_date),DATENAME(Year,Hire_date) order by year,month;

 --LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
 select count(Employee_id) as EMP_count , Department_id from EMPLOYEE group by Department_id having count(Employee_id)>=4;

 --HOW MANY EMPLOYEES JOINED IN JANUARY MONTH
 select count(*),Datename(Month,Hire_date) from EMPLOYEE group by Datename(Month,Hire_date) having Datename(Month,Hire_date)='Jan';

--HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
select count(*),datename(month,Hire_date) from EMPLOYEE group by Datename(month,Hire_date) 
having Datename(Month,Hire_date)='Jan' or Datename(Month,Hire_date)='Sep';

--HOW MANY EMPLOYEES WERE JOINED IN 1985?
select count(*),datename(Year,Hire_date) from EMPLOYEE group by datename(YEAR,Hire_date) having datename(year,Hire_date)='1985';

--HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
select count(*),datename(month,Hire_date),datename(year,Hire_date) from EMPLOYEE 
group by datename(month,Hire_date), datename(year,Hire_date) 
having datename(year,Hire_date)='1985';

--HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select count(*),datename(month,Hire_date),datename(year,Hire_date) from EMPLOYEE
where  datename(month,Hire_date)='March'and datename(year,Hire_date)='1985'
group by datename(month,Hire_date),datename(year,Hire_date)

--WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
select count(*),Department_id , datename(month,Hire_date),datename(year,Hire_date) from EMPLOYEE
where datename(month,Hire_date)='APR' and datename(year,Hire_date)='1985'
group by Department_id,datename(month,Hire_date),datename(year,Hire_date)
having count(*)>=3;

--LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES
select EMPLOYEE.Employee_id, EMPLOYEE.First_name,EMPLOYEE.Last_name, Department.Dept_name
from EMPLOYEE
JOIN
Department ON 
Employee.Department_id=Department.department_id;

--DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.select EMPLOYEE.Employee_id,EMPLOYEE.First_name,EMPLOYEE.Last_name, JOB.Designation from EMPLOYEEJOINJOB ON EMPLOYEE.Job_ID=JOB.Job_ID;--DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPSselect * from EMPLOYEE;select * from Department;select EMPLOYEE.Employee_id,EMPLOYEE.First_name,EMPLOYEE.Last_name, Department.dept_name,Department.Location_idFROM EMPLOYEEJOINDepartment ON EMPLOYEE.Department_id=Department.department_id;--HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMESselect count (*),Department.dept_namefrom EMPLOYEE JOIN Department On EMPLOYEE.Department_id=Department.department_id group by Department.dept_name;--HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select * from EMPLOYEE;
select * from Department;

select count(*) as EMP_count from EMPLOYEE 
JOIN 
Department On 
EMPLOYEE.Department_id=Department.department_id
where Department.dept_name='Sales';

--WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
select count(*),Department.dept_name from EMPLOYEE
JOIN Department
On EMPLOYEE.Department_id=Department.department_id
group by Department.dept_name 
having count(*)>=5
order by Department.dept_name;

--HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
select * from EMPLOYEE;
select * from JOB;

select count(*),JOB.Designation from EMPLOYEE
JOIN
JOB on EMPLOYEE.Job_ID=JOB.Job_ID
group by JOB.Designation;

--HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select * from EMPLOYEE;
select * from Locations;
select * from Department;
select count(*) from EMPLOYEE
where Department_id in( select Department_id from Department where Location_id in (select Location_id from Locations
where City='New York'))


--DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
select EMPLOYEE.Employee_id , EMPLOYEE.First_name,EMPLOYEE.Last_name ,EMPLOYEE.Salary, SalGrade.Grade 
from EMPLOYEE
JOIN 
SalGrade
on EMPLOYEE.Employee_id = SalGrade.Employee_id;

--LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
select count(*) as Number_of_Employees, SalGrade.Grade 
from EMPLOYEE
JOIN 
SalGrade
on EMPLOYEE.Employee_id = SalGrade.Employee_id
group by SalGrade.grade;


--DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.select count(*) as Number_of_EMP_Between_Range_2000_to_5000,SalGrade.grade from EMPLOYEEJOINSalGrade ONEMPLOYEE.Employee_id=SalGrade.Employee_idwhere EMPLOYEE.Salary between 2000 and 5000group by SalGrade.grade --DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
select * from EMPLOYEE;
Select * from Manager;

select EMPLOYEE.* , Manager.First_name+' '+Manager.Last_name as Manager_name
from EMPLOYEE
JOIN
Manager ON
EMPLOYEE.Manager_id=Manager.Manager_id;


--DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
select EMPLOYEE.* 
FROM EMPLOYEE
JOIN 
Manager ON
EMPLOYEE.Manager_id=Manager.Manager_id
where EMPLOYEE.Salary>Manager.Manager_salary;


--SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.
select count(*) as No_of_EMP, Manager.Manager_id
from EMPLOYEE
JOIN
Manager ON
EMPLOYEE.Manager_id=Manager.Manager_id
Group by Manager.Manager_id;

--DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
select EMPLOYEE.*, Manager.First_name+' '+Manager.Last_name as Manager_name
from EMPLOYEE
JOIN
Manager On
EMPLOYEE.Manager_id=Manager.Manager_id;


--DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTSselect * from Department;select * from EMPLOYEE;select EMPLOYEE.Employee_id , EMPLOYEE.First_name+' '+EMPLOYEE.Last_name as Employee_names, Department.dept_namefrom EMPLOYEEJoinDepartment ONEMPLOYEE.Department_id=Department.department_idwhere Department.dept_name='Sales' or Department.dept_name='Operations';--LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTSselect * from JOB;select * from Department;select * from EMPLOYEE;select * from JOB where Job_ID in(select Job_ID from employee 
where Department_id in(select Department_id from Department where dept_name='Sales'))
UNION 
select * from JOB 
where Job_ID in(select Job_ID from EMPLOYEE where Department_id in(select Department_id from Department where
dept_name='Accounting'))


--LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select * from JOB where Job_ID in(select Job_ID from employee 
where Department_id in(select Department_id from Department where dept_name='Sales'))
UNION ALL
select * from JOB 
where Job_ID in(select Job_ID from EMPLOYEE where Department_id in(select Department_id from Department where
dept_name='Accounting'))


--LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.select * from JOB where Job_ID in(select Job_ID from employee 
where Department_id in(select Department_id from Department where dept_name='Research'))
INTERSECT 
select * from JOB 
where Job_ID in(select Job_ID from EMPLOYEE where Department_id in(select Department_id from Department where
dept_name='Accounting'))

--Display the employee who got the maximum salary
select * from EMPLOYEE 
where Salary=(select max(Salary) from EMPLOYEE);

--Display the employees who are working in Sales department
select* from EMPLOYEE 
where Department_id in(select department_id from Department where dept_name='Sales');

--DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select * from EMPLOYEE where Job_ID in (Select Job_ID from JOB where Designation = 'Clerk');

--DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
Select * from EMPLOYEE where Department_id=(select department_id from Department where Location_id=(select Location_id from Locations where City='New York'));

--FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
select * from EMPLOYEE where Department_id = (select department_id from Department where dept_name = 'Sales');

--UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
update EMPLOYEE set Salary = (Salary + Salary*10/100) where Job_ID = (select Job_ID from JOB where Designation = 'Clerk');

--DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
delete from EMPLOYEE where Department_id=(select department_id from Department where dept_name='Accounting');

--DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
 Select * from EMPLOYEE where Salary=(select max(Salary) from EMPLOYEE where Salary <(select max(Salary) from EMPLOYEE));

--DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
Select * from EMPLOYEE e1
where 0 = (select count(distinct Salary) from EMPLOYEE e2 where e2.Salary > e1.Salary);

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Locations;
SELECT * FROM JOB;

--LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
 Select * from EMPLOYEE where Salary > all (Select Salary from EMPLOYEE where Department_id=30);

--LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
Select * from EMPLOYEE where Salary > any (Select Salary from EMPLOYEE where Department_id=30);

--FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select department_id from Department d 
 where not exists (select Department_id from EMPLOYEE e where d.department_id = e.Department_id);

--FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
Select dept_name from Department d where not exists (select Last_name from EMPLOYEE e where d.department_id=e.Department_id);

--FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT
Select * from EMPLOYEE e where Salary > (select avg(Salary) from EMPLOYEE where Department_id=e.Department_id);
Select Employee_id, Last_name, Salary, Department_id from EMPLOYEE e where Salary > (select avg(Salary) 
from EMPLOYEE where Department_id=e.Department_id);




select * from EMPLOYEE;
select * from Locations;
select * from JOB;
select * from Department;
select * from Manager;
select * from SalGrade;