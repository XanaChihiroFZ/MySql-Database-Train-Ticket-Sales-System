-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    Gender,
    COUNT(*) AS NumPassengers,
    SUM(Price) AS TotalCost
FROM 
    Passenger p
JOIN 
    Ticket t ON p.PassengerID = t.PassengerID
GROUP BY 
    Gender;
