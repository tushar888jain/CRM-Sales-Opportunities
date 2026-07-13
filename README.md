# CRM-Sales-Opportunities
This project analyzes a B2B CRM sales pipeline dataset using SQL. The objective is to explore the data, perform data quality checks, combine multiple tables, and answer business questions related to sales performance, products, customers, and sales teams.

## Dataset

The dataset consists of four related tables:

- Accounts
- Products
- Sales Pipeline
- Sales Teams

---

## Objectives

- Explore and understand the dataset
- Perform data quality checks
- Combine multiple tables using SQL joins
- Analyze sales performance
- Identify top-performing products and sales agents
- Practice intermediate and advanced SQL concepts

---

## SQL Skills Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- CASE Statements
- Subqueries
- Common Table Expressions (CTEs)
- Views
- Window Functions (RANK, DENSE_RANK)

---

## Business Questions Answered

- How many opportunities are in the sales pipeline?
- Which sales agents generated the highest revenue?
- Which products generated the most revenue?
- Which sectors contributed the highest revenue?
- Which managers led the highest-performing teams?
- What is the average deal value?
- Which accounts generated the highest revenue?

---

## Project Workflow

### Phase 1 – Data Exploration
- Examined table structures
- Explored records from each table
- Identified primary and foreign keys

### Phase 2 – Data Quality Checks
- Checked duplicate opportunity IDs
- Validated NULL values
- Verified dataset consistency

### Phase 3 – Data Modelling
- Joined Accounts, Products, Sales Pipeline and Sales Teams
- Built a unified dataset for analysis

### Phase 4 – Business Analysis
- Analysed revenue by product, sector, manager and sales agent
- Ranked top-performing sales agents
- Calculated average deal value
- Categorised deals into value tiers using CASE statements
- Compared performance using CTEs and Window Functions

---

## Key Insights

- Identified the highest-performing sales agents based on total revenue.
- Determined which products and customer sectors generated the highest revenue.
- Compared manager and regional office performance.
- Classified opportunities into High, Medium and Low value segments.
- Ranked agents and products using SQL window functions.
- Identified agents performing above the average revenue benchmark.

---

## Business Recommendations

- Recognise and replicate the sales strategies of top-performing sales agents across the wider sales team.
- Focus future sales efforts on the highest-performing products and customer sectors.
- Monitor regional and managerial performance to identify opportunities for improvement.
- Prioritise high-value opportunities to maximise overall revenue growth.


## Files

- CRM SALES.1-SQL(project).sql
- README.md

---

## Tools Used

- MySQL Workbench
- SQL
