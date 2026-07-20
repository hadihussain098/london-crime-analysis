-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Gold - Analysis
-- Author: Hadi Hussain
-- Date: July 2026
-- Question: Which boroughs saw the biggest 
--           increase or decrease in total crime
--           between 2024 and 2025?
-- Method: Comparing June-December for both years
--         to ensure fair like for like comparison
-- Result: Westminster biggest decrease -4,682
--         Wandsworth biggest increase +1,629
--         Camden second biggest decrease -1,134
-- Note: Westminster had highest total crime in Q1
--       but also showed biggest improvement here
--       showing a positive downward trend
-- ============================================with calculate_yearly As (
	Select
	borough,
	Sum(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24) As year_24,
	Sum(june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25) As year_25
	from silver_crime
	Group by borough
)
Select
borough,
year_24,
year_25,
(year_25 - year_24) As differ
from calculate_yearly
Order By differ Desc