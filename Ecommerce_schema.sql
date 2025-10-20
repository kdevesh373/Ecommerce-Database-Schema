DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
SHOW DATABASES;
USE ecommerce_db;
SHOW TABLES;
DESCRIBE Product;
DESCRIBE Customer;
INSERT INTO Category (category_name)
VALUES ('Electronics'), ('Clothing'), ('Home Appliances');
INSERT INTO Customer (name, email, phone, address)
VALUES ('John Doe', 'john@example.com', '9876543210', 'Delhi, India'),
       ('Jane Smith', 'jane@example.com', '9123456789', 'Mumbai, India');
INSERT INTO Product (name, price, stock, category_id)
VALUES ('Laptop', 55000.00, 10, 1),
       ('T-Shirt', 999.00, 50, 2),
       ('Microwave Oven', 8500.00, 15, 3);
INSERT INTO Orders (order_date, total_amount, customer_id)
VALUES ('2025-10-20', 55999.00, 1),
       ('2025-10-21', 999.00, 2);
INSERT INTO Order_Items (order_id, product_id, quantity, subtotal)
VALUES (1, 1, 1, 55000.00),
       (1, 2, 1, 999.00),
       (2, 2, 1, 999.00);
       
SHOW TABLES;
DESC Customer;
DESC Category;
DESC Product;
DESC Orders;
DESC Order_Items;
SELECT * FROM Customer;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.subtotal,
    o.order_date
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id
ORDER BY o.order_id;
