

CREATE TABLE TaskDepartment (
    departmentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

CREATE TABLE TaskUsers (
    UsersID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    birthdate DATE,
    phone VARCHAR(15),
    nationalIDs VARCHAR(20),
    nationality NVARCHAR(255),
    marital_statuses NVARCHAR(255),
    personal_photo VARBINARY(MAX), 
    entry_date DATE,
    password VARBINARY(256), 
    department_ID INT,
    FOREIGN KEY (department_ID) REFERENCES TaskDepartment(departmentID)
);

CREATE TABLE TaskTask (
    TaskID INT PRIMARY KEY IDENTITY(1,1),
    UsersID INT,
    title NVARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    task_description NVARCHAR(1000),
    level_of_importance INT,
    task_status NVARCHAR(100), 
    FOREIGN KEY (UsersID) REFERENCES TaskUsers(UsersID)
);

CREATE TABLE TaskFeedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1), 
    Name NVARCHAR(255),
    Email NVARCHAR(255),
    Subject NVARCHAR(255),
    Message NVARCHAR(1000)
);