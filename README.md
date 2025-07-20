# 🚴 Cyclistic Bike Share Data Analysis

## 📌 Overview 
This project analyzes the Cyclistic bike-share program data from April 2024 to April 2025. The goal is to identify usage patterns and trends to help Cyclistic improve their marketing strategies and grow their customer base.

## 📂 Data Source  
- Trip data originally provided as part of the **Google Data Analytics Capstone Case Study**
- Covers ride data from **April 2024 to April 2025**
- Uploaded and analyzed in **Google BigQuery**

## 🛠️ Tools Used 
- SQL (Google BigQuery) for data cleaning and analysis
- Tableau for data visualization and dashboards

## 🚧 Project Workflow

1. **Data Cleaning & Preparation**  
   - Removed invalid trips (e.g., negative duration, missing timestamps)  
   - Added ride duration, weekday, month, and hour columns  

2. **Data Integration**  
   - Combined 13 monthly datasets into a single unified table using `UNION ALL`  

3. **Exploratory Data Analysis**  
   - Analyzed trends by day, time, and bike type  
   - Compared behavior between **casual riders** and **annual members**

4. **Data Visualization**  
   - Built Tableau dashboards to communicate insights and trends
     
## 📈 Dashboard

Explore the interactive Tableau dashboard below to visualize key usage trends by time, rider type, and bike type:

🔗 [**View Cyclistic Usage Trends Dashboard**](https://public.tableau.com/views/CyclisticUsageTrends/CyclisticBikeShareUsageTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

> Includes visualizations such as:
> - Rides by day of the week
> - Rides by hour of day
> - Bike type usage
> - Average ride duration by month

## Key Findings
- Casual riders take longer rides but mostly on weekends
- Annual members ride more frequently and during weekdays
- Classic bikes are the most used across all user types

## 📁 Repository Structure

```text
cyclistic-data-analysis/
├── sql/
│   ├── combine_trips.sql                  # Combines all monthly datasets
│   ├── data_cleaning_and_exploratory_analysis.sql  # Cleans data + creates new columns
│   ├── weekly_trends.sql                  # Rides by weekday/hour
│   └── member_vs_casual.sql               # Behavior differences by user type
├── data_cleaning_summary.md               # Text summary of cleaning steps
├── trends_analysis.md                     # Key trends and insights found
├── dashboard_tableau_link.md              # Tableau link and dashboard screenshots
├── README.md                              # Project overview and usage guide

---

