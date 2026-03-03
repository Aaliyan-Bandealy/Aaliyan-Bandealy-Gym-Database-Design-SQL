CREATE DATABASE PulseFitness;
USE PulseFitness;

DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS PersonalTrainingSession;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Plan;

CREATE TABLE Plan (
    PlanID INT PRIMARY KEY,
    TypeName VARCHAR(50),
    Price DECIMAL(6,2),
    ClassLimitPerWeek INT,
    AccessHours VARCHAR(50),
    EquipmentAccessLevel VARCHAR(50)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    JoinDate DATE,
    Status VARCHAR(20),
    PlanID INT,
    FOREIGN KEY (PlanID) REFERENCES Plan(PlanID)
);

CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    TrainerID INT,
    ScheduleTime TIME,
    DurationMinutes INT,
    MaxCapacity INT,
    DifficultyLevel VARCHAR(20),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    CustomerID INT,
    ClassID INT,
    AttendanceDate DATE,
    CheckInTime TIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE PersonalTrainingSession (
    SessionID INT PRIMARY KEY,
    CustomerID INT,
    TrainerID INT,
    SessionDate DATE,
    SessionTime TIME,
    DurationMinutes INT,
    Status VARCHAR(20),
    Goal VARCHAR(100),
    IsFree BOOLEAN,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL(6,2),
    PaymentMethod VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    TrainerID INT,
    ClassID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);
