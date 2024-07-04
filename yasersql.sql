CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    registration_date DATE
);
INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, registration_date)
VALUES (1, 'yaser', 'shboul', 'yasershboul@gmail.com', '07777777777', '2024-08-06');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
INSERT INTO orders (order_id, customer_name, order_date, total_amount)
VALUES (1, 'rashed', '2024-07-04', 150.50);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    Price INT,
    ProductDescription NVARCHAR(MAX)
);
INSERT INTO Products (ProductID, ProductName, Price, ProductDescription)
VALUES (1, N'Flower', 100, N'baby red rose ');

CREATE TABLE Employees (
    EmpId INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(25),
    PhoneNo VARCHAR(25)
);
INSERT INTO Employees (EmpId, FirstName, LastName, Email, PhoneNo)
VALUES (1, 'yaer ', 'shboul', 'yaershboul@example.com', '07777775687');