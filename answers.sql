-- Create the Bookstore database
CREATE DATABASE Bookstore;
USE Bookstore;

-- 1. Book table to store book details
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,             -- Unique ID for each book
    title VARCHAR(255) NOT NULL,                        -- Title of the book
    isbn VARCHAR(20) NOT NULL,                          -- ISBN number
    publisher_id INT,                                   -- References publisher
    language_id INT,                                    -- References book language
    price DECIMAL(10, 2),                               -- Price of the book
    stock INT,                                          -- Stock available
    CONSTRAINT FK_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    CONSTRAINT FK_language FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- 2. Book_Author junction table to create many-to-many relationship between books and authors
CREATE TABLE book_author (
    book_id INT,                                        -- References book
    author_id INT,                                      -- References author
    PRIMARY KEY (book_id, author_id),                   -- Composite primary key
    CONSTRAINT FK_book FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT FK_author FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 3. Author table to store author information
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique ID for each author
    name VARCHAR(255) NOT NULL                          -- Author name
);

-- 4. Book_Language table to store supported languages
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique ID for each language
    language_name VARCHAR(100) NOT NULL                 -- Language name
);

-- 5. Publisher table to store publisher details
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique ID for each publisher
    publisher_name VARCHAR(255) NOT NULL                -- Publisher name
);

-- 6. Customer table to store customer details
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique ID for each customer
    first_name VARCHAR(255) NOT NULL,                   -- First name
    last_name VARCHAR(255) NOT NULL,                    -- Last name
    email VARCHAR(255) UNIQUE NOT NULL,                 -- Email (unique)
    phone VARCHAR(20)                                   -- Phone number
);

-- 7. Customer_Address table to store customer's shipping or billing addresses
CREATE TABLE customer_address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique ID for the address
    customer_id INT,                                    -- References customer
    address VARCHAR(255),                               -- Address
    city VARCHAR(100),                                  -- City
    zip_code VARCHAR(20),                               -- Postal/ZIP code
    country_id INT,                                     -- References country
    address_status_id INT,                              -- References address status (e.g. billing, shipping)
    CONSTRAINT FK_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT FK_country FOREIGN KEY (country_id) REFERENCES country(country_id),
    CONSTRAINT FK_address_status FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- 8. Address_Status table to define types of addresses
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique ID
    status_name VARCHAR(100) NOT NULL                   -- Status type (e.g. billing, shipping)
);

-- 9. Address table to store general addresses (possibly for publishers or other entities)
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique address ID
    street_address VARCHAR(255),                        -- Street
    city VARCHAR(100),                                  -- City
    state VARCHAR(100),                                 -- State or province
    zip_code VARCHAR(20),                               -- ZIP/postal code
    country_id INT,                                     -- References country
    CONSTRAINT FK_country FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- 10. Country table to store country names
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique country ID
    country_name VARCHAR(100) NOT NULL                  -- Country name
);

-- 11. Cust_Order table to store customer orders
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,            -- Unique order ID
    customer_id INT,                                    -- References customer
    order_date DATETIME,                                -- Date and time of order
    shipping_method_id INT,                             -- References shipping method
    order_status_id INT,                                -- References current order status
    CONSTRAINT FK_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT FK_shipping_method FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    CONSTRAINT FK_order_status FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- 12. Order_Line table to store individual items in an order
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,       -- Unique ID for each order line
    order_id INT,                                       -- References order
    book_id INT,                                        -- References book
    quantity INT,                                       -- Quantity ordered
    price DECIMAL(10, 2),                               -- Price at time of order
    CONSTRAINT FK_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    CONSTRAINT FK_book FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 13. Shipping_Method table to list delivery methods
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique shipping method ID
    shipping_method_name VARCHAR(100) NOT NULL          -- Name of shipping method
);

-- 14. Order_History table to track changes in order status over time
CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for order history entry
    order_id INT,                                       -- References order
    status_date DATETIME,                               -- Date and time of status change
    order_status_id INT,                                -- New order status
    CONSTRAINT FK_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    CONSTRAINT FK_order_status FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- 15. Order_Status table to define various states of an order
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID
    status_name VARCHAR(100) NOT NULL                   -- Status (e.g. Pending, Shipped, Delivered)
);

-- Step 3: Create users and assign privileges

-- Create admin user with full privileges
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'password';

-- Create regular user with limited privileges
CREATE USER 'bookstore_user'@'localhost' IDENTIFIED BY 'password';

-- Grant full access to admin
GRANT ALL PRIVILEGES ON Bookstore.* TO 'bookstore_admin'@'localhost';

-- Grant limited access to regular user
GRANT SELECT, INSERT, UPDATE ON Bookstore.* TO 'bookstore_user'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- Step 4: Test queries

-- Retrieve all books
SELECT * FROM book;

-- Retrieve authors for a specific book
SELECT author.name
FROM author
JOIN book_author ON author.author_id = book_author.author_id
JOIN book ON book_author.book_id = book.book_id
WHERE book.title = 'Some Book Title';
