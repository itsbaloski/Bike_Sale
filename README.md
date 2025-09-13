# 🚴‍♂️ Bike Sales Dashboard

## 📑 Table of Contents
- [📌 Project Overview](#-project-overview)
- [🛠️ Tools](#️-tools)
- [🧹 Data Cleaning / Preparation](#-data-cleaning--preparation)
- [📊 Exploratory Data Analysis (EDA)](#-exploratory-data-analysis-eda)
- [🔎 Data Analysis](#-data-analysis)
- [📈 Results](#-results)
- [💡 Business Recommendations / Next Steps](#-business-recommendations--next-steps)
- [⚠️ Limitations](#-limitations)

## 📌 Project Overview
Barry Bike Shop wanted to understand revenue and profit trends across time, riders, and seasons. We were asked to merge two years of bike rental data with cost details, 
clean and prepare it with SQL, and build a Power BI dashboard to highlight when money is made, who the customers are, and how pricing affects demand. 
The solution combined SQL for data preparation and Power BI for visual insights on revenue, profit, demographics, and seasonal performance. 
Next steps include demand forecasting, adding weather/event data, automating reports, and customer segmentation. 
The impact showed revenue growth from $4.9M in 2021 to $10.2M in 2022, an 81% share of registered riders, a 45% profit margin, 
and evidence that a 25% price increase led to a 64% jump in demand, helping managers make data-driven decisions on pricing, promotions, and operations.

## 🛠️ Tools
- **SQL Server** – Data cleaning and transformation  
- **Power BI** – Interactive dashboard and visualization  
- **CSV/Excel** – Raw data storage  

## 🧹 Data Cleaning / Preparation
- Combined two yearly datasets into one table  
- Joined cost data to calculate revenue and profit  
- Standardized columns (dates, rider types, revenue, profit)  
- Removed errors and duplicates for consistency  
- Connected data from Power BI to SQL Server  
- Created visualizations inside Power BI  

## 📊 Exploratory Data Analysis (EDA)
- Revenue and profit trends across months and years  
- Rider demographics (registered vs casual, 81% vs 19%)  
- Hourly patterns showing peak earnings (10–15 hrs and evenings)  
- Seasonal analysis identifying summer as the most profitable period  
- Price-demand relationship confirming that higher pricing boosted both demand and revenue  

## 🔎 Data Analysis
Here’s an example SQL query used to prepare the dataset for analysis:

```sql
with bike as (
    select * from bike_share_yr_0
    union all
    select * from bike_share_yr_1
)
select dteday, season, a.yr, weekday, hr, rider_type, riders, 
       price, COGS, riders * price as revenue,  
       riders * price - COGS as profit
from bike a
left join cost_table b
on a.yr = b.yr;
```
From this query:
- Combines the yearly datasets.  
- Joins with cost data to calculate revenue and profit.  
- Creates a structured dataset used in Power BI for visualization.  

## 📈 Results
<img width="1269" height="697" alt="bike data power bi dashboard" src="https://github.com/user-attachments/assets/ef1a0a79-97db-493d-bfeb-a5f51dee408f" />

- Total revenue reached **$15M** across the two years.  
- Profit totaled **$10.45M**, giving a profit margin of **45%**.  
- A total of **3M rides** were recorded.  
- Rider demographics show **81.17% registered** users and **18.83% casual** riders.  
- Seasonal breakdown:  
  - **Summer (Season 3): $4.9M** revenue (highest)  
  - **Spring (Season 2): $4.2M** revenue  
  - **Fall (Season 4): $3.9M** revenue  
  - **Winter (Season 1): $2.2M** revenue (lowest)  
- Hourly patterns show peak earnings between **10:00 – 15:00** and in the **early evenings**.  
- Weekly patterns highlight stronger performance on **Wednesdays and Fridays** compared to other days.  

  ## 💡 Business Recommendations / Next Steps
- Focus marketing efforts on **registered riders** (loyal customer base).  
- Offer promotions during **non-peak hours** to spread demand.  
- Adjust pricing strategically since higher prices increased both demand and revenue.  
- Expand services in **summer months**, when demand is highest.  
- Incorporate **weather and event data** for better demand forecasting.  

## ⚠️ Limitations
- Dataset did not include external factors like **weather or holidays**, which affect bike rentals.  
- Data cleaning required assumptions on **missing and duplicate records**.  
- Seasonal categories were broad, limiting finer analysis.  
- Results are based on **historical data only**, so forecasting future trends needs caution.  
