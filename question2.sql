-- ============================================
-- LONDON CRIME ANALYSIS
-- Layer: Gold - Analysis
-- Author: Hadi Hussain
-- Date: July 2026
-- Question: What are the top 5 most common 
--           crime types across London?
-- Result: Theft most common with 597,572 crimes
--         Violence Against Person second 484,033
--         Vehicle Offences third 177,760
--         Arson and Criminal Damage 110,796
--         Drug Offences 100,223
--         Notable: Top 2 categories have double
--         the crimes of bottom 3!
-- ============================================
Select Top 5
major_category,
Sum(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24 + january_25 + february_25 + march_25 + april_25 + may_25 + june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25 + january_26 + february_26 + march_26 + april_26 + may_26) As total_number

from silver_crime
Group by major_category
Order by total_number Desc


