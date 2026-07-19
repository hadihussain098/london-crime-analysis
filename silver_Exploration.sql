-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Silver - Exploration
-- Author: Hadi Hussain
-- Date: June 2026
-- Description: Data exploration and quality checks
--              on bronze layer data before cleaning
--              Checks performed on each column:
--              extra spaces, nulls, empty strings,
--              spelling mistakes, unexpected values
-- ============================================



-- Wanted to check for unwanted space between the text

Select 
major_category
from london_crime
where trim(major_category) != major_category

-- checking for empty strings in major category
Select
*
from london_crime
where major_category = ''

--Checking if same category spelled differently

Select
major_category,
count(major_category) As total_count
from london_crime
Group by major_category
Order by count(major_category) Desc

-- Checking for null in major_category
Select 
major_category
from london_crime
where major_category is null

-- Data cleaning check for minor_category
-- Checking for extra spaces
Select
minor_category
from london_crime
where trim(minor_category) != minor_category

-- checking for null in minor_category
Select
minor_category
from london_crime
where minor_category is null

-- checking for distinct names in minor_categories
Select
distinct minor_category
from london_crime
-- spelling mistake in public Fear
Select
major_category,
minor_category
from london_crime
where minor_category = '"Public Fear'
-- fixing the spelling mistake in public Fear
Select
	TRIM(REPLACE(minor_category, '"', ''))
from london_crime

-- checking for empty strings in minor_category
Select
*
from london_crime
where minor_category = ''

-- fixing the alarm and distress in minor_category column
Select
Case 
	when minor_category = '"PUBLIC FEAR' then 'PUBLIC FEAR, ALARM OR DISTRESS'
	else minor_category

End As minor_category
from london_crime

-- checking for empty spaces in borugh column

Select
*
from london_crime
where borough = ' ALARM OR DISTRESS"'

-- checking for null values
Select
*
from london_crime
where borough is null

-- Checking for empty string in borough column
Select
borough
from london_crime
where borough = ''

-- fixing the data quality issue in borough column where is has data from the minor_cateogory
Select
Case
	when borough like  '% ALARM OR DISTRESS"%' then june_24
	else borough
End As borough
From london_crime



-- fixing the data quality issue in june 24 it has some data from borough
Select
Case
	When borough like '% ALARM OR DISTRESS"%' then july_24
	else june_24 
End As june_24
from london_crime
-- Checking for null value in june_24
Select
june_24
from london_crime

where june_24 is null

-- Checking for empty strings in june_24
Select
june_24
from london_crime
where june_24 = ''

-- checking for negative numbers
Select
june_24
from london_crime
WHERE june_24 LIKE '-%'

-- checking for isnumeric
Select
isnumeric(june_24)
from london_crime
where isnumeric(june_24) = 0

-- fixing the data quality for july

Select
Case
	When borough like '% ALARM OR DISTRESS"%' then august_24
	else july_24 
End As july_24
from london_crime 

-- fixing the data quality for august
Select
Case
	When borough like '% ALARM OR DISTRESS"%' then september_24
	else august_24
End As august_24
from london_crime 
-- fixing the data quality for september 24
Select
Case
	When borough like '% ALARM OR DISTRESS"%' then october_24
	else september_24 
End As september_24
from london_crime 

-- fixing the data quality for october 24
Select
Case
	When borough like '% ALARM OR DISTRESS"%' then november_24
	else october_24 
End As october_24
from london_crime
-- may_26 is lost for 32 corrupted rows due to column shift
-- Decision: Forward fill using april_26 value
-- Reason: 32 rows = 3.2% of data, minimal impact
-- Forward fill chosen over NULL or mean imputation
-- as it reflects most recent known value for that borough
-- NOTE: november_24 through april_26 follow 
-- exact same pattern as june_24 to october_24
-- Checks and fixes assumed consistent 
-- Same CASE shift logic applies to all months
-- Individual queries omitted to avoid repetition