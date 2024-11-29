/* Stored Procedure
        - a stored procedure is a reusable set of SQL statements stored in the database to perform tasks like data manipulation or calculations.  
        - Supports input (`IN`), output (`OUT`), and input-output (`INOUT`) parameters.  
        - Precompiled for better performance.    
        - Can include control flow logic (`IF`, `LOOP`, etc.)
  
  
Syntax : DELIMITER $$

         CREATE PROCEDURE procedure_name (
         IN param1 datatype, 
         OUT param2 datatype, 
		 INOUT param3 datatype
         )
         BEGIN
             -- SQL statements
         END $$

         DELIMITER ;


*/


-- Display all the customer details 
DELIMITER $$
CREATE PROCEDURE get_uk_customers()
BEGIN
     select * from uk_customers;
END $$
DELIMITER ;

CALL get_uk_customers();



-- To find customers based on id
DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
     select *
     from uk_customers
     where customer_id = id;
END $$
DELIMITER $$

CALL find_customer(3);



-- Adding a New Customer
DELIMITER $$
CREATE PROCEDURE add_customer( 
    IN id INT,
    IN branch VARCHAR(10),
    IN f_name VARCHAR(255),
    IN l_name VARCHAR(255),
    IN email VARCHAR(255),
    IN phone VARCHAR(20),
    IN address TEXT,
    IN registration_date DATE
)
BEGIN
    -- Insert customer data
    INSERT INTO uk_customers (customer_id, branch_3, first_name, last_name, email, phone, address, registration_date)
    VALUES (id, branch, f_name, l_name, email, phone, address, registration_date);

    -- Output success message
    SELECT CONCAT('Customer added successfully with ID: ', id) AS Message;

END $$
DELIMITER ;

CALL add_customer(400, 'branch_3', 'Shreyas', 'More', 'shreyasmore@yahoo.com', 8644900445, 'Pune', '2019-02-17');





-- Updating sales and inventory simultaneously
DELIMITER $$
CREATE PROCEDURE Recordsale(
IN p_id INT,
IN s_id INT,
IN p_quantity INT)
BEGIN
     DECLARE v_quantity INT;
     
     select stock_quantity into v_quantity from uk_products where product_id = p_id;
     
     IF v_quantity < p_quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough quantity available';
	ELSE 
		Insert into uk_sales(product_id, sale_id, quantity)
        values (p_id, s_id, p_quantity);
	
        UPDATE uk_products 
        SET stock_quantity = stock_quantity - p_quantity 
        WHERE product_id = p_id;
	END IF;
END $$
DELIMITER ;

CALL Recordsale(1, 5553, 371);





--  Applying discounts based on a customer's purchase history or loyalty.
DELIMITER $$
CREATE PROCEDURE ApplyDiscount(
    IN p_customer_id INT, 
    IN p_sale_id INT
)
BEGIN
    DECLARE v_total_purchases DECIMAL(10, 2);
    DECLARE v_discount DECIMAL(10, 2);

    -- Calculate total purchases for the customer
    SELECT SUM(total_price) INTO v_total_purchases 
    FROM uk_sales 
    WHERE customerid = p_customer_id;

    -- Determine discount
    IF v_total_purchases > 5000 THEN
        SET v_discount = 0.1; -- 10% discount
        UPDATE uk_sales 
        SET discount = total_price * v_discount, 
            total_price = total_price - (total_price * v_discount)
        WHERE sale_id = p_sale_id;
    END IF;
END $$
DELIMITER ;

CALL ApplyDiscount(30,2);

 
     
 


     
     