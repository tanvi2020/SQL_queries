--Problem Statement:
--How to convert a relational design into tables in SQL Server?
--Topics:
--In this project, you will work on converting a relational design that enlists various users, their roles, user accounts, and their statuses into different tables in SQL Server and insert
--data into them. Having at least two rows in each of the tables, you have to ensure that you
--have created respective foreign keys.
--Tasks to be performed:
--Define relations/attributes
--Define primary keys
--Create foreign keys 

--1) Insert data into each of the above tables. With at least two rows in each of the table, make sure, that you have created respective foreign keys.
--2) Delete all the data from each of the tables. 
create table [role](id int PRIMARY KEY, role_name varchar(100));

insert into [role] values(10,'Assitant');
insert into [role] values(20,'Clerk');
insert into [role] values(30,'Manager');
insert into [role] values(40,'Team Lead');
select * from [role];

create table [status](id int PRIMARY KEY,status_name varchar(100),is_user_working bit)
insert into [status] values(100,'Deployment',1);
insert into [status] values(102,'Initiated',1);
insert into [status] values(103,'Cancelled',0);
insert into [status] values(104,'Pending',0);
select * from [status];

create table user_account(id int PRIMARY KEY,username varchar(100),email varchar(254),[password] varchar(200),
password_salt varchar(50),password_hash_algorithm varchar(50));
insert into user_account values(1,'Ritesh Mali','ritesh123@gmail.com','RiTeSh@12','hjak12@12Q!','Bh2sNJ@HJ0');
insert into user_account values(2,'Spruha Joshi','spjoshi123@gmail.com','Spru@332','jjm52JX3@11!','RBsNJ@H23!');
insert into user_account values(3,'Vitendra Dutt','viten123@gmail.com','Viten1997@d','AnHg6783@d','ghFS!12@1');
insert into user_account values(4,'Bhavesh Shah','bhaveshah123@gmail.com','B002@bhs','h4HKf@d14Q','Khg!&HJ0');

select * from user_account;


create table user_has_role(id int PRIMARY KEY,role_start_time datetime,role_end_time datetime,
user_account_id int FOREIGN KEY REFERENCES user_account(id),role_id int FOREIGN KEY REFERENCES [role](id));
insert into user_has_role values(123,'12/3/2022','11/4/2022',1,10);
insert into user_has_role values(456,'10/6/2021','12/3/2022',2,30);

create table user_has_status(id int PRIMARY KEY,status_start_time datetime,status_end_time datetime,
user_account_id int FOREIGN KEY REFERENCES user_account(id),status_id int FOREIGN KEY REFERENCES [status](id));
insert into user_has_status(id,status_start_time,user_account_id,status_id) values(111,'01/01/2021','15/5/2022',1,101);
insert into user_has_status(id,status_start_time,user_account_id,status_id) values(111,'04/04/2022','16/10/2022',1,101);

truncate table [status];
select * from [status];
truncate table [role];
truncate table user_has_status;
truncate table user_has_roles;


