# dbt™ Data Modeling Challenge - Fantasy Football Edition

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

## Introduction

The objective of this challenge was to analyze and transform raw fantasy football NFL data to derive insights. I approached this challenge from the perspective of a fan looking to draft an NFL fantasy team. The ultimate goal being to maximize the chances of winning their fantasy league. 

[Include link to Lightdash dashboard] [TO DO]

## Data Sources
- [Fantasy Football Data (Snowflake)] - Tables preloaded by Paradime
- Snap Counts - Snap counts for the 2023 season by player and week pulled from [nfl_py_data](https://github.com/nflverse/nfl_data_py) via Python script
- Seasonal data: Regular season stats for each player by year (2018-2023) pulled from [nfl_py_data](https://github.com/nflverse/nfl_data_py) via Python script

## Methodology
### Tools Used
- Paradime for dbt™ modeling and SQL
- Snowflake for data warehousing
- Lightdash for visualization

### Applied Techniques

I created several staging, intermediate, and fact models based on the data sources. I also utilized some of the preloaded models. The following models were leveraged in my final submission:

Seed Files (sourced pulled from `nfl_py_data` via Python script)
* `seed_nfl_player_stats_yearly`
* `seed_nfl_snap_counts_2023`

Staging Layer
* `stg_player_snap_counts`
* `stg_yearly_player_stats`

Intermediate Layer
`int_player_receiving_stats` - Intermediate model combining yearly regular season receiving stats and 2023 snap counts
`int_fantasy_points_leaders` - Preloaded intermediate model of player fantasy points for 2023 season. I identified an issue in the grain of this model. It was shown by week, but I believe it was intended to represent yearly aggregations. I updated this model and `fct_fantasy_points_leaders` accordingly.

Mart Layer
`fct_player_receiving_stats_yearly` - Model for receiving player stats and fantasy points for 2018-2023 regular seasons
`fct_fantasy_points_leaders` - Preloaded model of player fantasy points for 2023 season

## Visualizations
My first step was to educate myself about fantasy football scoring. Most fantasy leagues now use a PPR (Points Per Reception) format. I found that:
You receive points for touchdowns and yards as with standard scoring. However, you also receive points for each reception with PPR scoring. 

For the 2023 season, 4 of the top 10 players in terms of PPR fantasy points were wide receivers.
![Top 10 Players](./Visualizations/2023_Top_10_Players.png)

While QBs often score a lot of points, it is typical to draft just 1 QB, but multiple receiving players (e.g., 2-3 WRs and 1 TE) in most fantasy leagues With this knowledge in hand, I decided to focus on receiving players in my analysis.

[Lightdash dashboard](https://app.lightdash.cloud/projects/ccbaf62f-52f2-4af9-9675-bbacf0556f82/dashboards/d6a57740-b426-47e7-a26d-911429577666/edit)

[TO DO]

## Insights
[Detail your findings, supported by data and visuals]
[TO DO]

## Conclusions
[Summarize key takeaways and recommendations]
[TO DO]
