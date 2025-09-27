# Footwear Inventory Tracking System 👟

This project is a **relational database system** designed to manage and track inventory for a company that specializes in the sales of **footwears**. It handles products, suppliers, customers, employees, sales, and purchase orders while ensuring **data integrity** using proper database constraints.

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

1. **Suppliers** – Stores supplier details.
2. **Products** – Contains footwear details (name, size, color, category, supplier).
3. **Customers** – Records customer information.
4. **Employees** – Tracks staff involved in sales and inventory.
5. **Inventory** – Tracks stock levels, reorder thresholds, and restocks.
6. **SalesOrders** – Customer purchase records.
7. **SalesOrderDetails** – Line items of sales (products and quantities).
8. **PurchaseOrders** – Records of restocks from suppliers.
9. **PurchaseOrderDetails** – Line items of supplier orders.

---

## 🔗 Relationships

* **One-to-Many**:

  * A Supplier → supplies many Products.
  * A Customer → can place many Sales Orders.
  * An Employee → can process many Orders.

* **Many-to-Many**:

  * Products ↔ Sales Orders (through **SalesOrderDetails**).
  * Products ↔ Purchase Orders (through **PurchaseOrderDetails**).

---

## 📂 Project Structure

```bash
📦 footwear-inventory-system
 ┣ 📜 schema.sql                # Database schema (tables + constraints)
 ┣ 📜 footwear_inventory_sample_data.sql   # Sample realistic dataset
 ┣ 📜 README.md                 # Project documentation
```

---

## 🚀 Getting Started

### 1️⃣ Clone Repository

