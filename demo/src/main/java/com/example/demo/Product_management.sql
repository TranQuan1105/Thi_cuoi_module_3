CREATE DATABASE Product_management;
USE Product_management;

CREATE TABLE Category (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Product (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    price INT NOT NULL CHECK (Price > 10000000),
    quantity INT NOT NULL CHECK (Quantity > 0),
    color VARCHAR(100),
    categoryName VARCHAR(255) NOT NULL
);

INSERT INTO Category (categoryName)
VALUES 
('Phone'),
('Tivi'),
('Tủ lạnh'),
('Máy giặt');

INSERT INTO Product (productName, price, quantity, color, categoryName)
VALUES
('iPhone 11', 12000000, 12, 'Black, Yellow, Green', 'Phone'),
('iPhone 11 Pro', 13000000, 12, 'Black, Yellow, Green', 'Phone'),
('iPhone X', 10100000, 12, 'Black, Yellow, Green', 'Phone'),
('Smart Tivi 55 inch', 11500000, 12, 'Black, Yellow, Green', 'Tivi'),
('Tủ lạnh 2 cánh Toshiba', 15000000, 12, 'Black, Yellow, Green', 'Tủ lạnh'),
('Máy giặt cửa ngang SamSung', 13250000, 12, 'Black, Yellow, Green', 'Máy giặt');

SELECT * FROM Product;
