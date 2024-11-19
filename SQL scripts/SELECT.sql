/* SELECT statements 
   - The data returned is stored in a result table, called the result-set.


Syntax: SELECT column1, column2,....
        FROM table_name; 
        
        SELECT * FROM table_name;  --returns all entries

*/

select main_hq_id, contact_number from main_hq;                                                                              

select sub_hq_id, main_hq_id, region, established_year from sub_hqs;

select * from uae_employees;


/* 
   SELECT DISTINCT column1, column2, ...
   FROM table_name;
   -- to avoid duplicate values
   
*/

select DISTINCT customer_id, email, phone, address 
from india_5_customers;

select DISTINCT * from uk_customers;










/* 
   We've used these statements almost everytime to check results after alteration,
   these are just some examples. 
*/



