# Audience Sensitivity, Content Compliance & Format Preference Analysis of France Top 50 Playlist

**Power BI | Python | Data Analytics | Music Industry Insights**

## 🔗 Live Power BI Dashboard

### [View Interactive Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOTAxZjAzOWYtOTU3OS00ZjFkLWE2YjgtODc5M2Y5OTIzNmMyIiwidCI6ImRhNjFlMGYwLWFmMWEtNDdiNC1iYWU5LTMwMTFhM2EzMmY1YSJ9)

---

## 📌 Project Overview

This project analyzes France Top 50 playlist data to understand how explicit-content classification, playlist ranking, track popularity, release formats, album structure, and song duration are represented in music chart data.

Developed as a business-oriented analytics project, the dashboard transforms raw playlist records into interactive visual analyses and key performance indicators (KPIs). The objective is to support data-driven discussions around content classification, playlist positioning, and music release formats.

The analysis is designed to help stakeholders explore content representation and ranking patterns. However, playlist representation alone does not establish actual listener preferences, cultural acceptance, or the causal impact of explicit content on popularity.

## 🎯 Business Objectives

- Analyze the representation of explicit and clean tracks in the France Top 50 playlist.
- Compare explicit-content representation across different playlist ranking tiers.
- Examine the relationship between explicit status and track popularity.
- Evaluate the representation of singles, albums, and compilations.
- Investigate album size and its relationship with track popularity.
- Analyze song-duration patterns and their association with popularity and playlist position.
- Translate analytical findings into actionable, evidence-based business observations.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, preprocessing, and validation |
| Pandas | Data manipulation and quality checks |
| Power BI Desktop | Data modeling, DAX calculations, and dashboard development |
| DAX | KPI calculations and analytical measures |
| Microsoft Excel / CSV | Dataset inspection and data exchange |
| GitHub | Version control, documentation, and portfolio presentation |

*The tools listed should reflect the actual workflow and files included in the repository.*

## 📂 Dataset Overview

The project uses France Top 50 playlist records containing track information, playlist positions, popularity metrics, release-format attributes, and song-duration information.

### Dataset Summary

| Attribute | Details |
|---|---|
| Dataset | France Top 50 Playlist |
| Initial dataset size | 27,800 rows |
| Final cleaned dataset | 27,699 rows |
| Date coverage | 18 May 2024 – 27 November 2025 |
| Distinct dates retained | 554 |
| Duplicate records | 0 exact duplicates after cleaning |
| Missing values | 0 after cleaning |
| Primary analytical tool | Power BI |

### Key Fields

- `date` — playlist snapshot date.
- `position` — track position in the playlist.
- `song` — track name.
- `popularity` — available track popularity metric.
- `is_explicit` — explicit-content classification.
- `album_type` — release format, such as album, single, or compilation.
- `total_tracks` — total number of tracks associated with the release.
- `duration_minutes` — track duration in minutes.

*Field names should be checked against the final dataset before publication. The dataset should only be redistributed if its source and licensing terms permit it.*

## 🧹 Data Cleaning & Preparation

Data preparation was performed before the cleaned dataset was imported into Power BI.

The main cleaning steps included:

1. **Date standardization:** Converted the date field into a proper datetime format using day-first parsing.
2. **Duplicate removal:** Removed 19 exact duplicate records.
3. **Data-quality investigation:** Investigated an anomalous date, 1 March 2025, which contained duplicated playlist positions; its records were excluded.
4. **Missing-value handling:** Addressed the remaining missing song entry and associated invalid duration.
5. **Duration validation:** Removed records with zero or negative song durations.
6. **Position validation:** Checked that playlist positions fell within the expected Top 50 range.
7. **Popularity validation:** Checked that popularity values fell within the valid 0–100 range.
8. **Final validation:** Confirmed 27,699 records, 554 dates, zero exact duplicates, and no remaining missing values.

The cleaning process was intended to improve consistency and reliability while preserving the analytical usefulness of the dataset.

**Data-quality note:** The removal of all records for 1 March 2025 should be documented as a deliberate exclusion. This date-level exclusion may affect representativeness and should be acknowledged when interpreting results.

## 📊 Dashboard Structure

The Power BI report is organized into five analytical pages.

### Page 1 — Executive Overview

Provides a high-level summary of playlist data and key indicators to establish the analytical context.

### Page 2 — Content Sensitivity & Popularity Analysis

Examines explicit and clean content representation, popularity comparisons, and ranking-related patterns.

### Page 3 — Release Format & Album Structure

Analyzes album-type representation, track popularity by release format, album-size patterns, and associated summary indicators.

### Page 4 — Song Duration & Ranking Analysis

Explores song-duration distribution, duration categories, popularity relationships, playlist positions, and Top 10 release-format representation.

### Page 5 — Content Sensitivity & Rank-Tier Analysis

Compares explicit-content share across cumulative Top 10, Top 25, and Top 50 positions and examines the explicit-versus-clean composition of Top 10 entries.

## 📈 Key Performance Indicators (KPIs)

### 1. Explicit Content Share

Measures the proportion of playlist records classified as explicit.

**Formula:**

Explicit Content Share = Explicit Playlist Records / Total Playlist Records × 100

### 2. Clean Content Share in Top 10

Measures the proportion of Top 10 playlist records classified as non-explicit.

**Observed result: 37.53%**

This indicates that clean tracks account for 37.53% of the Top 10 records under the project's calculation.

### 3. Clean Content Dominance Ratio

Compares the representation of clean content with explicit content. The ratio must be interpreted according to the exact numerator and denominator used in the DAX measure.

### 4. Explicit Content Share by Rank Tier

Measures the explicit-content share among records whose playlist positions fall within each cumulative ranking tier:

- **Top 10:** Positions 1–10.
- **Top 25:** Positions 1–25.
- **Top 50:** Positions 1–50.

These are cumulative groups rather than mutually exclusive rank bands.

### 5. Track Popularity by Release Format

Compares the average popularity metric across album, single, and compilation records.

### 6. Song Duration Analysis

Examines track lengths and their relationships with popularity and playlist position. Associations should not be interpreted as causal effects.

*All KPI formulas and values should be validated against the final Power BI measures before the report is submitted or the research paper is written.*

## 🔍 Analytical Methodology

The analysis follows a structured workflow:

1. **Data acquisition:** Load the available France Top 50 playlist dataset.
2. **Data cleaning:** Standardize dates, remove duplicate records, investigate anomalies, and validate important fields.
3. **Data modeling:** Prepare the cleaned dataset for Power BI and create calculated measures.
4. **KPI development:** Define metrics for explicit-content representation, rank tiers, popularity, release formats, and song duration.
5. **Visual analysis:** Build charts and summary indicators to compare patterns across relevant attributes.
6. **Business interpretation:** Translate observed distributions and associations into cautious, evidence-based conclusions.
7. **Validation:** Review calculations, visual filters, axis aggregations, and the meaning of each KPI.

## 💡 Business Questions Addressed

- What proportion of playlist records are explicit versus clean?
- How does explicit-content representation vary across the Top 10, Top 25, and Top 50?
- How does track popularity vary between explicit and clean content?
- How are albums, singles, and compilations represented in the playlist?
- What patterns exist between release size and track popularity?
- How does song duration vary across popularity levels and playlist positions?
- Which observations could help stakeholders formulate further questions about music content and release strategies?

## 📌 Key Findings

The following observations are based on the current cleaning results and reported Power BI measures.

- **Dataset coverage:** The cleaned dataset contains 27,699 records spanning 554 playlist dates.
- **Explicit-content representation:** Explicit content accounts for 56.27% of the analyzed records under the current calculation.
- **Top 10 clean-content representation:** The clean-content share in the Top 10 is 37.53%.
- **Multiple analytical dimensions:** The dashboard examines content classification, ranking, popularity, release format, album size, and duration.

These figures describe the analyzed dataset and the definitions used in the dashboard. They should not be interpreted as direct measures of audience acceptance or as evidence that a particular content attribute causes higher playlist performance.

## ⚠️ Limitations

- The dataset represents playlist records and may not capture the entire French music-listening population.
- Repeated appearances of a track across dates can cause the same song to contribute multiple records to the analysis.
- Popularity metrics are platform-specific and should not be treated as direct measures of sales, streams, or cultural acceptance unless their definitions support that interpretation.
- Explicit-content classification is a metadata attribute, not a complete measure of cultural sensitivity.
- Relationships between popularity, song duration, album size, and playlist position are observational and do not establish causality.
- The removal of records for an anomalous date may affect the representativeness of the time series.
- The dataset covers a defined period and may not reflect current playlist patterns.
- Any business recommendations should be validated with additional evidence before being used for release, localization, or content-compliance decisions.

## 🚀 How to Explore the Project

1. Clone or download this repository.
2. Open the Power BI report using Power BI Desktop, if the `.pbix` file is provided.
3. Review the report pages and KPI definitions.
4. Refer to the data-cleaning notebook and methodology documentation, if available.
5. Consult the limitations before interpreting the results.

## 🔮 Future Enhancements

- Add and validate interactive slicers for date, explicit status, album type, and rank tier if required by the project brief.
- Investigate time-based trends in playlist composition.
- Compare track-level and playlist-record-level results to assess the effect of repeated appearances.
- Conduct statistical analysis to evaluate whether observed differences in popularity are meaningful.
- Improve documentation of KPI definitions, DAX logic, and data-quality decisions.
- Develop a research paper documenting the methodology, findings, limitations, and implications.

## 👨‍💻 Author

**Sahilpreet Singh Sandhu**

B.Tech in Computer Science and Engineering  
Microsoft Certified: Power BI Data Analyst Associate

**Technical Skills:** Power BI, DAX, SQL, Python, Pandas, Excel, Data Cleaning, Data Visualization, and Business Intelligence.

- **GitHub:** https://github.com/sandhusahil

## 📄 Research & Usage Note

This project is intended for educational, analytical, and portfolio purposes. Dataset ownership, redistribution rights, and attribution requirements should be verified before public release. Any future research paper should report the actual methods and results obtained from the final dataset and dashboard.

---

**If you find this project useful, consider starring the repository.**
