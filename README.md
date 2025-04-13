# 📚 Bookstore Database Project

This is a MySQL-based database system designed to manage a bookstore's operations. The project includes tables for books, authors, customers, orders, shipping, and more.

---

## 🚀 Objective
To design and implement a relational database that:
- Stores and manages data for a bookstore
- Handles customer orders, book details, and shipping info
- Allows efficient querying and analysis
- Demonstrates good schema design and SQL practices

---

## 🛠️ Tools & Technologies
- **MySQL** – Main database platform
- **Draw.io** – For ERD design and schema visualization
- **GitHub** – Version control and project submission

---

## 📦 Tables Included

- `book`: Stores book details  
- `author`: List of all authors  
- `book_author`: Handles many-to-many relationship between books and authors  
- `book_language`: Languages that books are written in  
- `publisher`: Book publishers  
- `customer`: Bookstore customers  
- `address`: Stores physical addresses  
- `country`: Country list  
- `address_status`: Status like 'current', 'old'  
- `customer_address`: Manages multiple addresses per customer  
- `cust_order`: Orders placed by customers  
- `order_line`: Books included in each order  
- `order_status`: Status of the order (e.g., shipped, delivered)  
- `order_history`: Tracks changes in order status  
- `shipping_method`: Methods like courier, pickup  

---

## How to Run This Project

1. **Clone the repository**
```bash
git clone https://github.com/Joelngari/database-assignment.git
