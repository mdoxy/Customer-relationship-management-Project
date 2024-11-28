/* GROUP BY Clause
      - groups rows with the same values in specified columns into summary rows (e.g., total, average).
      - often used with COUNT(), SUM(), AVG().
      - must appear after WHERE and before ORDER BY.



Syntax : SELECT column1, aggregate_function(column2)
         FROM table_name
         GROUP BY column1;

*/