-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    p.SeatNumber,
    c.CoupeType AS CoupeName,
    w.WagonType AS WagonName,
    p.Gender
FROM 
    Passenger p
JOIN 
    Coupe c ON p.CoupeID = c.CoupeID
JOIN 
    Wagon w ON c.WagonID = w.WagonID
WHERE 
    p.Name IS NULL;
