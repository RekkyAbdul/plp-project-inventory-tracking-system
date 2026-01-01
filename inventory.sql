CREATE DATABASE FootwearInventoryDB;
USE FootwearInventoryDB;

-- Categories (Sneakers, Boots, Sandals, etc.)
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

-- Suppliers (Manufacturers / Wholesalers)
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(150) NOT NULL,
    ContactName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    Address TEXT
);

-- Products (Shoes)
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    Brand VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    QuantityInStock INT NOT NULL DEFAULT 0 CHECK (QuantityInStock >= 0),
    CONSTRAINT fk_product_category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_product_supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Product Details (Sizes, Colors, Material)
CREATE TABLE ProductDetails (
    ProductID INT PRIMARY KEY,
    ShoeSize VARCHAR(10) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    Material VARCHAR(100),
    Gender ENUM('Men','Women','Unisex','Kids'),
    CONSTRAINT fk_productdetails FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(150) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address TEXT
);

-- Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL DEFAULT CURRENT_DATE,
    Status ENUM('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    CONSTRAINT fk_order_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Order Items (Shoes purchased per order)
CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT fk_orderitems_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orderitems_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inventory Transactions (Logs stock movements)
CREATE TABLE InventoryTransactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    ChangeType ENUM('IN','OUT') NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReferenceNote VARCHAR(255),
    CONSTRAINT fk_inventory_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Sneakers', 'Casual and sports footwear'),
('Formal Shoes', 'Business and office footwear'),
('Sandals', 'Open-toe footwear for casual wear'),
('Boots', 'Heavy-duty and fashion boots'),
('Kids Shoes', 'Footwear designed for children');

-- Insert Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email, Address) VALUES
('Nike Inc.', 'James Carter', '+2348012345678', 'jcarter@nike.com', '45 Broad Street, Lagos, Nigeria'),
('Adidas Ltd.', 'Maria Johnson', '+2348023456789', 'maria@adidas.com', '12 Allen Avenue, Ikeja, Lagos'),
('Clarks Footwear', 'Peter Obi', '+2348034567890', 'peter@clarks.com', '20 Kingsway Road, London, UK'),
('Timberland Co.', 'Sandra Bello', '+2348045678901', 'sandra@timberland.com', '88 Aba Road, Port Harcourt, Nigeria'),
('Puma Sports', 'Ahmed Yusuf', '+2348056789012', 'ahmed@puma.com', '25 Market Street, Abuja, Nigeria');

-- Insert Products
INSERT INTO Products (ProductName, Brand, CategoryID, SupplierID, UnitPrice, QuantityInStock) VALUES
('Air Force 1', 'Nike', 1, 1, 65000.00, 50),
('Air Max 270', 'Nike', 1, 1, 72000.00, 40),
('Ultraboost 22', 'Adidas', 1, 2, 80000.00, 35),
('Stan Smith', 'Adidas', 1, 2, 60000.00, 25),
('Leather Oxford', 'Clarks', 2, 3, 90000.00, 20),
('Derby Shoes', 'Clarks', 2, 3, 85000.00, 18),
('Classic Sandals', 'Puma', 3, 5, 25000.00, 45),
('Kids Running Shoes', 'Nike', 5, 1, 30000.00, 30),
('Chelsea Boots', 'Timberland', 4, 4, 120000.00, 15),
('Hiking Boots', 'Timberland', 4, 4, 150000.00, 12);

-- Insert ProductDetails
INSERT INTO ProductDetails (ProductID, ShoeSize, Color, Material, Gender) VALUES
(1, '42', 'White', 'Leather', 'Unisex'),
(2, '43', 'Black/Red', 'Mesh', 'Men'),
(3, '42', 'Grey', 'Primeknit', 'Men'),
(4, '40', 'White/Green', 'Leather', 'Women'),
(5, '44', 'Brown', 'Leather', 'Men'),
(6, '43', 'Black', 'Leather', 'Men'),
(7, '41', 'Blue', 'Rubber', 'Unisex'),
(8, '35', 'Pink', 'Synthetic', 'Kids'),
(9, '44', 'Black', 'Leather', 'Men'),
(10, '45', 'Brown', 'Leather', 'Men');

-- Insert Customers
INSERT INTO Customers (CustomerName, Email, Phone, Address) VALUES
('Chinedu Okafor', 'chinedu.okafor@example.com', '+2348011122233', '14 Lekki Phase 1, Lagos, Nigeria'),
('Aisha Bello', 'aisha.bello@example.com', '+2348022233344', '22 Wuse 2, Abuja, Nigeria'),
('Emeka Uche', 'emeka.uche@example.com', '+2348033344455', '5 GRA, Enugu, Nigeria'),
('Grace Johnson', 'grace.johnson@example.com', '+2348044455566', '10 Victoria Island, Lagos, Nigeria'),
('Tunde Balogun', 'tunde.balogun@example.com', '+2348055566677', '25 Garki, Abuja, Nigeria');

-- Insert Orders
INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2025-09-20', 'Pending'),
(2, '2025-09-21', 'Shipped'),
(3, '2025-09-22', 'Delivered'),
(4, '2025-09-23', 'Delivered'),
(5, '2025-09-24', 'Pending');

-- Insert OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 65000.00),
(1, 7, 1, 25000.00),
(2, 3, 1, 80000.00),
(2, 8, 2, 30000.00),
(3, 5, 1, 90000.00),
(3, 6, 1, 85000.00),
(4, 9, 1, 120000.00),
(4, 10, 1, 150000.00),
(5, 2, 1, 72000.00),
(5, 4, 1, 60000.00);

-- Insert Inventory Transactions
INSERT INTO InventoryTransactions (ProductID, ChangeType, Quantity, ReferenceNote) VALUES
(1, 'OUT', 2, 'Order #1'),
(7, 'OUT', 1, 'Order #1'),
(3, 'OUT', 1, 'Order #2'),
(8, 'OUT', 2, 'Order #2'),
(5, 'OUT', 1, 'Order #3'),
(6, 'OUT', 1, 'Order #3'),
(9, 'OUT', 1, 'Order #4'),
(10, 'OUT', 1, 'Order #4'),
(2, 'OUT', 1, 'Order #5'),
(4, 'OUT', 1, 'Order #5'),
(3, 'IN', 20, 'Restock from Adidas'),
(9, 'IN', 10, 'Restock from Timberland');
