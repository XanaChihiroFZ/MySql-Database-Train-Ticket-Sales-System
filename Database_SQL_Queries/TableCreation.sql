-- Use the database
USE TrainTicketSalesDB;
GO

-- Create TouristCenter table
CREATE TABLE TouristCenter (
    CenterID INT PRIMARY KEY,
    Name NVARCHAR(100),
    CommissionRate DECIMAL(5, 2),
    ContractNumber NVARCHAR(50)
);

-- Create Train table
CREATE TABLE Train (
    TrainID INT PRIMARY KEY,
    TrainName NVARCHAR(100),
    DepartureDate DATE,
    CenterID INT,
    FOREIGN KEY (CenterID) REFERENCES TouristCenter(CenterID)
);

-- Create Wagon table
CREATE TABLE Wagon (
    WagonID INT PRIMARY KEY,
    WagonType NVARCHAR(50),  -- Men, Women, Family, Freight
    TrainID INT,
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID)
);

-- Create Coupe table
CREATE TABLE Coupe (
    CoupeID INT PRIMARY KEY,
    WagonID INT,
    CoupeType NVARCHAR(50),  -- Normal, Royal
    SeatCount INT,
    FOREIGN KEY (WagonID) REFERENCES Wagon(WagonID)
);

-- Create Passenger table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Gender NVARCHAR(10),
    SeatNumber NVARCHAR(10),
	CoupeID INT,
	FOREIGN KEY (CoupeID) REFERENCES Coupe(CoupeID)
);

-- Create Ticket table
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    Price DECIMAL(10, 2),
    CenterID INT,
    SeatNumber NVARCHAR(10),
	CoupeID INT,
	FOREIGN KEY (CoupeID) REFERENCES Coupe(CoupeID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (CenterID) REFERENCES TouristCenter(CenterID)
);

-- Create Vehicle table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    OwnerName NVARCHAR(100),
    LicensePlate NVARCHAR(50),
    PassengerID INT,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);
