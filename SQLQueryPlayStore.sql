

-- Convert Rating to float
ALTER TABLE googleplaystore
ALTER COLUMN Rating FLOAT;

-- Set Size to empty string where it's NULL
UPDATE googleplaystore
SET Size = ''
WHERE Size IS NULL;

-- Clean Size column
UPDATE googleplaystore
SET Size = TRY_CAST(REPLACE(Size, 'M', '') AS FLOAT)
WHERE TRY_CAST(REPLACE(Size, 'M', '') AS FLOAT) IS NOT NULL;

-- Clean Installs column
UPDATE googleplaystore
SET Installs = REPLACE(REPLACE(Installs, '+', ''), ',', '');

-- Convert Installs to numeric
UPDATE googleplaystore
SET Installs = TRY_CAST(Installs AS FLOAT);


-- Clean Installs column
UPDATE googleplaystore
SET Installs = REPLACE(REPLACE(Installs, '+', ''), ',', '');

-- Convert Installs to numeric
UPDATE googleplaystore
SET Installs = CASE 
                 WHEN Installs = '' THEN NULL  -- Handle empty string case
                 ELSE TRY_CAST(Installs AS FLOAT)
               END;

-- Check your data
SELECT TOP 100 * FROM googleplaystore;  -- Adjust as needed to inspect your data