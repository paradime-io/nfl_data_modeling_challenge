# dbt™ Data Modeling Challenge - Fantasy Football Edition

Welcome to the **dbt™ Data Modeling Challenge - Fantasy Football Edition!**
By Shruti Taware

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

## Introduction
This dashboard provides insights into **quarterback passing performance** for the season, helping to identify efficiency, consistency, and top performers in fantasy football. The analysis focuses on key metrics like **fantasy points, passing yards, efficiency, and team impact**, offering valuable insights for football analysts & leadership. 

https://app.lightdash.cloud/projects/00e3115e-4dd6-42a8-acea-cce8593196c8/dashboards/d0acaa60-e0e5-493c-807a-19dfed8f96cd/view

## **Methodology**  

## **Data Sources**  
- ** Source NFL Fantasy Football Data (Snowflake)** – Player performance metrics, including passing yards, fantasy points, and efficiency.  
- **Play-by-Play Data** – Play-level details such as completions, air yards, and yards after catch.  
- **Fact Models: fct_qb_passing_performance** – Aggregated team-level statistics related to fantasy points and quarterback contributions.  

### **Tools Used**  
- **Paradime for dbt™** – Data transformation and modeling.  
- **Snowflake** – Data warehousing and querying.  
- **Lightdash** – Dashboard visualization and reporting.  

### **Applied Techniques**  
- **Data Transformations**: Cleaning, aggregations, and calculations using dbt models.  
- **Performance Metrics**: Calculation of **fantasy points per yard, air yards percentage, and passing efficiency**.  
- **Team & Player-Level Aggregations**: Identifying top performers and team impact through grouped calculations.  
- **Data Validations**: Ensuring consistency in player stats and fantasy scoring methods.  

## Visualizations & Insights
### **1️⃣ Most Efficient QB**  
- **Metric:** Fantasy Points per Yard  
- **Insight:** Identifies quarterbacks who generate the most fantasy points per passing yard.  

### **2️⃣ Top Scoring Team**  
- **Metric:** Total Fantasy Points per Team  
- **Insight:** Reveals which team contributes the most fantasy points.  

### **3️⃣ Top 10 Performers of the Season**  
- **Metric:** Total Fantasy Points per Player  
- **Insight:** Ranks the highest-scoring quarterbacks based on season-long fantasy performance.   

### **4️⃣ Team Impact – Which Teams Have the Most Fantasy Points?**  
- **Metric:** Total Fantasy Points by Team  
- **Insight:** Highlights which teams generate the most fantasy points overall.  

### **5️⃣ Most Consistent Quarterbacks**  
- **Metric:** Fantasy Points Per Game (Weekly Trends)  
- **Insight:** Tracks quarterbacks’ consistency in scoring throughout the season.  

## Conclusions & Key Takeaways
- **High-efficiency QBs** don’t always have the highest total yards, but they **maximize fantasy points per play**.  
- Certain teams consistently generate **high fantasy points**, making them more reliable for fantasy managers.  
- **Top performers change weekly**, emphasizing the importance of **monitoring trends over time**.  
- **Consistency matters**—QBs with stable weekly performance are **less risky fantasy investments**.  
