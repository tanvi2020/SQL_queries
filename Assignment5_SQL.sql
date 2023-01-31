--Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by amount DESC;

--Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’.
--Create another table with name ‘Employee_details2’,which comprises of same columns as first table.
create table Employee_details1(Emp_id int , Emp_name varchar(20), Emp_salary float)
insert into Employee_details1 values(101,'monica',25000);
insert into Employee_details1 values(102,'radhika',45600);
insert into Employee_details1 values(103,'aruna',37800);
insert into Employee_details1 values(104,'pallavi',26400);
insert into Employee_details1 values(105,'miraj',82300);
insert into Employee_details1 values(106,'vaibhav',32300);
insert into Employee_details1 values(107,'ruhan',56300);
insert into Employee_details1 values(108,'bhavesh',34000);

create table Employee_details2(Emp_id int , Emp_name varchar(20), Emp_salary float)
insert into Employee_details2 values(103,'aruna',37800);
insert into Employee_details2 values(106,'rajesh',32300);
insert into Employee_details2 values(109,'kiran',56300);
insert into Employee_details2 values(110,'yuv',56300);
insert into Employee_details2 values(104,'pallavi',26400);
insert into Employee_details2 values(111,'vivan',56300);
insert into Employee_details2 values(112,'sonali',56300);
insert into Employee_details1 values(107,'ruhan',56300);
insert into Employee_details2 values(105,'miraj',82300);

--Apply the union operator on these two tables
select Emp_id,Emp_name,Emp_salary from Employee_details1
UNION
select  Emp_id,Emp_name,Emp_salary from Employee_details2

select Emp_id,Emp_name,Emp_salary from Employee_details1
UNION ALL
select  Emp_id,Emp_name,Emp_salary from Employee_details2

--Apply the intersect operator on these two tables
select Emp_id,Emp_name,Emp_salary from Employee_details1
INTERSECT
select  Emp_id,Emp_name,Emp_salary from Employee_details2

--Apply the except operator on these two tables
select Emp_id,Emp_name,Emp_salary from Employee_details1
EXCEPT
select  Emp_id,Emp_name,Emp_salary from Employee_details2


