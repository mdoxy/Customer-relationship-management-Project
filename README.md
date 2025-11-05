The Customer Relationship Management (CRM) system is a structured SQL-based project designed to manage customer, sales, employee, and product information across multiple international branches.
This project demonstrates relational database design, query optimization, and data management through real-world CRM operations.

Project Objective

To build a centralized database that enables efficient management of customer relationships, sales records, and employee data across global branches while maintaining data integrity and supporting analytical queries for business insights.

Database Structure

The database is organized hierarchically to reflect a multinational company setup with five branches:
India, USA, UK, Australia, and UAE.

Each branch includes the following tables:

customers

employees

sales

products

admin

sub_hq

main_hq

Key Features

Relational design with primary, foreign, and composite keys for data integrity.

Implementation of CRUD operations (Insert, Update, Delete, Select).

Multi-table joins and subqueries for analytical reporting.

Use of aggregate functions (SUM, COUNT, AVG) for business insights.

User-level access and admin role for data security.

Independent branch control with linkage to main headquarters.

Analytical queries for top customers, sales regions, and performance metrics.

Example SQL Queries
-- Retrieve top 5 customers by total purchase amount
SELECT customer_name, SUM(total_amount) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Find total sales by branch
SELECT branch_name, SUM(sales_amount) AS branch_sales
FROM sales
GROUP BY branch_name;

-- Identify employees with highest sales
SELECT e.employee_name, SUM(s.sales_amount) AS total_sales
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
GROUP BY e.employee_name
ORDER BY total_sales DESC;

Concepts Covered

Database Design and Normalization

Entity-Relationship (ER) Modeling

SQL Joins, Subqueries, and Aggregations

Data Integrity and Referential Constraints

Query Optimization

Hierarchical Database Relationships

Tools and Technologies

Database: MySQL

GUI Tools: MySQL Workbench, phpMyAdmin

Version Control: Git and GitHub

Future Enhancements

Integration with Python Flask or Node.js backend for web interface.

Implementation of stored procedures and triggers for automation.

Addition of data visualization dashboards using Power BI or Tableau.

Author

Mayuri More
Final Year Computer Engineering Student
Passionate about Data Engineering, SQL, and Web Technologies
GitHub: https://github.com/mdoxy

LinkedIn: https://www.linkedin.com/in/mayuri-more

Outcome

This project demonstrates the ability to design, implement, and manage a scalable SQL database for a real-world CRM environment, showcasing strong foundations in database management, data analytics, and system architecture.
