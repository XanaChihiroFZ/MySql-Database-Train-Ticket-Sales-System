-- Use the database
USE TrainTicketSalesDB;
GO

-- Populate TouristCenter table
INSERT INTO TouristCenter (CenterID, Name, CommissionRate, ContractNumber)
VALUES
(1, 'Center A', 0.05, 'ABC123'),
(2, 'Center B', 0.07, 'XYZ456'),
(3, 'Center C', 0.06, 'DEF789');

-- Populate Train table
INSERT INTO Train (TrainID, TrainName, DepartureDate, CenterID)
VALUES
(101, 'Express 1', '2024-06-10', 1),
(102, 'Speedy 2', '2024-06-12', 2),
(103, 'Rapid 3', '2024-06-15', 3);

-- Populate Wagon table
INSERT INTO Wagon (WagonID, WagonType, TrainID)
VALUES
(201, 'Men', 101),
(202, 'Women', 101),
(203, 'Family', 101),
(204, 'Freight', 101),
(205, 'Men', 102),
(206, 'Women', 102),
(207, 'Family', 102),
(208, 'Freight', 102),
(209, 'Men', 103),
(210, 'Women', 103),
(211, 'Family', 103),
(212, 'Freight', 103);

-- Populate Coupe table
INSERT INTO Coupe (CoupeID, WagonID, CoupeType, SeatCount)
VALUES
(301, 201, 'Normal', 4),
(302, 201, 'Royal', 2),
(303, 202, 'Normal', 4),
(304, 203, 'Normal', 6),
(305, 204, 'Freight', NULL),
(306, 205, 'Normal', 4),
(307, 206, 'Normal', 4),
(308, 207, 'Family', 8),
(309, 208, 'Freight', NULL),
(310, 209, 'Normal', 4),
(311, 210, 'Royal', 2),
(312, 211, 'Normal', 6),
(313, 212, 'Freight', NULL);

-- Populate Passenger table
INSERT INTO Passenger (PassengerID, Name, Age, Gender, SeatNumber, CoupeID)
VALUES
(401, 'John Doe', 35, 'Male', 'A1', 301),
(402, 'Jane Doe', 30, 'Female', 'A2', 301),
(403, 'Alice Smith', 25, 'Female', 'B1', 303),
(404, 'Bob Johnson', 40, 'Male', 'B2', 303),
(405, 'Charlie Brown', 50, 'Male', 'C1', 306),
(406, 'Diana Prince', 28, 'Female', 'C2', 306),
(407, 'Eve Green', 45, 'Female', 'D1', 307),
(408, 'Frank White', 55, 'Male', 'D2', 307),
(409, 'Grace Kelly', 35, 'Female', 'E1', 310),
(410, 'Harry Potter', 22, 'Male', 'E2', 310),
(411, 'Ivy Lee', 29, 'Female', 'F1', 311),
(412, 'Jack Black', 31, 'Male', 'F2', 311),
(413, 'Kelly Clarkson', 37, 'Female', 'G1', 312),
(414, 'Larry King', 60, 'Male', 'G2', 312);

-- Populate Ticket table
INSERT INTO Ticket (TicketID, PassengerID, Price, CenterID, SeatNumber, CoupeID)
VALUES
(501, 401, 50.00, 1, 'A1', 301),
(502, 402, 50.00, 1, 'A2', 301),
(503, 403, 60.00, 1, 'B1', 303),
(504, 404, 60.00, 1, 'B2', 303),
(505, 405, 40.00, 2, 'C1', 306),
(506, 406, 40.00, 2, 'C2', 306),
(507, 407, 45.00, 2, 'D1', 307),
(508, 408, 45.00, 2, 'D2', 307),
(509, 409, 55.00, 3, 'E1', 310),
(510, 410, 55.00, 3, 'E2', 310),
(511, 411, 65.00, 3, 'F1', 311),
(512, 412, 65.00, 3, 'F2', 311),
(513, 413, 75.00, 3, 'G1', 312),
(514, 414, 75.00, 3, 'G2', 312);

-- Populate Vehicle table
INSERT INTO Vehicle (VehicleID, OwnerName, LicensePlate, PassengerID)
VALUES
(601, 'John Doe', 'ABC123', 401),
(602, 'Jane Doe', 'XYZ456', 402),
(603, 'Alice Smith', 'DEF789', 403),
(604, 'Bob Johnson', 'GHI101', 404),
(605, 'Charlie Brown', 'JKL202', 405),
(606, 'Diana Prince', 'MNO303', 406),
(607, 'Eve Green', 'PQR404', 407),
(608, 'Frank White', 'STU505', 408),
(609, 'Grace Kelly', 'VWX606', 409),
(610, 'Harry Potter', 'YZA707', 410),
(611, 'Ivy Lee', 'BCD808', 411),
(612, 'Jack Black', 'EFG909', 412),
(613, 'Kelly Clarkson', 'HIJ010', 413),
(614, 'Larry King', 'KLM111', 414);
