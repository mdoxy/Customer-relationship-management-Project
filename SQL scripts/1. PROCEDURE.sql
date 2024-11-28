/*standard widget parts id = 1, price = 918.58, quantity = 378, sale_id = 6*/
-- A stored procedure is a prepared sql code that you can save (great if there's a query that you write often)

DROP PROCEDURE Recordsale;
DELIMITER $$
CREATE PROCEDURE get_uk_customers()
BEGIN
     select * from uk_customers;
END $$
DELIMITER ;

CALL get_uk_customers();

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


     
 


     
     