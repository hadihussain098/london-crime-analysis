-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Gold - Analysis
-- Author: Hadi Hussain
-- Date: July 2026
-- Question: Which boroughs have an average of
--           more than 1000 crimes per month?
-- Result: 28 out of 33 boroughs exceed 1000
--         Westminster highest at 5,484 avg
--         Bexley lowest qualifying at 1,069 avg
--         Only 5 boroughs below 1000 threshold
-- ============================================
Select
borough,
Avg(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24 + january_25 + february_25 + march_25 + april_25 + may_25 + june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25 + january_26 + february_26 + march_26 + april_26 + may_26) As avg_number

from silver_crime
Group by borough
Having Avg(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24 + january_25 + february_25 + march_25 + april_25 + may_25 + june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25 + january_26 + february_26 + march_26 + april_26 + may_26) > 1000
Order by avg_number Desc