/* HAVING Clause
     - used to filter grouped records created by the GROUP BY clause based on a condition.
	 - diff from WHERE: WHERE filters rows before grouping, whereas HAVING filters groups after grouping.
     - It must be used with GROUP BY, allows conditions on aggregate functions like SUM, COUNT, AVG, etc.
     
     
Syntax : SELECT column1, aggregate_function(column2), ...
         FROM table_name
         GROUP BY column1
         HAVING condition;
         
*/

