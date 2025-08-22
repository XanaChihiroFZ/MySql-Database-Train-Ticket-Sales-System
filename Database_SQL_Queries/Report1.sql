-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    p.Name AS PassengerName,
    w.WagonType AS WagonType,
    c.CoupeType AS CoupeType,
    p.Gender
FROM 
    Passenger p
JOIN 
    Coupe c ON p.CoupeID = c.CoupeID
JOIN 
    Wagon w ON c.WagonID = w.WagonID;
