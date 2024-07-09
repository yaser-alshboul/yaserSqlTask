CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Email NVARCHAR(255) UNIQUE,
    Password NVARCHAR(255),
    Image VARBINARY(MAX)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Price DECIMAL(10, 2),
    Description NVARCHAR(MAX)
);

CREATE TABLE UserServices (
    UserServiceID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    ServiceID INT,
    PurchaseDate DATETIME,
    ExpirationDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE Messages (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT,
    ReceiverID INT,
    MessageText NVARCHAR(MAX),
    SentDateTime DATETIME,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    ServiceID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATETIME,
    Status NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);



INSERT INTO Users (Name, Email, Password, Image) VALUES 
('John Doe', 'johndoe@example.com', 'hashed_password', NULL),
('Jane Smith', 'janesmith@example.com', 'hashed_password', NULL),
('Alice Johnson', 'alicej@example.com', 'hashed_password', NULL),
('Bob Brown', 'bobb@example.com', 'hashed_password', NULL),
('Charlie Black', 'charlieb@example.com', 'hashed_password', NULL),
('Diana Green', 'dianag@example.com', 'hashed_password', NULL);

INSERT INTO Services (Name, Price, Description) VALUES 
('Messaging', 5.00, 'Unlimited messages per month'),
('Premium Support', 15.00, '24/7 support and consulting'),
('Extra Storage', 2.50, 'Additional 50GB of message storage'),
('Video Calls', 10.00, 'Access to video calling feature'),
('Enhanced Security', 20.00, 'Extra encryption and security features'),
('API Access', 30.00, 'Ability to access service via API');

INSERT INTO UserServices (UserID, ServiceID, PurchaseDate, ExpirationDate) VALUES 
(1, 1, GETDATE(), DATEADD(month, 1, GETDATE())),
(2, 2, GETDATE(), DATEADD(month, 1, GETDATE())),
(3, 3, GETDATE(), DATEADD(month, 1, GETDATE())),
(4, 4, GETDATE(), DATEADD(month, 1, GETDATE())),
(5, 5, GETDATE(), DATEADD(month, 1, GETDATE())),
(6, 6, GETDATE(), DATEADD(month, 1, GETDATE()));

INSERT INTO Messages (SenderID, ReceiverID, MessageText, SentDateTime) VALUES 
(1, 2, 'Hello Jane!', GETDATE()),
(2, 1, 'Hi John!', GETDATE()),
(3, 4, 'Hey Bob!', GETDATE()),
(4, 3, 'Whats up Alice?', GETDATE()),
(5, 6, 'Good morning Diana!', GETDATE()),
(6, 5, 'Hello Charlie!', GETDATE());


INSERT INTO Payments (UserID, ServiceID, Amount, PaymentDate, Status) VALUES 
(1, 1, 5.00, GETDATE(), 'Completed'),
(2, 2, 15.00, GETDATE(), 'Completed'),
(3, 3, 2.50, GETDATE(), 'Completed'),
(4, 4, 10.00, GETDATE(), 'Pending'),
(5, 5, 20.00, GETDATE(), 'Failed'),
(6, 6, 30.00, GETDATE(), 'Completed');


UPDATE Users SET Name = 'John D.', Email = 'john.d@example.com' WHERE UserID = 1;
UPDATE Users SET Name = 'Jane S.', Email = 'jane.s@example.com' WHERE UserID = 2;

UPDATE Services SET Price = 6.00 WHERE ServiceID = 1;
UPDATE Services SET Price = 16.00 WHERE ServiceID = 2;

UPDATE UserServices SET ServiceID = 2 WHERE UserServiceID = 1;
UPDATE UserServices SET ServiceID = 1 WHERE UserServiceID = 2;

UPDATE Messages SET MessageText = 'Updated Message' WHERE MessageID = 1;
UPDATE Messages SET MessageText = 'Another Updated Message' WHERE MessageID = 2;

UPDATE Payments SET Amount = 6.00 WHERE PaymentID = 1;
UPDATE Payments SET Status = 'Completed' WHERE PaymentID = 4;


DELETE FROM Users WHERE UserID IN (5, 6);

DELETE FROM Services WHERE ServiceID IN (5, 6);

DELETE FROM UserServices WHERE UserServiceID IN (5, 6);

DELETE FROM Messages WHERE MessageID IN (5, 6);

DELETE FROM Payments WHERE PaymentID IN (5, 6);


EXEC sp_rename 'Users', 'AppUsers';

EXEC sp_rename 'Services', 'AppServices';


ALTER TABLE AppUsers ALTER COLUMN Email NVARCHAR(320);
EXEC sp_rename 'AppUsers.Email', 'EmailAddress', 'COLUMN';

ALTER TABLE AppServices ALTER COLUMN Price DECIMAL(12, 4);
EXEC sp_rename 'AppServices.Price', 'ServicePrice', 'COLUMN';