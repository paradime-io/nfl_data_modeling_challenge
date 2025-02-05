# dbt™ Data Modeling Challenge - Fantasy Football Edition

Welcome to the **dbt™ Data Modeling Challenge - Fantasy Football Edition!** This global hack-a-thon invites you to transform raw fantasy football data into insightful, data-driven insights. You'll use Paradime, Snowflake, and Lightdash to model, explore, and visualize data—showcasing your analytics engineering expertise and vying for prizes up to $1,500.

## 📋 Table of Contents

1. [Getting Started](#-getting-started)
   - [Registration and Verification](#registration-and-verification)
   - [Account Setup](#account-setup)
   - [Support and FAQs](#support-and-faqs)
2. [Competition Details](#-competition-details)
3. [Tools and Resources](#-tools-and-resources)
4. [Building Your Project](#-building-your-project)
5. [Additional NFL Data](#-additional-nfl-data)
6. [Submission Guidelines](#-submission-guidelines)
7. [Judging Criteria](#-judging-criteria)
8. [Prizes](#-prizes)
9. [Example Submission](#example-submission-template)

## 🏈 Getting Started

### Registration and Verification
Make sure you meet the [Entry Requirements](#) before registering

- **Register**: Complete the [registration form](#)
- **Verification**: Paradime will review your application. If approved, you'll receive credentials via email to begin.

### Account Setup

After approval, you'll receive two emails:

1. **Snowflake Account Credentials**: Contains your Snowflake account details. Search for "*Snowflake Credentials: dbt™ Data Modeling Challenge - Fantasy Football Edition*."
2. **Paradime Platform Invitation**: An invitation to access the Paradime Platform. Search for "*[Paradime] Activate your account*."

**Additional Guidance**: Detailed setup tutorials will be provided in your Snowflake confirmation email.

### Support and FAQs

- **Slack Community**: Join **#fantasy-football-challenge** on [Paradime's Slack](https://paradimers.slack.com/join/shared_invite/zt-1mzax4sb8-jgw~hXRlDHAx~KN0az18bw#/shared-invite/email)
- **Additional Questions**: Check documentation or ask in Slack
- **Troubleshooting Emails**: Search for "mail@paradime.retool-email.com" in your registration email

## 🏈 Competition Details

**Key Dates:**
- **Start:** January 2, 2025
- **Submission Deadline:** February 4, 2025, 11:59 PM PT
- **Winners Announced:** February 6, 2025 (right before the Superbowl!)

**Who Should Participate?**
- Data Analysts, Analytics Engineers, Data Engineers, Data Scientists, and SQL/dbt™ enthusiasts
- Individual submissions only (no teams)
- Experience with SQL, dbt™, Git, and basic data visualization required

## ⚙️ Tools and Resources

1. **[Paradime](https://www.paradime.io/)**
   - SQL, dbt™ development, and AI-assisted analytics engineering
   - [Documentation](https://docs.paradime.io/app-help) | [Code IDE Tutorial](https://app.arcade.software/share/7kRyaYbPoGc5ofmJfmvY) | [Commands Panel](https://www.youtube.com/watch?v=wQtIn-tnnbg) | [DinoAI Tutorial](https://www.youtube.com/watch?v=KqiosgQFsuk)

2. **[Lightdash](https://www.lightdash.com/)**
   - Open-source BI for dbt™ metrics and visualizations
   - [Documentation](https://docs.lightdash.com/) | [Tutorial](https://www.youtube.com/watch?v=Z4Y0KM0MroQ)

3. **[Snowflake](https://www.snowflake.com/en/)**
   - Cloud data platform for storage and compute

4. **GitHub**
   - Version control and project submission platform

## 🛠 Building Your Project

### Need a Spark of Inspiration?

Check out these resources:

- **[Winning Strategies for Paradime's Movie Data Modeling Challenge](https://www.paradime.io/blog/winning-strategies-movie-challenge)**: Learn the strategies, best practices, and insights uncovered from winning participants in previous Data Modeling Challenges.  
- Explore winning submissions from Paradime's recent Data Modeling Challenges:
  - **[Bruno De Lima's Submission](https://github.com/paradime-io/social-media-data-modeling-challenge/tree/bruno-lima)**: 1st Place winner from Paradime's dbt Data Modeling Challenge - Socal Media Edition.  
  - **[Spence Perry's Submission](https://github.com/paradime-io/paradime-dbt-nba-data-challenge/tree/nba-spence-perry)**: 1st place winner from Paradime's dbt Data Modeling Challenge - NBA Edition.  
  - **[Isin Pesch's Submission](https://github.com/paradime-io/paradime-dbt-movie-challenge/blob/movie-isin-pesch-deel-com/)**: 1st place winner from Paradime's dbt Data Modeling Challenge - Movie Edition.

### Step 1: Master Required Tools
- Explore Paradime's code IDE, AI development, data explorer, and lineage tools
- Understand Snowflake schemas and tables in your fantasy football datasets
- Learn to connect dbt™ models and build Lightdash dashboards

### Step 2: Explore and Enhance the Data
- Examine pre-loaded fantasy football datasets
- Consider external data sources to enhance analysis (injury reports, game results, weather conditions, draft prospects, depth charts, etc.)

### Step 3: Generate Insights
Uncover NFL insights related to fantasy football—the possibilities are endless!

**Potential Insight Areas with Pre-Loaded Datasets:**  
- **Top Performers by Week/Season**: Using [player_stats_by_game](https://github.com/paradime-io/nfl_data_modeling_challenge/blob/main/models/staging/stg_player_stats_by_game.sql), identify highest-scoring players each week and over the season.  
- **Team Defense Impact**: Using [play_by_play](https://github.com/paradime-io/nfl_data_modeling_challenge/blob/main/models/staging/stg_play_by_play.sql), determine which defenses give up the most fantasy points by position.  
- **Red Zone Efficiency**: Using [play_by_play](https://github.com/paradime-io/nfl_data_modeling_challenge/blob/main/models/staging/stg_play_by_play.sql), pinpoint which players or teams excel in scoring opportunities inside the 20-yard line.

**Potential Insight Areas with External Datasets:**  
- Top scoring players by week/season  
- Player consistency analysis (boom/bust metrics)  
- Impact of team matchups on player performance  
- Identifying players with high injury propensity  
- Forecasting 2025 draft prospects  

### Step 4: Visualize with Lightdash
- Create clear, informative dashboards w/ written conclusions
- Use dbt™ models as metric sources (optional)
- Ensure visualizations support your conclusions

## 🌟 Additional NFL Data

If you want to pull additional NFL data for your analysis, you can use the **nfl_data_py** library, the same tool we used to pre-load datasets into Snowflake:

- **GitHub Repo**: [nfl_data_py](https://github.com/nflverse/nfl_data_py)

For reference, the scripts we used to load the pre-loaded datasets can be found in the [**Scripts**](https://github.com/paradime-io/nfl_data_modeling_challenge/tree/main/scripts) folder of this repository.

## 📤 Submission Guidelines

**Deadline**: February 4, 2025, 11:59 PM PT

**Submission Process**:
1. Complete your dbt™ project in Paradime
2. Build Lightdash visualizations
3. Commit code, documentation, and README.md to GitHub
4. Email parker@paradime.io:
   - Subject: "<Your_Name> - Fantasy Football Data Modeling Challenge Submission"
   - Include GitHub branch link
  
Need help? follow this [step-by-step tutorial](https://app.arcade.software/share/mpoE0fK5HknHZJ3xLVVs) to submit your project. 

## 🎯 Judging Criteria

A panel of five independent judges will assess each submission based on the following categories. Each category is scored on a scale of 1-10:

1. **Value of Insights**: Are the findings relevant and valuable for fantasy football analysis?
2. **Complexity of Insights**: Do you connect multiple datasets and implement advanced transformations?
3. **Quality of Materials**: Is your code clean, your dbt™ models well-structured, and your visualizations high-quality?
4. **Integration of New Data**: Have you effectively incorporated additional datasets to enhance your analysis?

## 🏆 Why Join This Challenge?

- **Showcase Your Skills**: Demonstrate your SQL, dbt™, and analytics engineering expertise.
- **Work with Modern Tools**: Gain hands-on experience with Paradime, Snowflake, and Lightdash.
- **Build Your Portfolio**: Enhance your professional profile with a compelling analytics project.
- **Network**: Connect with a community of data professionals and industry experts.
- **Win Prizes**: Compete for Amazon gift cards worth up to $1,500!

**Prizes:**
- **1st Place**: $1,500 Amazon gift card  
- **2nd Place**: $1,000 Amazon gift card  
- **3rd Place**: $500 Amazon gift card

---
# Example Submission Template
For guidance on what a successful submission may look like, check out examples from [previous dbt™ Data Modeling Challenge winners](#need-a-spark-of-inspiration).









# 🏆 NFL Fantasy Player Performance Analysis

"*Big moments create big players. Just ask Kobe—clutch isn't just a stat; it's a mentality.*"


## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources and Data Lineage](#data-sources-and-data-lineage)
   - [Sources and Seeds](#registration-and-verification)
   - [Intermediate Layer](#account-setup)
   - [Mart Layer](#support-and-faqs)
3. [Methodology](#methodology)
   - [Tools Used](#registration-and-verification)
   - [Data Preparation and Cleaning](#account-setup)
4. [Key Metrics in the Analytics](#visualizations)
   - [Red Zone Efficiency](#red-zone-efficiency)
   - [Clutch Players Model](#clutch-players-model)
   - [Expected Fantasy Points](#expected-fantasy-points)
5. [Ultimate Fantasy Player Performance](#insights)
   - [The Fantasy MVPs](#the-fantasy-mvps)
   - [Clutch Performance vs The "Kobe Bryant of the NFL"](#clutch-performance-vs-the-kobe-bryant-of-the-nfl)
   - [Fantasy Points Over Expections](#fantasy-points-over-expectations)
6. [Conclusions and Takeaways](#conclusions-and-takeaways)

## 📢 Introduction

When it comes to fantasy football, not all points are created equal. Some players thrive under pressure, some dominate the red zone, and others outperform their expectations week in and week out. This analysis dives into NFL player efficiency across three key dimensions—Red Zone Efficiency, Clutch Performance, and Expected Fantasy Points—to create a single source of truth for fantasy football dominance.

If Kobe Bryant taught us anything, it's that clutch players rise to the occasion. This analysis aims to answer:

- **Who are the most efficient players in the red zone?**
- **Who steps up when the game is on the line?**
- **Who consistently outperforms fantasy expectations?**

Using Paradime, dbt™, Snowflake, and Lightdash, we built a fact-based model that transforms raw play-by-play data into actionable insights for fantasy football analysts, DFS players, and hardcore fans.


## 🕸️ Data Sources and Data Lineage

Our analysis is built on three core models:
**1️⃣ Red Zone Efficiency (*who dominates near the end zone?*)**
**2️⃣ Clutch Performance (*who delivers when it matters most?*)**
**3️⃣ Expected Fantasy Points (*who overperforms expectations?*)**

These models leverage pre-loaded datasets and transformations in Paradime to create a unified marts table for fantasy player performance.

### 📌 Sources and Seeds

We built our analysis using the following data sources:
- **stg_play_by_play → Play-by-play data of all NFL games in 2023**
- **stg_player_stats_by_game → Individual game-level performance data**

📊 Intermediate Layer
We constructed three key intermediate models:

- **int_red_zone_efficiency 🏟️ (*Red Zone Performance*)**
- **int_clutch_players 🏈 (*Performance Under Pressure*)**
- **int_expected_fantasy_points 🔮 (*Fantasy Expectations vs. Reality*)**

Each model aggregates play-level data to compute meaningful player-level stats.

### 🏆 Mart Layer
The final marts table combines all key player metrics into a single source of truth:
- **fct_fantasy_player_performance**

This fact table allows us to analyze fantasy MVPs, overachievers, and clutch performers.

## 🧪 Methodology
### ⚒️ Tools Used
- **Paradime → dbt™ transformations and SQL modeling**
- **Snowflake → Data storage & processing**
- **Lightdash → Data visualization**
- **dbt Tests → Data quality validation**

### 🧼 Data Preparation & Cleaning
To ensure clean, accurate data, we:
- **Removed duplicate records across sources**
- **Applied data validation tests (e.g., ensuring unique player IDs)**
- **Standardized naming conventions for player attributes**

## Applied Techniques
###🔑 Key Metrics in the Analysis
### 1️⃣ Red Zone Efficiency 🏟️
The best fantasy players convert opportunities into touchdowns. If you can’t score in the red zone, you can’t win—just ask any fantasy owner who started a struggling RB in Week 10.

Red Zone Efficiency is calculated based on:
- **Red Zone Rush Attempts**
- **Red Zone Pass Completions**
- **Red Zone Targets**
- **Red Zone Touchdowns**
We use these stats to compute: Red Zone TD Rate = Red Zone Touchdowns / Red Zone Opportunities

This helps us identify elite red zone performers, i.e., players who turn goal-line carries and inside-the-20 targets into actual points.

### 📊 Top Red Zone Converters:

[Include screenshots or links to Lightdash dashboards]


### 2️⃣ Clutch Players Model 🏀
"*When the game is on the line, some players shrink… but legends rise.*" 🏆

Inspired by Kobe Bryant's clutch performances, we define clutch plays as:

- **Plays in the final 5 minutes of a game**
- **Plays when the score differential is within 3 points**
- **Touchdowns scored under pressure**
- **Expected Points Added (EPA) in crunch time**

### 📊 Top Clutch Performers:

[Include screenshots or links to Lightdash dashboards]

### 🏀 Kobe Bryant Comparison:
"*Kobe Bryant’s Mamba Mentality was about delivering in high-pressure situations. Our clutch model finds the NFL equivalent of Kobe—players who don't just put up numbers, but deliver when the game is on the line.*"


### 3️⃣ Expected Fantasy Points 🔮
"*Great fantasy players aren't just good—they exceed expectations.*"

Using play-by-play and player stat data, we calculate:

- **Expected Fantasy Points (XFP) → Based on usage, targets, and red zone involvement**
- **Actual Fantasy Points (AFP) → What the player actually scored**
- **Fantasy Overperformance → (AFP - XFP)**

### 📊 Fantasy Overachievers:

[Include screenshots or links to Lightdash dashboards]

Overperformers are league winners because they return more value than expected—just like when you draft a late-round sleeper who turns into a top-10 player.

## 🏆 Ultimate Fantasy Player Performance
Now, let’s combine everything into one final ranking based on:

- **Red Zone Efficiency**
- **Clutch Performance**
- **Expected Fantasy Points vs. Actual Fantasy Points**

### 📊 Fantasy MVPs:

[Include screenshots or links to Lightdash dashboards]

### 🔥 Final Verdict:
"*If you're building a fantasy dynasty, C-Mac is your Kobe—unstoppable in the clutch and elite when it counts.*"


##  📊 Conclusion
1. **✅ Red Zone Efficiency matters → Top-tier players turn opportunities into points**
2. **✅ Clutch Performance is the difference-maker → Big moments define big players**
3. **✅ Expected Fantasy Points reveal sleepers → Overachievers = Fantasy gold**

**🔮 Winning Your Fantasy League:**
- **Draft high red zone efficiency players**
- **Target clutch performers in tight games**
- **Find players who consistently exceed expectations**

"*Mamba Mentality meets Fantasy Football—if you want to win, draft like Kobe.*" 🏆
