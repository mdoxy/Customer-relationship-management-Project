/* WHERE clause 
   -- extracts only those records that fulfill a specified condition.
   -- not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!
   -- texts need to be enclosed in quotes while numeric values doesn't need them 
   
   Syntax: SELECT column1, column2, ...
           FROM table_name
           WHERE condition;
*/


select first_name, last_name from australia_1_customers where customer_id = 32;

select product_id, name, price from india_5_products where category = 'Parts';

select * from uk_sales where product_name = 'Premium Widget';

select * from uk_sales where total_price > 500;

select customerid, product_name from uk_sales where quantity < 20;
