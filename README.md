# 🏆 NFL Fantasy Player Performance Analysis

"*Big moments create big players. Just ask Kobe—clutch isn't just a stat; it's a mentality.*"


## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources and Data Lineage](#data-sources-and-data-lineage)
   - [Sources and Seeds](#sources-and-seeds)
   - [Intermediate Layer](#intermediate-layer)
   - [Mart Layer](#mart-layer)
3. [Methodology](#methodology)
   - [Tools Used](#tools-used)
   - [Data Preparation and Cleaning](#data-preparation-and-cleaning)
4. [Key Metrics in the Analytics](#key-metrics-in-the-analytics)
   - [Red Zone Efficiency](#red-zone-efficiency)
   - [Clutch Players Model](#clutch-players-model)
   - [Expected Fantasy Points](#expected-fantasy-points)
5. [Ultimate Fantasy Player Performance](#ultimate-fantasy-player-performance)
   - [The Fantasy MVPs](#the-fantasy-mvps)
6. [Conclusions](#conclusions)

## 📢 Introduction

When it comes to fantasy football, not all points are created equal. Some players thrive under pressure, some dominate the red zone, and others outperform their expectations week in and week out. This analysis dives into NFL player efficiency across three key dimensions—Red Zone Efficiency, Clutch Performance, and Expected Fantasy Points—to create a single source of truth for fantasy football dominance.

If Kobe Bryant taught us anything, it's that clutch players rise to the occasion. This analysis aims to answer:

- **Who are the most efficient players in the red zone?**
- **Who steps up when the game is on the line?**
- **Who consistently outperforms fantasy expectations?**

Using Paradime, dbt™, Snowflake, and Lightdash, we built a fact-based model that transforms raw play-by-play data into actionable insights for fantasy football analysts, DFS players, and hardcore fans.


## 🕸️ Data Sources and Data Lineage

Our analysis is built on three core models:
1. **Red Zone Efficiency (*who dominates near the end zone?*)**
2. **Clutch Performance (*who delivers when it matters most?*)**
3. **Expected Fantasy Points (*who overperforms expectations?*)**

These models leverage pre-loaded datasets and transformations in Paradime to create a unified marts table for fantasy player performance.

#### 📌 Sources and Seeds

We built our analysis using the following data sources:
- **stg_play_by_play → Play-by-play data of all NFL games in 2023**
- **stg_player_stats_by_game → Individual game-level performance data**

#### 📊 Intermediate Layer
We constructed three key intermediate models:

- **int_red_zone_efficiency 🏟️ (*Red Zone Performance*)**
- **int_clutch_players 🏈 (*Performance Under Pressure*)**
- **int_expected_fantasy_points 🔮 (*Fantasy Expectations vs. Reality*)**

Each model aggregates play-level data to compute meaningful player-level stats.

#### 🏆 Mart Layer
The final marts table combines all key player metrics into a single source of truth:
- **fct_fantasy_player_performance**

This fact table allows us to analyze fantasy MVPs, overachievers, and clutch performers.

## 🧪 Methodology
#### ⚒️ Tools Used
- **Paradime → dbt™ transformations and SQL modeling**
- **Snowflake → Data storage & processing**
- **Lightdash → Data visualization**
- **dbt Tests → Data quality validation**

#### 🧼 Data Preparation & Cleaning
To ensure clean, accurate data, we:
- **Removed duplicate records across sources**
- **Applied data validation tests (e.g., ensuring unique player IDs)**
- **Standardized naming conventions for player attributes**

## 🔑 Key Metrics in the Analysis
### 1️⃣ Red Zone Efficiency 🏟️
"*The best fantasy players convert opportunities into touchdowns. If you can’t score in the red zone, you can’t win—just ask any fantasy owner who started a struggling RB in Week 10.

Red Zone Efficiency is calculated based on:
- **Red Zone Rush Attempts**
- **Red Zone Pass Completions**
- **Red Zone Targets**
- **Red Zone Touchdowns**
We use these stats to compute: Red Zone TD Rate = Red Zone Touchdowns / Red Zone Opportunities

This helps us identify elite red zone performers, i.e., players who turn goal-line carries and inside-the-20 targets into actual points.

#### 📊 Top Red Zone Converters:

[Include screenshots or links to Lightdash dashboards]



### 2️⃣ Clutch Players Model 🏈
"*When the game is on the line, some players shrink… but legends rise.*" 🏆

Inspired by Kobe Bryant's clutch performances, we define clutch plays as:

- **Plays in the final 5 minutes of a game**
- **Plays when the score differential is within 3 points**
- **Touchdowns scored under pressure**
- **Expected Points Added (EPA) in crunch time**

#### 📊 Top Clutch Performers:

[Include screenshots or links to Lightdash dashboards]

By ranking players based on clutch EPA and clutch TDs, we reveal who fantasy owners can trust when they need a big game-winning moment.

#### 🏀 Kobe Bryant Comparison:
"*Kobe Bryant’s Mamba Mentality was about delivering in high-pressure situations. Our clutch model finds the NFL equivalent of Kobe—players who don't just put up numbers, but deliver when the game is on the line.*"



### 3️⃣ Expected Fantasy Points 🔮
"*Great fantasy players aren't just good—they exceed expectations.*"

Using play-by-play and player stat data, we calculate:

- **Expected Fantasy Points (XFP) → Based on usage, targets, and red zone involvement**
- **Actual Fantasy Points (AFP) → What the player actually scored**
- **Fantasy Overperformance → (AFP - XFP)**

#### 📊 Fantasy Overachievers:

[Include screenshots or links to Lightdash dashboards]

Overperformers are league winners because they return more value than expected—just like when you draft a late-round sleeper who turns into a top-10 player.

## 🏆 Ultimate Fantasy Player Performance
Now, let’s combine everything into one final ranking based on:

1. **Red Zone Efficiency**
2. **Clutch Performance**
3. **Expected Fantasy Points vs. Actual Fantasy Points**

#### 📊 Fantasy MVPs:

[Include screenshots or links to Lightdash dashboards]

🔥 Final Verdict:
"*If you're building a fantasy dynasty, C-Mac is your Kobe—unstoppable in the clutch and elite when it counts.*"


## 📊 Conclusion
1. **✅ Red Zone Efficiency matters → Top-tier players turn opportunities into points**
2. **✅ Clutch Performance is the difference-maker → Big moments define big players**
3. **✅ Expected Fantasy Points reveal sleepers → Overachievers = Fantasy gold**

**🔮 Winning Your Fantasy League:**
- **Draft high red zone efficiency players**
- **Target clutch performers in tight games**
- **Find players who consistently exceed expectations**

"*Mamba Mentality meets Fantasy Football—if you want to win, draft like Kobe.*" 🏆
