# 🏈 NFL Fantasy Football Edition - dbt™ Data Modeling Challenge

Project for the dbt™ Data Modeling Challenge - Fantasy Football Edition, Hosted by Paradime!

*by **👊 [Ramyashree Shetty](https://www.linkedin.com/in/ramyashree-shetty/)***

## Table of Contents

1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Data Lineage](#data-lineage)
5. [Visualizations](#visualizations)
6. [Insights](#insights)
7. [Conclusions](#conclusions)

## Introduction

Welcome, fellow Value Hunters! This dashboard is your treasure map to uncovering hidden gems in the world of fantasy football. We're not just chasing points; we're hunting *value* – those players who outperform their perceived worth, giving you the edge you need to dominate your league.  Think of it as Moneyball for fantasy football, but with cooler charts. 


## Data Sources <a name="data-sources"></a>

*   [nfl_data_py](https://github.com/nflverse/nfl_data_py): Library for interacting with NFL data and includes data for play-by-play data, weekly data, seasonal data, rosters, win totals, scoring lines, officials, draft picks.

*   [2023 NFL Salary](https://www.spotrac.com/nfl/rankings/player/_/year/2023/sort/cap_base): Scraped from spotrac for player's salary for season 2023.

## Methodology

### Tools Used:

*   Paradime for dbt™ modeling and SQL development – Where the magic happens.
*   Snowflake for data warehousing –  Our data fortress.
*   Lightdash for data visualization – Turning numbers into narratives.


### Applied Techniques:

We used dbt to wrangle the data into shape, employing:

*   **Dimensional Modeling:** Creating star schemas for efficient analysis – because nobody likes slow queries.
*   **Data Aggregation:** Calculating key metrics like total points, consistency, red zone efficiency, and ROI.
*   **Data Quality Tests:** Ensuring our data is clean and reliable – garbage in, garbage out, as they say.
*   **Metric Calculation:**  Building our "value hunter" toolbox with custom metrics.

## Data Lineage
![image](/images/lineage.png)


## Visualizations <a name="visualizations"></a>

*   **Overall Metrics of the Season** <br><br>
![image](images/overall-metrics.png)<br><br>

*   **Top Performers Over Season:** <br>
Who consistently brought the heat?<br><br>
![image](/images/perf1.png)<br>
![image](images/perf2.png)<br>
![image](images/perf3.png)<br>
![image](images/perf4.png)<br><br>


*   **Consistent Performers:**<br>
Finding the reliable scorers <br><br>
![image](/images/con1.png)<br>
![image](images/con2.png)<br>
![image](images/con3.png)<br><br>


*   **Red Zone Efficiency for Most Touchdowns:** <br>
 Who's cashing in on scoring opportunities? <br><br>
 ![image](/images/red1.png)<br><br>

*   **Highest ROI Players:** <br>
The value hunters' dream chart. <br><br>
 ![image](/images/roi1.png)<br>
 ![image](/images/roi2.png)<br><br>


*   **Injury Propensity:** <br>
Are injuries affecting teams/players? <br><br>
 ![image](/images/injury1.png)<br><br>


## Insights <a name="insights"></a>

*   **Consistency is King (or Queen):**  High points are great, but *consistent* high points are gold.
*   **ROI is the Ultimate Value Metric:**  It's not just about points; it's about points *per dollar*.
*   **Injuries Can Make or Break a Season:**  Staying on top of injury trends is crucial.
*   **Knees and Ankles Take a Beating:**  Protect those joints!

## Conclusions <a name="conclusions"></a>

This dashboard empowers you to become a true "Value Hunter" in your fantasy league.  By combining data-driven insights with a bit of savvy, you can build a winning team without breaking the bank (or your salary cap).  Remember, it's not just about chasing stars; it's about finding the players who shine brightest for their cost!