use demo

--Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table orders(order_id int, order_date date, amount float, customer_id int);
insert into orders values(10,'2022/12/1',500,1);
insert into orders values(20,'2022/12/2',100,2);
insert into orders values(30,'2022/12/3',790,3);
insert into orders values(40,'2022/12/1',250,4);
insert into orders values(50,'2022/12/6',400,5);
insert into orders values(60,'2022/12/5',360,2);
insert into orders values(70,'2022/12/6',500,4);
insert into orders values(80,'2022/12/9',850,6);
insert into orders values(90,'2022/12/10',550,7);
insert into orders values(100,'2022/12/1',500,1);

select * from orders;
select * from customer;

--Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select customer.customer_id , orders.customer_id from customer inner join orders on customer.customer_id = orders.customer_id;

--Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
select customer.first_name , orders.amount from customer left join orders on customer.customer_id=orders.customer_id;
select customer.last_name , orders.* from customer right join orders on customer.customer_id=orders.order_id;

--Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
update orders set amount=100 where customer_id=3;





--

