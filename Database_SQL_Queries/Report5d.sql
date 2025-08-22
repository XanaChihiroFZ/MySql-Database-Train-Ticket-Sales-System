-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    t.DepartureDate,
    COUNT(*) AS NumWagons,
    t.TrainName
FROM 
    Train t
JOIN 
    Wagon w ON t.TrainID = w.TrainID
GROUP BY 
    t.DepartureDate, t.TrainName;
