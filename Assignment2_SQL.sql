use demo

--Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’,
--‘address’, ‘city’,’state’,’zip’
create table customer(customer_id int, first_name varchar(30), 
last_name varchar(30), email varchar(50), address varchar(40),
city varchar(30), states varchar(25) ,zip int );

--Insert 5 new records into the table
insert into customer values(1,'Tanvi','Ranganekar','tanvi123@gmail.com','ravet','pune','maharashtra',411044);
insert into customer values(2,'Sam','Smith','smith556@gmail.com','bandra','mumbai','maharashtra',44400);
insert into customer values(3,'Ravi','Kumar','ravik903@gmail.com','pimpri','pune','maharashtra',411048);
insert into customer values(4,'Megha','Singh','meghasingh@gmail.com','wakad','pune','maharashtra',45114);
insert into customer values(5,'Garima','rathod','garima123@gmail.com','xyz','San jose','California',411089);
insert into customer values(7,'Evan','Joseph','evan123@gmail.com','tower1,abc','San jose','California',1556);
insert into customer values(8,'Egor','Ille','egor123@gmail.com','tower2,abc','San jose','California',1346);
insert into customer values(9,'manoj','kumar','menju@gmail.com','tower3,abc','San jose','California',1543);
insert into customer values(10,'bhuven','yadav','bhuv23@gmail.com','tower4,abc','San jose','California',1892);
insert into customer values(11,'Jonathan','Jordan','Franj12@gmail.com','tower5,abc','San jose','California',1322);



--Select only the ‘first_name’ & ‘last_name’ columns from the customer table
select first_name , last_name from customer;

--Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select * from customer where first_name like 'G%' and city = 'san jose';

