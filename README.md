# Footwear Inventory Tracking System 👟

This project is a **relational database system** designed to manage and track inventory for a company that specializes in the sales of **footwears**. It handles products, suppliers, customers, sales, and purchase orders while ensuring **data integrity** using proper database constraints.

---

## 📌 Features

* **Product Management**: Track footwear details such as size, color, category, supplier, and price.
* **Supplier Management**: Maintain supplier contact details and purchase records.
* **Customer Management**: Store customer details for sales tracking and reporting.
* **Employee Management**: Record employee roles related to inventory and sales.
* **Inventory Control**: Monitor stock levels, reorder points, and restock history.
* **Sales Orders**: Track customer purchases with detailed order breakdowns.
* **Purchase Orders**: Manage orders from suppliers to restock inventory.
* **Relational Integrity**: Enforces **Primary Keys, Foreign Keys, NOT NULL, and UNIQUE constraints** for reliable data.

---

## 🏗 Database Schema

The system includes the following main tables:

1. **Suppliers** – (SupplierID, SupplierName, ContactName, Phone, Email, Address, City, State, ZipCode).
2. **Customers** – (CustomerID, CustomerName, Email, Phone, Address, City, State, ZipCode).
3. **Categories  - (CategoryID, CategoryName, Description).
4. **Products - (ProductID, ProductName, CategoryID, SupplierID, UnitPrice, QuantityInStock, ReorderLevel)
5. **Orders - (OrderID, CustomerID, OrderDate, Status).
6. **OrderItems - (OrderID, ProductID, Quantity, UnitPrice).
7. **ProductDetails - (ProductID, ShoeSize, Color, Material, Gender).
8. **InventoryTransactions (TransactionID, ProductID, TransactionDate, Quantity, TransactionType).

---

## 🔗 Relationships

* **Customers → Orders**: One-to-Many (a customer can place many orders).
* **Orders → OrderItems**: One-to-Many (an order contains multiple items).
* **Products → OrderItems**: Many-to-Many (a product can appear in many orders, implemented via OrderItems).
* **Suppliers → Products**: One-to-Many (a supplier can supply multiple products).
* **Products → InventoryTransactions**: One-to-Many (a product can have multiple stock movements).

---

## 📂 Files in This Project

* `inventory.sql` → Database schema with all tables and constraints.
* `README.md` → Project documentation and setup guide.

---

## 🚀 Future Improvements

* Add **user authentication** for staff members.
* Create **sales reports** and **low stock alerts**.
* Build a **web dashboard** for managers.
* Integrate with **payment systems** for real-time sales.

---


### 1️⃣ Clone Repository

