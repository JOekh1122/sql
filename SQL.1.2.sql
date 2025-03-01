CREATE DATABASE StoreDB;
USE StoreDB;

CREATE TABLE Customer (
    CustomerID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(MAx) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETUTCDATE(),
    totalAmount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT IDENTITY PRIMARY KEY,
    Quantity INT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Product (
    ProductID INT IDENTITY PRIMARY KEY,
    Category VARCHAR(50),
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Supplier (
    SupplierID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE ProductSupplier (
    SupplierID INT,
    ProductID INT,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Associated (
    ProductID INT,
    OrderID INT,
    OrderDetailsID INT,
    PRIMARY KEY (ProductID, OrderID, OrderDetailsID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (OrderDetailsID) REFERENCES OrderDetails(OrderDetailsID)
);

CREATE TABLE OrderProduct (
    ProductID INT,
    OrderID INT,
    PRIMARY KEY (ProductID, OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customer (Name, Email, PhoneNumber, Address) VALUES
('Joee', 'joe.jeo@gg.com', '123344567', '16 st AELX'),
('JOOOE', 'jO.HH@eAA.com', '011223223445543', '11 EL GG St');

INSERT INTO Orders (CustomerID, totalAmount, Status) VALUES
(1, 100.00, 'Shipped'),
(2, 200.00, 'Processing');

INSERT INTO OrderDetails (Quantity, Price) VALUES
(2, 50.00),
(1, 200.00);

INSERT INTO Product (Category, Name, Description, Price) VALUES
('FOOD', 'WATER', 'GOOD GOOD', 1000.00),
('Clothing', 'T-Shirt', 'Cotton T-Shirt', 20.00);

INSERT INTO Supplier (Name, ContactInfo) VALUES
('FOOD SUPLIER', 'JOE@JJ.com'),
('Clothing Supplier', 'JOEJOE@OO.com');

INSERT INTO ProductSupplier (SupplierID, ProductID) VALUES
(1, 1),
(2, 2);

INSERT INTO Associated (ProductID, OrderID, OrderDetailsID) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO OrderProduct (ProductID, OrderID) VALUES
(1, 1),
(2, 2);

ALTER TABLE Product
ADD rating DECIMAL(3, 2) DEFAULT 0.00;

ALTER TABLE Product
ADD CONSTRAINT Category DEFAULT 'new' FOR Category;

UPDATE Orders
SET OrderDate = GETUTCDATE()
WHERE OrderID > 0;

DELETE FROM ProductSupplier
WHERE ProductID IN (
    SELECT ProductID
    FROM Product
    WHERE Name IS NOT NULL AND Name <> 'Null'
);


SELECT * FROM Customer;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

SELECT * FROM Product;

SELECT * FROM Supplier;

SELECT * FROM ProductSupplier;

SELECT * FROM Associated;

SELECT * FROM OrderProduct;