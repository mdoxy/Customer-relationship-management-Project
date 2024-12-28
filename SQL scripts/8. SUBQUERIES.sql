/* Subqueries (SELECT Within SELECT)
     - a query nested inside another query.
     - can be used in SELECT, FROM, or WHERE clauses.
     - must return a single value for comparisons.



Syntax : SELECT column
         FROM table
         WHERE column = (SELECT column FROM another_table WHERE condition);
         
*/
