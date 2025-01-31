# dbt™ Data Modeling Challenge - Fantasy Football Edition

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

## Introduction

I have a confession to make: I’m not American, and I’m not a sports fan. So when I decided to take on this NFL Data Modeling Challenge, I knew I was in for an uphill battle. My knowledge of (American) football before this challenge was... let’s just say, "limited." I knew that:  

- The NFL is the most popular sport in the U.S.  
- They play with an egg-shaped ball.  
- The players are **HUGE**.  
- Concussions are a common injury.  
- The Super Bowl is a really big deal.  

That was pretty much it.  


[Dashboard 1: Getting to know data](https://app.lightdash.cloud/projects/36657ff5-d0ec-483b-98ad-eb25393cb88c/dashboards/1952d76f-0aad-4234-a6cf-290f5628f897/view)

## Data Sources
- Fantasy Football Data (Snowflake):
   - play-by-play data
   - player stats by game data

Additional datasets:
- NFL Teams Data Set - Team description from nfl_data_py Python package
- NFL Injuries Data Set - Injury data for the 2023 season from nfl_data_py Python package


## Methodology
### Tools Used
- Paradime for dbt™ modeling and SQL
- Snowflake for data warehousing
- Lightdash for visualization
- ChatGPT as my go-to football expert and for crafting this narrative

### Applied Techniques
[Discuss transformations, tests, and models built]

## Visualizations

### Step One: Understanding the Rules and the Data  

Before jumping into any data modeling, I had to get a grasp on how the NFL actually works. I learned that the league is split into two conferences: the AFC (American Football Conference) and the NFC (National Football Conference). Each conference has **16 teams**, further divided into **four divisions of four teams each**.  

The season itself is split into the **regular season** and the **playoffs**. By the end of the regular season, **seven teams from each conference** qualify for the playoffs, leading up to the Super Bowl.  

Scoring was another challenge to wrap my head around. You get **6 points for a touchdown**, **3 points for a field goal**, and a few other ways to score that I’m still trying to fully grasp. Let’s just say football rules are not as intuitive as I had hoped!  

### Reconstructing the Season Results  

For my first real analysis, I aimed to **recreate the results of each game** and compile the **final standings for the AFC and NFC** after the 2023 regular season. I included:  

- **Number of wins and losses for each team**  
- **Total points scored and allowed**  
- **Who qualified for the playoffs**  

The good news? My data lined up with what I found on Wikipedia—so at least I didn’t mess up too badly!  

![AFC Standings](images/part1/afc-standings.png)

![NFC Standings](images/part1/nfc-standings.png)

### Game Duration and Overtime  

I learned that each game consists of **four 15-minute quarters**, and if the game is tied at the end, there can be **overtime**.  

So, how often does a game actually go into overtime? Here’s what I found:  

- Out of **272 regular season games**, **259 ended in regulation**, while **13 went into overtime**—that’s roughly **95% regular time, 5% OT**.  
- In the **playoffs**, **12 games ended in regular time**, while **1 went to overtime**, making it **92% vs. 8%**.  

This suggests that overtime is relatively rare. Here are the visualizations of how often games extend beyond regulation:  

![Regular vs overtime games](images/part1/regular-vs-overtime.png)

![Regular vs overtime games percent](images/part1/regular-vs-overtime-percent.png)

![Home wins vs away wins](images/part1/home-wins-vs-away-wins.png)

![Home wins vs away wins percent](images/part1/home-wins-vs-away-wins-percent.png)

![Average height and weight for different positions](images/part1/height-weight-for-positions.png)

### Insights
[Detail your findings, supported by data and visuals]

## Conclusions
[Summarize key takeaways and recommendations]
