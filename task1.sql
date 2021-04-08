CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
Username VARCHAR(30) UNIQUE NOT NULL,
[Password] VARCHAR(50)  NOT NULL,
[Name] VARCHAR(50),
Birthdate DATETIME,
Age INT CHECK(Age BETWEEN 14 AND 110),
Email VARCHAR(50) NOT NULL
)

CREATE TABLE Departments 
(
Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Employees 
(
Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
FirstName VARCHAR(25),
LastName VARCHAR(25),
Birthdate DATETIME,
Age INT CHECK(Age BETWEEN 18 AND 110),
DepartmentId INT REFERENCES Departments(Id)
)

CREATE TABLE Categories 
(
Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
[Name] VARCHAR(50) NOT NULL,
DepartmentId INT REFERENCES Departments(Id) NOT NULL
)

CREATE TABLE Status 
(
	Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
	Label VARCHAR(30) NOT NULL
)

CREATE TABLE Reports 
(
Id INT PRIMARY KEY IDENTITY(0,1) NOT NULL,
CategoryId INT REFERENCES Categories(Id) NOT NULL,
StatusId INT REFERENCES Status(Id) NOT NULL,
OpenDate DATETIME NOT NULL,
CloseDate DATETIME,
Description VARCHAR(200),
UserId INT REFERENCES Users(Id) NOT NULL,
EmployeeId INT REFERENCES Employees(Id)
)