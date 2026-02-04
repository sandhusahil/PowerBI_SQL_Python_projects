# 📊 E-commerce Sales Analysis using SQL (PostgreSQL)

## 🚀 Project Overview
This project simulates a real-world **e-commerce analytics use case** where raw transactional data is analyzed using **SQL (PostgreSQL)** to answer critical business questions.

The goal is to demonstrate strong fundamentals in:
- Data modeling  
- SQL querying  
- Business-oriented analytical thinking  

— exactly what is expected from a **Data Analyst in industry**.

> 🔹 The project follows a **business-first approach**:  
> all analysis is driven by clear business questions rather than random queries.

---

## 🧱 Data Model (Star Schema)

### Fact Tables
- **orders** → Order metadata (date, status)
- **order_items** → Transaction-level data (quantity, discount, product per order)

### Dimension Tables
- **customers** → Customer details  
- **products** → Product and category information  

---

## 📌 Business Questions Answered
- Monthly revenue trend (Year + Month)
- Month-over-Month (MoM) revenue growth (%)
- Top customers by revenue
- Repeat vs new customer analysis
- Average Order Value (AOV)
- Revenue by product category
- Customer retention overview
- Cancelled & returned order percentage
- Top 10 revenue-generating customers
- Best-selling products by quantity & revenue

---

## 🧠 Key SQL Concepts Used
- `INNER JOIN` across fact & dimension tables
- `GROUP BY` with aggregations
- `CASE WHEN` logic
- Common Table Expressions (CTEs using `WITH`)
- `DISTINCT` counts
- Date functions (`YEAR`, `MONTH`)
- Business-safe filtering (Completed orders only)

---

## 🧪 Tools & Technologies
- **PostgreSQL**
- **SQL**
- **GitHub** (Version Control)
