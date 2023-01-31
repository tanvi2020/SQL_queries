select * from customer;


--Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose
create view customer_san_jose 
AS
	select * from customer where city='San jose' ;

select * from customer_san_jose;

--2.	Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
---a.	Rollback the transaction
---b.	Set the first name of customer to Alex, where the last name is Jordan

begin transaction 
	update customer set first_name ='Fransis' where last_name='Jordan';
	ROLLBACK TRANSACTION 
	update customer set  first_name='Alex' where last_name='Jordan';


--Inside a try catch block, divide 100 with 0, print the default error message

begin try 
	declare @var1 int,@var2 int
	set @var1=100
	set @var2=@var1/0
end try
begin catch 
	print error_message()
end catch






