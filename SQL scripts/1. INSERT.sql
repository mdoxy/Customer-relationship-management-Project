use crm;

/* Insert Statements */


/* Specifing both the column names and the values to be inserted */
INSERT INTO australia_1_customers(customer_id, branch_11, first_name, last_name, email, phone, address, registration_date)
VALUES (201, 'Branch_1', 'Mayuri', 'More', 'mayurimore@outlook.com', 8775342467, 'Arihant Garden, Pune', '2018-07-08');



/* without specifying column names */
INSERT INTO india_5_products VALUES(21, 'Branch_5','Basic Widget','Parts', 399, 197, 3.5);



/* inserting only specific columns */
INSERT INTO india_5_products (branch_52, name, category, price, stock_quantity, rating)
VALUES ('Branch_5','pREMIUM wIDGET','aCCESSORIES', 287.5, 17, 4.5);

INSERT INTO india_5_products (branch_52, name, category, stock_quantity, rating)
VALUES ('Branch_5','Widget','accessories', 17, 4.5);



/* inserting multiple values */
INSERT INTO uk_employees (employee_id, branch_333, name, email, position, salary, hire_date, manager_idd)
VALUES (31, 'branch_3', 'Jennifer Aniston', 'jenniferaniston@hotmail.com', 'Sales Representative', 76544, '2019-07-12',3),
(32, 'branch_3', 'Ron Harington', 'ronharrington@gmail.com', 'Customer Service Rep', 67880, '2018-11-07',3),
(33, 'branch_3', 'John Hopkins', 'JohnHopkins@hotmail.com', 'Marketing Specialist', 89000, '2019-02-03',3);







/* Use these insert statements wherever needed,
   these are just some of the examples */
