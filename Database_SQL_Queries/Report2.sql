-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    v.OwnerName AS VehicleOwner,
    v.LicensePlate,
    p.Name AS PassengerName,
    w.WagonType AS WagonType,
    c.CoupeType AS CoupeType
FROM 
    Vehicle v
JOIN 
    Passenger p ON v.PassengerID = p.PassengerID
JOIN 
    Coupe c ON p.CoupeID = c.CoupeID
JOIN 
    Wagon w ON c.WagonID = w.WagonID;
