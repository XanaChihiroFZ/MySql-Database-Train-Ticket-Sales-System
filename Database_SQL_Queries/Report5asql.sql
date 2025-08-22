-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    SUM(Price) AS TotalSales
FROM 
    Ticket;
