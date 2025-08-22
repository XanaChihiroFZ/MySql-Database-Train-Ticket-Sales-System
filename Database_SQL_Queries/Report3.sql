-- Use the database
USE TrainTicketSalesDB;
GO

-- Step 1: Identify filled coupes
WITH FilledCoupes AS (
    SELECT 
        c.CoupeID,
        c.WagonID,
        c.CoupeType,
        COUNT(p.PassengerID) AS NumPassengers,
        CASE 
            WHEN c.CoupeType = 'Normal' AND COUNT(p.PassengerID) = 6 THEN 1
            WHEN c.CoupeType = 'Royal' AND COUNT(p.PassengerID) = 4 THEN 1
            ELSE 0
        END AS IsFilled
    FROM 
        Coupe c
    LEFT JOIN 
        Passenger p ON c.CoupeID = p.CoupeID
    GROUP BY 
        c.CoupeID, c.WagonID, c.CoupeType
),
-- Step 2: Identify filled wagons
FilledWagons AS (
    SELECT 
        w.WagonID,
        w.WagonType,
        COUNT(fc.IsFilled) AS FilledCoupes,
        CASE 
            WHEN w.WagonType != 'Freight' AND COUNT(fc.IsFilled) = 2 THEN 1
            ELSE 0
        END AS IsFilled
    FROM 
        Wagon w
    LEFT JOIN 
        FilledCoupes fc ON w.WagonID = fc.WagonID AND fc.IsFilled = 1
    GROUP BY 
        w.WagonID, w.WagonType
)
-- Step 3: Aggregate the results
SELECT 
    'Filled Coupes' AS Category,
    fc.CoupeType AS Type,
    COUNT(*) AS Count
FROM 
    FilledCoupes fc
WHERE 
    fc.IsFilled = 1
GROUP BY 
    fc.CoupeType

UNION ALL

SELECT 
    'Filled Wagons' AS Category,
    fw.WagonType AS Type,
    COUNT(*) AS Count
FROM 
    FilledWagons fw
WHERE 
    fw.IsFilled = 1
GROUP BY 
    fw.WagonType;
