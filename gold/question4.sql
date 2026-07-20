-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Gold - Analysis
-- Author: Hadi Hussain
-- Date: July 2026
-- Question: Rank boroughs within each major 
--           crime category by total crimes
-- Result: Westminster ranks 1st in most categories
--         including Theft, Robbery, Drug Offences
--         Ealing ranks 1st for Vehicle Offences
--         Croydon ranks 1st for Violence Against Person
--         Kingston upon Thames consistently lowest
-- Note: Uses RANK() window function with 
--       PARTITION BY major_category
-- ============================================
With total_crime As (
	Select
	borough,
	major_category,
	Sum(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24 + january_25 + february_25 + march_25 + april_25 + may_25 + june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25 + january_26 + february_26 + march_26 + april_26 + may_26) As total_number
	from silver_crime
	Group by borough,major_category
)
Select
borough,
major_category,
total_number,
rank() Over (partition by major_category Order by total_number desc) As rank

from total_crime
