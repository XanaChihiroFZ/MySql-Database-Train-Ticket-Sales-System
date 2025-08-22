-- Use the database
USE TrainTicketSalesDB;
GO

WITH TractorCounts AS (
    SELECT
        TrainID,
        CEILING(CAST(SUM(CASE WHEN WagonType = 'Passenger' THEN 1 ELSE 0 END) AS DECIMAL) / 13) AS NumPassengerTractors,
        CEILING(CAST(SUM(CASE WHEN WagonType = 'Freight' THEN 1 ELSE 0 END) AS DECIMAL) / 6) AS NumFreightTractors
    FROM
        Wagon
    GROUP BY
        TrainID
)
SELECT
    TrainID,
    CASE
        WHEN MAX(NumPassengerTractors) > MAX(NumFreightTractors) THEN MAX(NumPassengerTractors)
        ELSE MAX(NumFreightTractors)
    END AS NumTractorsRequired
FROM
    TractorCounts
GROUP BY
    TrainID;



