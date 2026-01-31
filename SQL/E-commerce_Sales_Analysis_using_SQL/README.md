📊 E-commerce Sales Analysis using SQL (PostgreSQL)

🚀 Project Overview

This project simulates a real-world e-commerce analytics use case where raw transactional data is analyzed using SQL (PostgreSQL) to answer critical business questions. The goal is to demonstrate strong fundamentals in data modeling, SQL querying, and business thinking, similar to what is expected from a Data Analyst in industry.

The project follows a business-first approach: instead of random queries, all analysis is driven by clear business questions.

_________________________________________________________________________________________________________________________________________________________________

🧱 Data Model (Star Schema)
Fact Table

orders → order metadata (date, status)

order_items → transactional-level data (quantity, discount, product per order)

Dimension Tables

customers → customer details

products → product and category information

_________________________________________________________________________________________________________________________________________________________________

📌 Business Questions Answered

Monthly revenue trend (Year + Month)

Month-over-Month revenue growth (%)

Top customers by revenue

Repeat vs new customer analysis

Average Order Value (AOV)

Revenue by product category

Customer retention overview

Cancelled & returned order percentage

Top 10 revenue-generating customers

Best-selling products by quantity & revenue

_________________________________________________________________________________________________________________________________________________________________

🧠 Key SQL Concepts Used

INNER JOINs across fact & dimension tables

GROUP BY & aggregations

CASE WHEN logic

CTEs (WITH clause)

DISTINCT counts

Date functions (YEAR, MONTH)

Business-safe filtering (Completed orders only)

_________________________________________________________________________________________________________________________________________________________________

🧪 Tools & Technologies

PostgreSQL

SQL

GitHub (version control)
