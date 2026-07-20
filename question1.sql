--- Q1 — Which London boroughs have the highest total number of crimes across all months combined?
-- ============================================
-- LONDON CRIME ANALYSIS

-- ============================================

-- Layer: Gold - Analysis
-- Author: Hadi Hussain
-- Date: July 2026
-- Question: Which boroughs have highest total crime?
--Result: Westminster highest with 164,548 total crimes
-- followed by Camden 80310 and newham 80277
-- ============================================



Select
borough,
Sum(june_24 + july_24 + august_24 + september_24 + october_24 + november_24 + december_24 + january_25 + february_25 + march_25 + april_25 + may_25 + june_25 + july_25 + august_25 + september_25 + october_25 + november_25 + december_25 + january_26 + february_26 + march_26 + april_26 + may_26) As total_number
from silver_crime
Group by borough
Order By total_number Desc