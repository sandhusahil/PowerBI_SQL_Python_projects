# APL Logistics — Supply Chain Analytics & Delivery Performance

**Delivery Performance, Delay Risk & Logistics Efficiency Analysis in Global Supply Chain Operations**

An end-to-end **Data Analytics and Power BI project** focused on analyzing delivery performance, shipment delays, late-delivery risk, shipping-mode efficiency, customer-segment impact, and regional/market logistics performance using supply-chain order data.

**Prepared by:** Sahil Sandhu
**Tools:** Python • SQL • Power BI • DAX • Power Query • Excel
**Domain:** Supply Chain & Logistics Analytics

---

## 🔗 Live Power BI Dashboard

### [View Interactive Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZGU1MDM0OGMtODUzMi00Yzc0LWE2N2EtZGY1OGFiYjU0YTRhIiwidCI6ImRhNjFlMGYwLWFmMWEtNDdiNC1iYWU5LTMwMTFhM2EzMmY1YSJ9)

The interactive dashboard provides four analytical modules:

* **Delivery Performance Overview**
* **Delay Risk Analysis**
* **Shipping Mode Comparison**
* **Regional & Market Diagnostics**

---

# 📌 Project Overview

Modern supply-chain operations generate large volumes of shipment data, making it difficult to identify delivery delays, understand their severity, determine high-risk shipping modes, and locate geographical areas experiencing elevated delivery risk.

This project analyzes supply-chain delivery data to provide a structured view of:

* Overall delivery performance
* On-time, early, and delayed deliveries
* Late-delivery risk
* Delay severity
* Shipping-mode performance
* Customer-segment impact
* Regional and market-level risk
* Country-level delayed-order concentration
* Regional and market delay intensity
* SLA compliance
* Logistics efficiency

The final output is an interactive Power BI dashboard designed to help logistics teams move from **reactive delay monitoring toward data-driven preventive analysis**.

---

# 🎯 Business Problem

The analysis addresses the following business problems:

1. Lack of clear measurement of **on-time vs delayed deliveries**.
2. Limited visibility into the **severity and magnitude of shipment delays**.
3. Difficulty identifying **high-risk shipping modes**.
4. Lack of visibility into **high-risk regions, countries, and markets**.
5. Need for diagnostics to explain the distribution of **`late_delivery_risk`**.
6. Need to understand how delivery performance varies across **customer segments**.
7. Need to evaluate **SLA exposure and shipping-mode efficiency**.

---

# 🎯 Project Objectives

The primary objectives are to:

* Measure overall delivery performance.
* Calculate the delivery gap between actual and scheduled shipping duration.
* Classify shipments as **Early, On Time, or Delayed**.
* Analyze the distribution of late-delivery risk.
* Compare delivery performance across shipping modes.
* Identify shipping modes with higher delay frequency and severity.
* Analyze delivery risk across regions, countries, and markets.
* Examine the effect of customer segment on delivery performance.
* Measure SLA compliance.
* Develop Regional and Market Delay Indices.
* Provide an interactive dashboard for exploring logistics performance.

---

# 📊 Key Performance Indicators

| KPI                                | Description                                                                        |
| ---------------------------------- | ---------------------------------------------------------------------------------- |
| **On-Time Delivery Rate (%)**      | Percentage of orders delivered within the scheduled time                           |
| **Average Delivery Delay (Days)**  | Mean positive difference between actual and scheduled shipping days                |
| **Late Delivery Risk Ratio**       | Proportion of shipments with `late_delivery_risk = 1`                              |
| **Shipping Mode Efficiency Index** | Project-defined comparison of scheduled shipping time against actual shipping time |
| **Regional Delay Index**           | Project-defined measure of delay intensity across regions                          |
| **Market Delay Index**             | Project-defined measure of delay intensity across markets                          |

> **Note:** The Shipping Mode Efficiency Index and Regional/Market Delay Index are project-defined analytical metrics created specifically for this analysis and should not be interpreted as universal industry-standard formulas.

---

# 🧮 Analytical Methodology

## 1. Data Cleaning & Validation

The dataset was first validated and prepared for analysis.

The preparation process included:

* Validation of shipping-duration fields.
* Removal of inconsistent records.
* Removal of duplicate records.
* Validation of missing values.
* Validation of negative shipping-duration values.
* Standardization and validation of region and market information.

During cleaning:

* **11 records were removed.**
* **2 duplicate rows were removed.**
* No missing values were identified in the validated dataset.
* Negative values in the relevant shipping-duration fields were checked and found to be zero.

The cleaned dataset was exported as:

`APL_Logistics_Cleaned.csv`

---

# 2. Delivery Gap Calculation

A central metric in the project is the **Delivery Gap**.

### Formula

```text
Delivery Gap =
Days for shipping (real) − Days for shipment (scheduled)
```

Interpretation:

| Delivery Gap | Classification |
| -----------: | -------------- |
|        `< 0` | Early          |
|        `= 0` | On Time        |
|        `> 0` | Delayed        |

The project additionally categorizes positive delays into severity levels.

### Delay Severity

```text
Delay Gap <= 0  → No Delay
Delay Gap <= 2  → Low
Delay Gap <= 5  → Medium
Delay Gap > 5   → High
```

The final dataset contained:

* **No Delay:** 77,118
* **Low:** 89,364
* **Medium:** 14,035
* **High:** No records

---

# 3. Delivery Classification

The final dashboard contains three delivery classifications:

* **Delayed**
* **Early**
* **On Time**

The overall distribution was:

| Delivery Class |      Orders | Percentage |
| -------------- | ----------: | ---------: |
| Delayed        |     103,399 |     57.28% |
| Early          |      43,365 |     24.02% |
| On Time        |      33,753 |     18.70% |
| **Total**      | **180,517** |   **100%** |

The dashboard therefore shows that delayed shipments represent the largest delivery-class group in the analyzed data.

---

# 📈 Overall Performance Results

The final dashboard reports:

| KPI                       |        Result |
| ------------------------- | ------------: |
| **Total Orders**          |   **180,517** |
| **On-Time Delivery Rate** |    **42.72%** |
| **Average Delay (+)**     | **1.62 days** |
| **Late Delivery Risk**    |    **54.83%** |

The dashboard also provides the distribution of `late_delivery_risk`:

| Late Delivery Risk | Orders | Percentage |
| ------------------ | -----: | ---------: |
| Risk = 1           | 98,976 |     54.83% |
| Risk = 0           | 81,541 |     45.17% |

These values establish the baseline delivery-performance profile for the dataset.

---

# 🚚 Shipping Mode Analysis

The project evaluates the four shipping modes present in the dataset:

* Standard Class
* Second Class
* First Class
* Same Day

Shipping modes are analyzed using:

* Average delay
* Delivery status
* Scheduled shipping time
* Actual shipping time
* Shipping Mode Efficiency Index
* SLA Compliance

---

## Scheduled vs Actual Shipping Time

The analysis compares:

```text
Average Scheduled Shipping Days
vs.
Average Actual Shipping Days
```

This helps identify the difference between the expected shipping duration and the observed shipping duration for each mode.

---

# ⚙️ Shipping Mode Efficiency Index

The project defines the Shipping Mode Efficiency Index as:

```text
Shipping Mode Efficiency Index =
Scheduled Shipping Days
----------------------- × 100
Actual Shipping Days
```

DAX implementation:

```DAX
Shipping Mode Efficiency Index =
IF(
    [Avg Scheduled Shipping Days] = 0,
    BLANK(),
    DIVIDE(
        [Avg Scheduled Shipping Days],
        [Avg Actual Shipping Days]
    ) * 100
)
```

A higher value indicates that actual shipping duration is closer to the scheduled duration under this project-specific metric.

For **Same Day**, the scheduled duration is zero, so the index is treated as not applicable rather than dividing by zero.

---

# 📋 SLA Compliance

SLA compliance is defined in the project as:

```text
SLA Compliance =
(Early Orders + On-Time Orders)
-------------------------------- × 100
Total Orders
```

DAX implementation:

```DAX
SLA Compliance % =
COALESCE(
    DIVIDE(
        CALCULATE(
            COUNTROWS('Supply Chain'),
            'Supply Chain'[Delivery_Class]
                IN {"Early", "On Time"}
        ),
        COUNTROWS('Supply Chain'),
        0
    ),
    0
)
```

This provides a shipping-mode-level view of the proportion of shipments that met or beat the scheduled delivery classification.

---

# 👥 Customer Segment Analysis

The dashboard evaluates delivery risk across customer segments.

The analysis considers:

* Late delivery risk percentage
* Delivery classification
* SLA exposure

Customer segments represented in the dashboard include:

* Consumer
* Corporate
* Home Office

This analysis helps identify whether delivery-risk exposure differs between customer groups.

---

# 🌍 Regional & Market Diagnostics

The fourth dashboard module focuses on geographical performance.

The analysis covers:

* Order Region
* Order Country
* Market
* Late Delivery Risk
* Delayed Order Volume
* Regional Delay Index
* Market Delay Index

---

## Regional Late Delivery Risk

The dashboard compares `Late Delivery Risk %` across Order Regions.

This helps identify regions with relatively higher exposure to late-delivery risk.

The analysis also demonstrates that regional risk values are relatively close to one another rather than being concentrated in a single extreme region.

---

# 🌎 Country-Level Delayed Orders

Instead of relying only on late-risk percentages, the dashboard also analyzes the **number of delayed orders by country**.

This distinction is important because a country with a small number of shipments can have a very high risk percentage while contributing relatively few delayed shipments overall.

The dashboard therefore uses:

```text
Delayed Orders
```

to identify countries with greater concentrations of delayed shipments.

---

# 📐 Regional Delay Index

The project defines the Regional Delay Index as the average positive Delivery Gap among delayed shipments:

```DAX
Regional Delay Index =
CALCULATE(
    AVERAGE('Supply Chain'[Delay Gap]),
    'Supply Chain'[Delay Gap] > 0
)
```

This metric focuses on **delay intensity**, rather than simply the frequency of risk.

For example, the final dashboard shows:

| Region          | Regional Delay Index |
| --------------- | -------------------: |
| Central Asia    |                 1.68 |
| Eastern Asia    |                 1.65 |
| West of USA     |                 1.64 |
| South of USA    |                 1.64 |
| Northern Europe |                 1.63 |

The overall average delay shown in the dashboard is **1.62 days**.

---

# 🌐 Market Delay Index

The same delay-intensity methodology is applied at the market level.

This enables comparison of markets based on the average magnitude of positive delivery gaps rather than only the percentage of shipments classified as risky.

Markets represented in the dashboard include:

* Pacific Asia
* USCA
* Europe
* LATAM
* Africa

---

# 🔎 Regional & Market Diagnostic Matrix

The final dashboard contains a consolidated diagnostic matrix combining:

* Order Region
* Late Delivery Risk %
* Average Delay for Delayed Orders

Examples from the final dashboard include:

| Region          | Late Delivery Risk % | Avg Delay (Delayed Orders) |
| --------------- | -------------------: | -------------------------: |
| Canada          |               48.80% |                       1.61 |
| Caribbean       |               53.08% |                       1.62 |
| Central Africa  |               57.96% |                       1.60 |
| Central America |               54.75% |                       1.61 |
| Central Asia    |               55.33% |                       1.68 |
| East Africa     |               55.94% |                       1.59 |
| East of USA     |               55.66% |                       1.60 |
| Eastern Asia    |               54.33% |                       1.65 |
| Eastern Europe  |               55.66% |                       1.62 |
| North Africa    |               54.52% |                       1.60 |
| **Total**       |           **54.83%** |                   **1.62** |

This combined view allows risk frequency and delay intensity to be evaluated together.

---

# 📑 Dashboard Structure

The Power BI report consists of four analytical pages.

## Page 1 — Delivery Performance Overview

Focus:

* Overall KPIs
* Delivery classification
* Late-delivery risk distribution
* Average delay gap by shipping mode
* Average delay gap by region
* Interactive report filters

Key KPIs:

* Total Orders: **180,517**
* On-Time Delivery Rate: **42.72%**
* Average Delay: **1.62 days**
* Late Delivery Risk: **54.83%**

---

## Page 2 — Delay Risk Analysis

Focus:

* Delay severity
* Late-delivery risk by shipping mode
* Delivery classification by shipping mode
* Late-delivery risk by customer segment

This page provides a deeper diagnostic view of delivery-risk exposure.

---

## Page 3 — Shipping Mode Comparison

Focus:

* Average delay among delayed orders
* Delivery Status by Shipping Mode
* Scheduled vs Actual Shipping Time
* Shipping Mode Efficiency Index
* SLA Compliance %

This page compares the operational characteristics of each shipping mode.

---

## Page 4 — Regional & Market Diagnostics

Focus:

* Late Delivery Risk by Region
* Late Delivery Risk by Market
* Delayed Orders by Country
* Regional Delay Index
* Market Delay Index
* Regional & Market Diagnostic Matrix

This page provides the geographical diagnostic layer of the analysis.

---

# 🎛️ Interactive User Capabilities

The dashboard provides interactive filtering through synchronized slicers.

### Available filters

* **Shipping Mode**
* **Region**
* **Market**
* **Customer Segment**

These filters are available across the analytical pages and allow users to dynamically explore subsets of the supply-chain data.

> A date-range selector is not included because the analyzed dataset does not contain a suitable order, shipping, or delivery date field.

---

# 🛠️ Tools & Technologies

### Power BI

* Power BI Desktop
* Power BI Service
* Power Query
* DAX
* Interactive dashboards
* Slicers
* Conditional formatting
* KPI cards
* Bar charts
* Matrix visualizations

### Python

Used during the data preparation and analytical workflow for data validation and transformation.

Key libraries used/considered:

* Pandas
* NumPy
* Matplotlib
* Seaborn

### SQL

SQL was used as part of the analytical workflow for querying and analyzing structured supply-chain data.

### Excel

Used for supporting data inspection and validation where applicable.

---

# 📂 Dataset

The project uses a supply-chain order dataset containing operational, customer, product, financial, geographical, delivery, and shipping information.

Important fields used in the analysis include:

```text
Days for shipping (real)
Days for shipment (scheduled)
Delivery Status
Late_delivery_risk
Customer Segment
Market
Order Country
Order Region
Shipping Mode
```

Additional dataset attributes include customer, product, order, sales, profit, category, department, location, and payment information.

---

# 🧹 Data Quality & Preparation

The data preparation process focused on ensuring that the analytical fields were suitable for dashboard development.

Validation included:

* Missing-value checks
* Duplicate checks
* Shipping-duration validation
* Negative-value checks
* Region/market validation
* Delivery classification creation
* Delay-gap calculation
* Delay-severity classification

The cleaned dataset was used as the foundation for the Power BI analysis.

---

# 📌 Key Findings

The final dashboard provides several important observations from the analyzed dataset.

### 1. Delayed shipments represent the largest delivery class

**57.28%** of orders are classified as delayed, compared with **24.02% early** and **18.70% on time**.

### 2. Overall on-time performance is 42.72%

The dashboard's On-Time Delivery Rate is **42.72%**, providing the overall baseline for delivery performance.

### 3. Late-delivery risk is substantial

The overall `Late Delivery Risk %` is **54.83%**, with 98,976 orders carrying `late_delivery_risk = 1`.

### 4. Average positive delay is 1.62 days

Among shipments with a positive Delivery Gap, the dashboard reports an average delay of **1.62 days**.

### 5. Delay intensity differs across regions

Central Asia has a Regional Delay Index of **1.68 days**, while the overall value is **1.62 days**.

### 6. Risk and delay intensity measure different dimensions

Late Delivery Risk measures the **frequency/exposure to risk**, whereas the Regional and Market Delay Indices measure the **intensity of positive delivery gaps**.

This distinction allows the dashboard to identify both how frequently delivery problems occur and how severe they are.

---

# 📈 Business Value

The dashboard can support logistics analysis by enabling users to:

* Monitor overall delivery performance.
* Identify areas with elevated late-delivery risk.
* Compare shipping modes.
* Investigate delay severity.
* Identify geographical concentrations of delayed shipments.
* Compare customer-segment risk.
* Evaluate SLA exposure.
* Compare scheduled and actual shipping durations.
* Explore logistics performance interactively.

The analysis provides a structured foundation for identifying areas that may require further operational investigation.

---

# ⚠️ Limitations

Several limitations should be considered when interpreting the analysis:

1. The dataset does not contain a suitable date field, so temporal delivery trends cannot be analyzed.
2. The Shipping Mode Efficiency Index is a **project-defined metric**, not a universal industry-standard KPI.
3. The Regional and Market Delay Indices are also project-defined analytical metrics.
4. The dashboard identifies statistical patterns but does not establish causal relationships.
5. Additional operational information would be required to determine the specific root causes behind individual delays.
6. The analysis is based on the available dataset and therefore reflects the scope and quality of that data.

---

# 🚀 Future Scope

Future versions of the project could include:

* Time-series delivery-performance analysis if date fields become available.
* Predictive modeling for late-delivery risk.
* Machine-learning-based delay prediction.
* Root-cause analysis using additional operational variables.
* Customer-level SLA monitoring.
* Cost impact analysis of delayed shipments.
* Automated Power BI refresh pipelines.
* Integration with live logistics/transportation data.
* Route-level performance analysis.
* Alerting for high-risk shipments or regions.

---

# 📁 Suggested Repository Structure

```text
apl-logistics-supply-chain-analytics/
│
├── README.md
│
├── data/
│   └── APL_Logistics_Cleaned.csv
│
├── notebooks/
│   └── APL_Logistics_Data_Preparation.ipynb
│
├── sql/
│   └── supply_chain_analysis.sql
│
├── powerbi/
│   └── APL_Logistics.pbix
│
├── screenshots/
│   ├── page-1-delivery-performance.png
│   ├── page-2-delay-risk.png
│   ├── page-3-shipping-mode.png
│   └── page-4-regional-market.png
│
└── documentation/
    └── project-notes.md
```

> If the original dataset is subject to licensing, privacy, or redistribution restrictions, do not upload the raw dataset to a public repository. In that case, include the cleaned/sample data only if redistribution is permitted.

---

# 🧠 Skills Demonstrated

This project demonstrates practical experience in:

* Data Cleaning
* Data Validation
* Exploratory Data Analysis
* Supply Chain Analytics
* Logistics Analytics
* KPI Development
* Business Intelligence
* Power BI
* DAX
* Power Query
* SQL
* Python
* Data Visualization
* Dashboard Design
* Risk Analysis
* Geographic Analysis
* SLA Analysis
* Business Problem Solving

---

# 📜 Project Methodology Summary

```text
Raw Supply Chain Data
        ↓
Data Cleaning & Validation
        ↓
Shipping-Duration Validation
        ↓
Delivery Gap Calculation
        ↓
Delivery Classification
(Early / On Time / Delayed)
        ↓
Delay Severity Classification
        ↓
KPI Development
        ↓
Shipping Mode Analysis
        ↓
Customer Segment Analysis
        ↓
Regional / Country / Market Analysis
        ↓
Regional & Market Delay Indices
        ↓
Interactive Power BI Dashboard
        ↓
Business Insights & Recommendations
```

---

# 👤 Author

**Sahil Sandhu**

B.Tech — Computer Science & Engineering

Data Analytics | Power BI | SQL | Python | Excel

---

# 🔗 Project Links

### Live Power BI Dashboard

[View Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZGU1MDM0OGMtODUzMi00Yzc0LWE2N2EtZGY1OGFiYjU0YTRhIiwidCI6ImRhNjFlMGYwLWFmMWEtNDdiNC1iYWU5LTMwMTFhM2EzMmY1YSJ9)

### GitHub Repository

`https://github.com/sandhusahil/apl-logistics-supply-chain-analytics`

---

# ⭐ Project Summary

**APL Logistics — Supply Chain Analytics** is an end-to-end analytics project that transforms supply-chain shipment data into an interactive Power BI solution for analyzing delivery performance, delay risk, shipping-mode efficiency, customer-segment exposure, and regional/market logistics performance.

The final dashboard analyzes **180,517 orders**, with an overall **42.72% On-Time Delivery Rate**, **1.62-day average positive delay**, and **54.83% late-delivery risk**. The project combines data preparation, analytical calculations, KPI development, DAX, visualization, and interactive dashboard design to provide a structured view of logistics performance.

The solution is designed as a portfolio project demonstrating the application of **Python, SQL, Power BI, DAX, and business-oriented data analysis** to a real-world supply-chain analytics problem.
