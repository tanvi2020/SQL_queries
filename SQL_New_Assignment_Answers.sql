create table Employee_Table(Employee_id int NOT NULL PRIMARY KEY, 
First_name varchar(20),
Last_name varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20));

select * from Employee_Table
insert into Employee_Table values(1,'Anika','Arora',100000,'2022-12-24 10:00:00','HR');
insert into Employee_Table values(2,'Veena','Verma',80000,'2021-6-1 10:00:00','Admin');
insert into Employee_Table values(3,'Vishal','Singhal',300000,'2020-2-14 10:00:00','HR');
insert into Employee_Table values(4,'Sushant','Singh',500000,'2022-11-25 10:00:00','Admin');
insert into Employee_Table values(5,'Bhupal','Bhati',500000,'2022-4-4 10:00:00','Admin');
insert into Employee_Table values(6,'Priya','Diwan',200000,'2021-10-24 10:00:00','Account');
insert into Employee_Table values(7,'Vivek','Kumar',75000,'2020-11-20 10:00:00','Account');
insert into Employee_Table values(8,'Ganesh','Chauhan',90000,'2021-9-13 10:00:00','Admin');
insert into Employee_Table values(9,'Karan','Tiwari',50000,'2022-9-13 10:00:00','Admin');


create table Employee_bonus (Employee_ref_id int FOREIGN KEY REFERENCES Employee_Table(Employee_id),
Bonus_amount int ,
Bonus_date datetime
)
select * from Employee_bonus;
insert into Employee_bonus values(1,5000,'2022-12-25');
insert into Employee_bonus values(2,3000,'2020-02-16');
insert into Employee_bonus values(3,4000,'2020-08-15');
insert into Employee_bonus values(1,4500,'2020-12-30');
insert into Employee_bonus values(2,3500,'2020-06-23');

create table Employee_title(Employee_ref_id int FOREIGN KEY REFERENCES Employee_Table(Employee_id),
Employee_title varchar(20),
Affective_date datetime
);
insert into Employee_title values(1,'Manager','2022-06-23');
insert into Employee_title values(2,'Executive','2019-05-22');
insert into Employee_title values(8,'Executive','2014-07-13');
insert into Employee_title values(5,'Manager','2022-04-11');
insert into Employee_title values(4,'Asst. Manager','2020-09-16');
insert into Employee_title values(7,'Executive','2011-08-14');
insert into Employee_title values(6,'Lead','2020-07-24');
insert into Employee_title values(3,'Lead','2021-07-03');

select * from Employee_title;

-- Display the “FIRST_NAME” from Employee table using the alias name as Employee_name
select First_name as Employee_name from Employee_Table;

--Display “LAST_NAME” from Employee table in upper case.
select UPPER(Last_name) as Upper_lastname from Employee_Table;

-- Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct Department from Employee_Table;

--Display the first three characters of LAST_NAME from EMPLOYEE table
select substring(Last_name,1,3) as Substr from Employee_Table;

--Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select distinct Department as DEPT ,len(Department) as LenDept from Employee_Table;

--Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. 
--a space char should separate them.
select First_name+' '+Last_name as Full_name from Employee_Table;

-- DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.select * from Employee_Table order by First_name ;
--Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Employee_Table order by First_name ASC ,Department DESC ;

--Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table
select * from Employee_Table where First_name='Veena';
select * from Employee_Table where First_name='Karan';

--Display details of EMPLOYEE with DEPARTMENT name as “Admin”
select * from Employee_Table where Department='Admin';

--DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select * from Employee_Table where First_name like 'V%';

--DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000
select * from Employee_Table where Salary between 100000 and 500000;

--Display details of the employees who have joined in Feb-2020.
select * from Employee_Table where DATEPART(MONTH,Joining_date)='02'and DATEPART(YEAR,JOining_date)='2020';

--Display employee names with salaries >= 50000 and <= 100000.
select First_name+' '+Last_name as Full_Name from Employee_Table where Salary>=50000 and Salary<=100000;

-- Display details of the EMPLOYEES who are also Managers.
select Employee_table.* from Employee_Table 
Left Join
Employee_title 
On Employee_Table.Employee_id=Employee_title.Employee_ref_id
where Employee_title='Manager';

-- DISPLAY duplicate records having matching data in some fields of a table.
Select * From Employee_Bonus
Where Bonus_amount in
(Select Bonus_amount From Employee_bonus Group by Bonus_amount Having
Count(Bonus_amount) > 1)


-- Display only odd rows from a table
select Employee_id,First_name,Last_name, Salary,Department from Employee_Table where Employee_id%2 !=0;

--Clone a new table from EMPLOYEE table. 
select * into clone_table from Employee_Table ;
select * from clone_table;

--DISPLAY the TOP 2 highest salary from a table.
select distinct TOP 2 Salary from Employee_Table order by Salary DESC;

--DISPLAY the list of employees with the same salary
select * from Employee_Table
Select * From Employee_Table
Where Salary in
(Select Salary From Employee_Table Group by Salary Having
Count(Salary ) > 1)

--Display the second highest salary from a table
select MAX(Salary) as Salary 
FROM Employee_Table 
WHERE salary <>(SELECT MAX(salary) 
FROM Employee_Table);

--Display the first 50% records from a table.
select top 50 percent * from Employee_Table;

--Display the departments that have less than 4 people in it.
select TOP 1 Department, COUNT(*) AS MIN_NO_OF_EMPLOYEES
from Employee_Table
group by Department
order by COUNT(*);

--Display all departments along with the number of people in there.
select Department,Count(*) 
from Employee_Table
group by Department
order by Count(*);

-- Display the name of employees having the highest salary in each department
select Department, MAX(Salary) AS max_sal
from Employee_Table
group by Department
order by  MAX(Salary) DESC;

-- Display the names of employees who earn the highest salary.
select First_name,Last_name,Department from Employee_Table
where Salary in
(select MAX(Salary) from Employee_Table group by Department);

-- Diplay the average salaries for each department
select Department, AVG(Salary) as AVG_sal
from Employee_Table
group by Department
Order by AVG(Salary);

--display the name of the employee who has got maximum bonus
select Employee_Table.First_name,Employee_Table.Last_name, Employee_bonus.Bonus_amount from Employee_Table
Join
Employee_bonus On 
Employee_Table.Employee_id= Employee_bonus.Employee_ref_id
where Bonus_amount in
(select MAX(Bonus_amount) from Employee_bonus group by Employee_ref_id);

--Display the first name and title of all the employees
select Employee_table.First_name,Employee_title.Employee_title from Employee_Table
Join
Employee_title on
Employee_Table.Employee_id=Employee_title.Employee_ref_id;
