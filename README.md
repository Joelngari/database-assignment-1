# BookStore Database Design & Programming with SQL

## Overview

In this project, you will assume the role of a database administrator tasked with building a MySQL database to store and manage data for a BookStore. By applying your skills in database design, table creation, data loading, and user management, you will develop an organized system for this important real-world application. This hands-on project provides valuable experience in efficiently structuring databases to handle large, complex data.

## Tools and Technologies

- **MySQL**: For building and managing the database
- **Draw.io**: For visualizing the database schema and relationships

## Prerequisites

Before starting this project, you should be comfortable with:

- Understanding the basics of MySQL
- Creating tables in MySQL with the appropriate data types
- Managing MySQL users and applying security best practices

## Project Objective

The goal is to build a relational database that stores information about the bookstore's operations, including books, authors, customers, orders, shipping, and more. You will create a database that efficiently stores all necessary data and allows for quick retrieval and analysis.

## Step-by-Step Instructions

1. **Create a new database** to store bookstore data.
2. **Determine the table schema and data types** for each required table.
3. **Write SQL commands** to create tables that match the data structure.
4. **Set up user groups and roles** to control access to the database.
5. **Test the database** by running queries to retrieve and analyze the data.

## Expected Outcomes

Upon completing this SQL project, you will have gained practical experience and transferable skills, including:

- Designing and implementing a MySQL database for a real-world use case.
- Creating tables with the optimal schema and data types for the dataset.
- Managing database access through user groups and roles to ensure security.
- Querying the data to extract meaningful insights.

## Tables to Be Created

The following key tables are to be designed and implemented for the bookstore database:

1. **book**: A list of all books available in the store.
2. **book_author**: A table to manage the many-to-many relationship between books and authors.
3. **author**: A list of all authors.
4. **book_language**: A list of the possible languages of books.
5. **publisher**: A list of publishers for books.
6. **customer**: A list of the bookstore's customers.
7. **customer_address**: A list of addresses for customers. Each customer can have multiple addresses.
8. **address_status**: A list of statuses for an address (e.g., current, old).
9. **address**: A list of all addresses in the system.
10. **country**: A list of countries where the addresses are located.
11. **cust_order**: A list of orders placed by customers.
12. **order_line**: A list of books that are part of each order.
13. **shipping_method**: A list of possible shipping methods for an order.
14. **order_history**: A record of the history of an order (e.g., ordered, cancelled, delivered).
15. **order_status**: A list of possible statuses for an order (e.g., pending, shipped, delivered).


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
