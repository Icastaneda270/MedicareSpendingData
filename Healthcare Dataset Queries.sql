-- Activate Database
USE [ healthcare];

-- Test Data
SELECT * FROM dbo.Hospital_General_Information;

SELECT * FROM dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS;

-- Min and Max Spending
SELECT
    ROUND(MIN(hq.value),3) AS MinValue,
    ROUND(AVG(hq.value),3) AS AvgValue,
    ROUND(MAX(hq.value),3) AS MaxValue
FROM 
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq
    ON hgi.Facility_ID = hq.Facility_ID

-- Checks Average Spending By State
SELECT
    hgi.State,
    ROUND(AVG(hq.Value),3) AS Average_Spending_State
FROM
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq 
    ON hgi.Facility_ID = hq.Facility_ID
WHERE
    hq.value IS NOT NULL
GROUP BY
    hgi.state
ORDER BY
    Average_Spending_State ASC;

-- Checks Average Spending By County
SELECT 
    hgi.State,
    RIGHT('00000' + CAST(hgi.ZIP_Code AS VARCHAR(5)), 5) AS Zip_Code,
    hgi.County_Parish,
    ROUND(AVG(hq.Value), 3) AS Average_Spending_County,
    COUNT(*) AS Hospital_Count
FROM
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq 
    ON hgi.Facility_ID = hq.Facility_ID
WHERE 
    hq.Value IS NOT NULL
    AND hgi.ZIP_Code IS NOT NULL
GROUP BY 
    hgi.State,
    hgi.County_Parish,
    RIGHT('00000' + CAST(hgi.ZIP_Code AS VARCHAR(5)), 5)
ORDER BY 
    hgi.State ASC, 
    Average_Spending_County ASC;

-- Check Average Spening to the third decial By Hospital
SELECT 
    hgi.Facility_ID,
    hgi.City_Town,
    hgi.State,
    RIGHT('00000' + CAST(hgi.ZIP_Code AS VARCHAR(5)), 5) AS Zip_Code,
    ROUND(hq.Value,3) AS Average_Spending
FROM 
    dbo.Hospital_General_Information hgi
    JOIN dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq 
    ON hgi.Facility_ID = hq.Facility_ID
WHERE 
    hq.value IS NOT NULL
ORDER BY 
    Average_Spending;

-- CTE to check average per state compared to each hospital
WITH StateAverages AS (
    -- Calculate average spending per state
    SELECT 
        hgi.State,
        ROUND(AVG(hq.Value), 3) AS State_Avg_Spending
    FROM 
        dbo.Hospital_General_Information hgi
    JOIN 
        dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq 
        ON hgi.Facility_ID = hq.Facility_ID
    GROUP BY 
        hgi.State
)

SELECT 
    hgi.State,
    hgi.Facility_Name,
    hgi.Hospital_Ownership,
    ROUND(hq.Value, 3) AS Hospital_Spending,
    sa.State_Avg_Spending,
    ROUND((hq.Value - sa.State_Avg_Spending), 3) AS Spending_Difference_vs_State,
    CASE 
        WHEN hq.Value < sa.State_Avg_Spending THEN 'More Efficient (Below State Avg)'
        WHEN hq.Value > sa.State_Avg_Spending THEN 'Less Efficient (Above State Avg)'
        ELSE 'Equal to State Avg'
    END AS Efficiency_Status
FROM 
    dbo.Hospital_General_Information hgi
JOIN 
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq 
    ON hgi.Facility_ID = hq.Facility_ID
JOIN 
    StateAverages sa ON hgi.State = sa.State
WHERE hq.Value IS NOT NULL
ORDER BY 
    hgi.State,
    Spending_Difference_vs_State;

-- Average Spending by Hospital Ownership
SELECT 
    hgi.Hospital_Ownership,
    ROUND(AVG(hq.Value),3) AS Ownership_Average
FROM
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq
    ON hgi.Facility_ID = hq.Facility_ID
GROUP BY
    hgi.Hospital_Ownership
ORDER BY 
    Ownership_Average ASC;

-- Average Spending by Hospital Rating + More
SELECT
    hgi.Hospital_overall_rating,
    COUNT(hgi.Hospital_overall_rating) AS Rating_Count,
    ROUND(AVG(hq.Value), 3) AS Average_Spending,
    ROUND(STDEV(hq.Value), 3) AS Spending_StDev,
    ROUND(MIN(hq.Value),3) AS Min_Spending,
    ROUND(MAX(hq.Value),3) AS Max_Spending
FROM
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq
    ON hgi.Facility_ID = hq.Facility_ID
WHERE
    hq.Value IS NOT NULL
GROUP BY
    hgi.Hospital_overall_rating
ORDER BY
    hgi.Hospital_overall_rating;

-- Patient Experience vs Spending
SELECT
    hgi.Facility_ID,
    hgi.Facility_Name,
    RIGHT('00000' + CAST(hgi.ZIP_Code AS VARCHAR(5)), 5) AS Zip_Code,
    hgi.Hospital_overall_rating,
    ROUND(hq.Value,3) as Value,
    ROUND(hgi.Hospital_overall_rating/ Value, 3) AS Spending_to_Rating_Ratio
FROM
    dbo.Hospital_General_Information hgi
JOIN
    dbo.HOSPITAL_QUARTERLY_MSPB_6_DECIMALS hq
    ON hgi.Facility_ID = hq.Facility_ID
WHERE
    Value IS NOT NULL 
    AND hgi.Hospital_overall_rating IS NOT NULL
    AND hgi.Hospital_overall_rating <> 'Not Available'
ORDER BY
    Spending_to_Rating_Ratio ASC;