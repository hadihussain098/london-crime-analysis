-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Silver - Load
-- Author: Hadi Hussain
-- Date: June 2026
-- Description: Creates silver_crime table with
--              correct data types and loads
--              cleaned data from bronze layer
-- Fixes Applied:
--   1. minor_category " character removed
--   2. PUBLIC FEAR renamed correctly
--   3. Borough ALARM OR DISTRESS fixed
--   4. All month columns converted to INT
-- ============================================

-- ============================================
-- CREATE SILVER TABLE
-- ============================================
DROP TABLE IF EXISTS silver_crime;
CREATE TABLE silver_crime(
    major_category varchar(200),
    minor_category varchar(200),
    borough varchar(200),
    june_24 int,
    july_24 int,
    august_24 int,
    september_24 int,
    october_24 int,
    november_24 int,
    december_24 int,
    january_25 int,
    february_25 int,
    march_25 int,
    april_25 int,
    may_25 int,
    june_25 int,
    july_25 int,
    august_25 int,
    september_25 int,
    october_25 int,
    november_25 int,
    december_25 int,
    january_26 int,
    february_26 int,
    march_26 int,
    april_26 int,
    may_26 int
);
Insert into silver_crime(
	major_category,
	minor_category,
	borough,
	june_24,
	july_24,
	august_24,
	september_24,
	october_24,
	november_24,
	december_24,
	january_25,
	february_25,
	march_25,
	april_25,
	may_25,
	june_25,
	july_25,
	august_25,
	september_25,
	october_25,
	november_25,
	december_25,
	january_26,
	february_26,
	march_26,
	april_26,
	may_26
)

Select 
major_category,
Case 
	when minor_category = '"PUBLIC FEAR' then 'PUBLIC FEAR, ALARM OR DISTRESS'
	else minor_category

End As minor_category,
Case
	when borough like  '% ALARM OR DISTRESS"%' then Trim(june_24)
	else Trim(borough)
End As borough,
try_cast(june_24 As int) As june_24,
try_cast(july_24 As int) As july_24,
try_cast(august_24 As int) As august_24,
try_cast(september_24 As int) as september_24,
try_cast(october_24 As int) As october_24,
try_cast(november_24 As int) As november_24,
try_cast(december_24 As int) As december_24,
try_cast(january_25 As int) As january_25,
try_cast(february_25 AS int) As february_25,
try_cast(march_25 AS int) As march_25,
try_cast(april_25 AS int) As april_25,
try_cast(may_25 As int) As may_25,
TRY_CAST(june_25 AS INT) as june_25,
TRY_CAST(july_25 AS INT) as july_25,
TRY_CAST(august_25 AS INT) as august_25,
TRY_CAST(september_25 AS INT) as september_25,
TRY_CAST(october_25 AS INT) as october_25,
TRY_CAST(november_25 AS INT) as november_25,
TRY_CAST(december_25 AS INT) as december_25,
TRY_CAST(january_26 AS INT) as january_26,
TRY_CAST(february_26 AS INT) as february_26,
TRY_CAST(march_26 AS INT) as march_26,
TRY_CAST(april_26 AS INT) as april_26,
TRY_CAST(may_26 AS INT) as may_26

from london_crime

