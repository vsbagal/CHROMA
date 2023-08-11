-- CREATE DATABASE FOR CHROMA STORE
CREATE DATABASE CHROMA;

-- USE SAME DB 
USE CHROMA;

-- PRODUCTS TABLE 
CREATE TABLE Products (
	ProductID INT PRIMARY KEY, 
    ProductName VARCHAR(255), 
    Category VARCHAR(255),
    Brand VARCHAR(255), 
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- CUSTOMERES TABLE
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(12),
    Address VARCHAR(255)
);

-- ORDERS TABLE
CREATE TABLE Orders( 
OrderID INT PRIMARY KEY, 
CustomerID INT,
OrderDate DATE, 
TotalAmount DECIMAL(10, 2),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

-- ORDERITEMS TABLES
CREATE TABLE OrderItems(
OrderItemID INT PRIMARY KEY, 
OrderID INT, 
ProductID INT, 
Quantity INT, 
UnitPrice DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSER DATABASE TO ALL TABLES 

-- INSERT INTO PRODUCTS TABLE
INSERT INTO Products (ProductID, ProductName, Category, Brand, Price, StockQuantity)
VALUES
	(1, 'Smartphone', 'Electronics', 'Apple', 999.99, 70),
    (2, 'Laptop', 'Electronics', 'Dell', 899.99, 34),
    (3, 'TV', 'Electronics', 'Samsung', 499.10, 49),
    (4, 'Oven', 'Electronics', 'LG', 349.22, 12),
    (5, 'Grinder', 'Electronics', 'LG', 799.33, 19);

-- INSERT INTO CUSTOMERS TABLE
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
    (1, 'Jay', 'Kishan', 'jay@example.com', '123-456-7890', '123 Main St'),
    (2, 'Rohit', 'mishra', 'rohit@example.com', '987-654-3210', '456 Elm St'),
    (3, 'Vikalp', 'Jain', 'vikalp@example.com', '987-884-3210', '246 south St'),
    (4, 'Piyush', 'Choudhari', 'piyush@example.com', '987-654-9910', '345 north St'),
	(5, 'Ganesh', 'Puri', 'ganesh@example.com', '988-232-3422', '243 south st');
    
-- INSERT INTO ORDERS TABLE
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-07-01', 1899.98),
    (2, 2, '2023-07-15', 699.99),
    (3, 3, '2023-07-28', 999.99),
    (4, 4, '2023-08-15', 499.99),
    (5, 5, '2023-09-01', 299.99);
    

-- INSERT INTO ORDERITEMS TABLE
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 1, 1, 2, 999.99),
    (2, 1, 2, 1, 899.99),
    (3, 2, 3, 1, 699.99),
    (4, 5, 2, 2, 799.99),
    (5, 3, 5, 3, 299.99);
