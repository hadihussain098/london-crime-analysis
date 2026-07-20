# London Crime Analysis 🔍

## Project Overview
This project analyses London Metropolitan Police crime data 
using SQL and Medallion Architecture (Bronze → Silver → Gold).
The goal is to identify which London boroughs have the highest 
crime rates, what types of crime are most common, and whether 
crime is increasing or decreasing over time.

---

## Business Question
**"Which London boroughs have the highest crime rates, 
what types of crime are most prevalent, 
and is crime getting better or worse over time?"**

---

## Tools Used
- SQL Server (SSMS)
- GitHub

---

## Data Source
- Metropolitan Police Service
- Source: data.london.gov.uk
- Dataset: MPS Borough Level Crime
- Period: June 2024 to May 2026
- 993 rows across 33 London boroughs

---

## Project Architecture
This project follows the Medallion Architecture:

**Bronze Layer** → Raw data loaded as is from CSV
**Silver Layer** → Data cleaned, types enforced, issues fixed
**Gold Layer**   → Analysis queries answering business questions

---

## Data Quality Issues Found & Fixed
- `minor_category` had corrupted value `"PUBLIC FEAR` 
  renamed to `PUBLIC FEAR, ALARM OR DISTRESS`
- 32 rows had column shift issue caused by comma 
  in category name during CSV bulk insert
- Borough names recovered from shifted columns
- All month columns converted from VARCHAR to INT 
  using TRY_CAST

---

## Key Findings

### Finding 1 — Westminster is London's Crime Capital
Westminster had the highest total crime count with 
**164,548 crimes** across all months — almost double 
Camden in second place with 80,310.

### Finding 2 — Theft Dominates London Crime
Theft is by far the most common crime type with 
**597,572 total crimes** — significantly ahead of 
Violence Against the Person in second place with 484,033.
Top 2 categories have nearly double the crimes of 
the bottom 3 combined.

### Finding 3 — Westminster Improving Despite High Numbers
Despite having the highest total crime, Westminster showed 
the **biggest decrease** between 2024 and 2025 with 
-4,682 crimes. Meanwhile Wandsworth showed the biggest 
increase at +1,629 crimes.

### Finding 4 — Most Boroughs Consistently High Crime
**28 out of 33 London boroughs** average more than 
1,000 crimes per month — showing crime is a widespread 
issue across the capital, not isolated to a few areas.

---

## Folder Structure
ondon-crime-analysis/
│
├── bronze/
│     └── bronze_crime.sql
│
├── silver/
│     ├── silver_Exploration.sql
│     └── silver_crime.sql
│
├── gold/
│     ├── question1.sql
│     ├── question2.sql
│     ├── question3.sql
│     ├── question4.sql
│     └── question5.sql
│
└── README.md
---

## Author
**Hadi Hussain**
Data Analyst | SQL | Python
📍 London, UK
