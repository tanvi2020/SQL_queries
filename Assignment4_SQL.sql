--Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
select max(amount) as maxAMT,min(amount) as minAMT ,avg(amount)  as avgAMT from orders;


--Create a user-defined function, which will multiply the given number with 10
create FUNCTION demo(@value1 int)
RETURNS INT
AS
BEGIN 
RETURN (@value1*10)
END

select dbo.demo(6);


--Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print corresponding value
select 
CASE 
	when 100<200 then '100 is less than 200'
	when 100>200 then '100 is greater than 200'
ELSE
	'100 is equal to 200'
END
GO