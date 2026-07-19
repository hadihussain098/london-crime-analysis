-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Bronze
-- Author: Your Name
-- Date: June 2026
-- Description: Load raw CSV data into SQL Server
--              as is with no transformations
-- Source: Metropolitan Police / data.london.gov.uk
-- ============================================

-- ============================================
-- DROP AND CREATE TABLE
-- All columns loaded as VARCHAR to avoid
-- data type errors during raw data load
-- ============================================
DROP TABLE IF EXISTS london_crime;

CREATE TABLE london_crime(
    major_category varchar(100),
    minor_category varchar(100),
    borough varchar(100),
    june_24 varchar(50),
    july_24 varchar(50),
    august_24 varchar(50),
    september_24 varchar(50),
    october_24 varchar(50),
    november_24 varchar(50),
    december_24 varchar(50),
    january_25 varchar(50),
    february_25 varchar(50),
    march_25 varchar(50),
    april_25 varchar(50),
    may_25 varchar(50),
    june_25 varchar(50),
    july_25 varchar(50),
    august_25 varchar(50),
    september_25 varchar(50),
    october_25 varchar(50),
    november_25 varchar(50),
    december_25 varchar(50),
    january_26 varchar(50),
    february_26 varchar(50),
    march_26 varchar(50),
    april_26 varchar(50),
    may_26 varchar(50)
);
-- ============================================
-- BULK INSERT RAW DATA
-- Loading raw CSV file as is into bronze table
-- No cleaning or transformation at this stage
-- ============================================
BULK INSERT london_crime
FROM 'C:\Users\hadih\OneDrive\Desktop\London_data\london_crime.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
-- ============================================
-- VERIFY DATA LOAD
-- ============================================
-- Check immediately after
SELECT COUNT(*) as total_rows FROM london_crime;
SELECT TOP 10 * FROM london_crime;
