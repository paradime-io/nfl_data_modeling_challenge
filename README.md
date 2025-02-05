# dbt™ Data Modeling Challenge - Fantasy Football Edition

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

## Introduction
In this challenge, my goal was to explore NFL data and generate meaningful insights that can help fantasy football players and analysts. 
The analysis leverages historical data from the 2018-2023 seasons to identify patterns, trends, and anomalies in player and team performance. 
This report highlights key findings and showcases the power of data modeling and visualization in understanding the game.

## Data Sources
- NFL player_stats data Seasons 2018-2023
- NFL play_by_play data Seasons 2018-2023
- [Additional Data Set 2] - [Description]

## Methodology
### Tools Used
- Paradime for dbt™ modeling and SQL
- Snowflake for data warehousing
- Lightdash for visualization
- Python for pulling additional NFL data

### Applied Techniques
In this project I involved multiple data transformation processes, including:

Data extraction and loading from various sources

Cleaning and normalizing play-by-play data

Calculating new metrics, such as win rates, player phisyque statistics and fantasy points

Aggregating player performance metrics by game and season

Team-level data modeling to assess spending, performance

Creating visualizations in Lightdash to support data-driven insights

## Visualizations
1. Weight and BMI Distribution by Position
![Weight and BMI by Position](snapshots/weight_by_position.png)
This chart visualizes the average weight and BMI for each position in the NFL. 
Interestingly, while the average BMI exceeds the normal range across all positions, this reflects the specific physical requirements of the sport 
rather than unhealthiness. 
Positions like offensive and defensive linemen show the highest BMI due to their need for size and strength, 
while wide receivers and defensive backs tend to have a lower BMI due to their speed and agility requirements.

2. Win Probability Progression
![Win probability over game time](snapshots/win_probability.png)
This visualization explores how win probability evolves during a game, using one-minute time brackets across multiple games. 
A key observation is that by halftime, many matches are already leaning heavily toward one side, with the winning team often maintaining a 75% or higher win probability. 
This indicates that momentum plays a significant role in determining outcomes early in the game.

3. Team Win Rates
![Win rates of NFL teams](snapshots/win_rates_1.png)
![Win rates of NFL teams](snapshots/win_rates_2.png)
This table presents the win rates for all NFL teams, broken down by overall win rates, home win rates, and away win rates. 
It’s clear that some teams perform significantly better on their home turf, indicating the importance of crowd support and familiarity with the playing environment. 
Conversely, teams with strong away records, such as Kansas City, demonstrate resilience and adaptability.

## Insights
[Detail your findings, supported by data and visuals]

## Conclusions
[Summarize key takeaways and recommendations]
