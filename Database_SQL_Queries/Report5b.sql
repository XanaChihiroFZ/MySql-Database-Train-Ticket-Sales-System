-- Use the database
USE TrainTicketSalesDB;
GO

SELECT 
    tc.CenterID,
    SUM(t.Price * tc.CommissionRate) AS TotalCommission 
FROM 
    Ticket t 
JOIN 
    TouristCenter tc ON t.CenterID = tc.CenterID 
GROUP BY 
    tc.CenterID;

