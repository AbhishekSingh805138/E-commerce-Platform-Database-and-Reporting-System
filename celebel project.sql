CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2),
  category VARCHAR(100)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255),
  email VARCHAR(100),
  phone VARCHAR(20)
);

/*1.Database Design:
Below is a sample SQL code for creating tables to store information about products, customers, orders, payments, and shipping details:
*/
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATE,
  amount DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

CREATE TABLE shipping_details (
  shipping_id INT PRIMARY KEY,
  order_id INT,
  address VARCHAR(255),
  city VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(20),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
/*2.Data Population:
Populate the database with realistic sample data for products, customers, orders, payments, and shipping details.*/
INSERT INTO products (product_id, product_name, price, category)
VALUES (1, 'bulb', 19.9, 'Electronics'),
       (2, 'clothes', 20.1, 'Fashion');
      

INSERT INTO customers (customer_id, customer_name, email, phone)
VALUES (1, 'abhi', 'abhi@gmail.com', '6203430305'),
       (2, 'vars', 'vars@gmail.com', '9876543210');
INSERT INTO orders(order_id,customer_id,order_date,total_amount)
VALUES(12,1,'1999-04-14',19.9);

INSERT INTO payments(payment_id,order_id ,payment_date ,amount )
VALUES(123,12,'1999-04-14',19.9);

INSERT INTO shipping_details(shipping_id,order_id,address,city)
VALUES (1256,12,'delta','muz');

/*CRUD OPERATIONS
1.CREATE*/
INSERT INTO products (product_id, product_name, price, category)
VALUES (1001, 'New Product', 49.99, 'Electronics');
SELECT * FROM products ;

/*CRUD OPERATIONS
2.READ*/
SELECT * FROM customers WHERE customer_id = 1;
SELECT * FROM products WHERE product_id = 1;

/*CRUD OPERATIONS
3.UPDATE*/
UPDATE products SET price = 39.99 WHERE product_id = 1;
SELECT * FROM products WHERE product_id = 1;
/*Stored Procedure*/
CREATE PROCEDURE crud_operations
AS
BEGIN

-- Create a new product
INSERT INTO products (product_id, product_name, price, category)
VALUES (1002, 'New Product 2', 439.99, 'Electronics');

-- Read a customer
SELECT * FROM customers WHERE customer_id = 1;

-- Update a product price
UPDATE products SET price = 391.99 WHERE product_id = 1002;

-- Delete a product
DELETE FROM products WHERE product_id = 1002;

END;
EXEC crud_operations; 

select * from products;
select * from customers;
























