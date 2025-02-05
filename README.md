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

1. **Snowflake Account Credentials**: Contains your Snowflake account details. Search for "_Snowflake Credentials: dbt™ Data Modeling Challenge - Fantasy Football Edition_."
2. **Paradime Platform Invitation**: An invitation to access the Paradime Platform. Search for "_[Paradime] Activate your account_."

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

## Table of Contents

1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

## Introduction

I'll admit — I don't know much about sports. The only reason I’ve heard of Travis Kelce is because I’m a Swiftie, and that’s where my knowledge stops.

That said, I wanted to challenge myself by working with sports data for the first time and experimenting with Paradmine/Lightdash.

I chose to focus on NFL performance post-COVID, expanding the dataset with additional years and incorporating injury data — a topic that naturally piqued my curiosity.

Lightdash Dashboard: https://app.lightdash.cloud/projects/13c79b94-129c-4176-aa3e-aba26d4cbacf/dashboards/e7677c88-1a3e-4d0f-b654-f57e188871f2.

## Data Sources

- Fantasy Football Data (Snowflake). This only included data for 2023.
- Fantasy Football Data. Reran the script (nfl_play_by_play_2023.py and nfl_player_stats_by_game_2023.py) to get historical data for 2021-2024.
- Injury NFL Data by accessing sports.core.api.espn.com/v2/sports/football/leagues/nfl/teams/{TEAM_ID}/injuries.

## Methodology

1. Executed nfl_play_by_play_2023.py and nfl_player_stats_by_game_2023.py to retrieve historical data from 2021 to 2024.
2. Loaded the historical performance data into Snowflake, built source models, and combined them into a staging model in dbt.
3. Ran a script to ingest NFL injury data, deduplicated the dataset, and excluded player names due to inconsistencies — focusing instead on team and position. Created a source model and an intermediate model for injury data.

### Tools Used

- Paradime for dbt™ modeling and SQL
- Snowflake for data warehousing
- Lightdash for visualization
- Python script for data extraction
- ChatGPT to understand sports

### Applied Techniques

1. Added a sources layer for light renaming of historical performance data.
2. Updated stg_play_by_player to incorporate historical data.
3. Modified existing intermediate models to include additional fields.
4. Developed additional intermediate and fact models for injury history and points allowed by defense.
5. Implemented tests (not-null, uniqueness) where applicable. There’s an opportunity to enhance testing with additional packages. I’d recommend involving someone with domain expertise to define acceptable behavior.

## Visualizations

Link to Dashboard: https://app.lightdash.cloud/projects/13c79b94-129c-4176-aa3e-aba26d4cbacf/dashboards/e7677c88-1a3e-4d0f-b654-f57e188871f2/view.

## Insights

**Worth it: Most Common Injuries**

Lower Body injuries are the most common and are observed across all positions, accounting for 400 injuries, followed by Upper Body injuries (242).

Linebackers (LB), Cornerbacks (CB), and Safeties (S) suffer the most injuries. These positions require quick movements, high impact tackles, and frequent contact, making them injury-prone.

**Types of Injuries**

Lower Body injuries dominate over other injuries across most positions, especially for LBs and WRs. This suggests that speed-based positions (WR, S) suffer the most lower body injuries, likely due to running, cutting, and tackling.

Head injuries are most common among running backs (RB) and safeties (S). Safeties (S) have the highest count of head injuries, almost doubled the count of RBs.

Core/abdomen injuries are primarily seen in LB, OT, PR, QB, TE, and WR, with linebackers (LB) experiencing the highest count. These injuries likely stem from high-impact collisions, blocking, and twisting motions during tackles or receptions.

This aligns with their roles — RBs frequently absorb direct hits while running through defenses, while safeties initiate high-speed tackles, increasing head injury risks.

**Injury Status among positions**

Linebackers (LB) and defensive tackles (DT) have the highest counts of IR-R, a designation for players who are "out" but eligible to return after a set period.
Cornerbacks (CB) and Safeties (S) lead in "Questionable" status, meaning they have a 50/50 chance of playing in the next game due to injury.
Interestingly, offensive tackle (OT) is the only position with PUP-R designations, which typically result from offseason injuries.
Wide receivers (WR) have the highest IR-R counts, followed by LB, TE, DE, and CB, indicating these positions frequently deal with injuries that require temporary removal but allow a return later in the season.

**Injury Details by Position**

No position is completely immune to moderate to severe injuries.

Defensive Tackles (DTs) have the highest number of surgeries.
Linebackers (LBs), Wide Receivers (WRs), Centers (Cs), and Defensive Ends (DEs) have similar surgery counts (around 20), which is still half of the DT total.
Safeties (S) have the highest number of concussions.
Cornerbacks (CBs) have the widest variety of injuries, with 10 cases each of surgery, concussion, fracture, and dislocation.
Defensive Ends (DEs) and Running Backs (RBs) are the only positions where sprains have been reported.



**Seeing Red: The Red Zone**

Across teams from 2021 to 2024, the average per game included nearly 5 targets, 5 rushing attempts, 3 pass completions, and 10 red zone opportunities.

Performance Trends Over Time:

- Opportunities remained the highest over time, which aligns with their definition as chances to make a play.
- 2021 was the strongest year for red zone performance across teams, except for total rush attempts, where 2024 showed slightly better results.
- 2022 was the weakest year, showing the lowest totals for opportunities, pass completions, and rush attempts, though these metrics improved over time.
- 2023 struggled with targets, and numbers have yet to recover to 2021 levels.
- Pass completions remain the lowest among all performance indicators, while rushing attempts and targets are more closely aligned.


**Top Performers in the Red Zone**

A clear trend emerges among the top red zone performers over the years.

Rushing & Total Opportunities:

- The top 5 players for total opportunities and red zone rush attempts feature the same key names: J. Jacobs, B. Robinson, J. Mixon, and J. Taylor.
- J. Taylor leads in total opportunities over the years, followed closely by J. Jacobs.
- However, when looking at total rush attempts, their rankings flip, with J. Jacobs surpassing J. Taylor.

Pass Completions & Targets:

- The top 5 for total pass completions and targets introduce new names, including T. Kelce, A. St. Brown, and J. Chase.
- T. Kelce and A. St. Brown tie for the most pass completions in the red zone.
- D. Adams leads all players in total targets.


**Fantasy Points Allowed by Defense** 

In the regular season:
- Baltimore (BAL) had the worst performance in 2021, showed improvement, but returned to the bottom in 2024.
- Houston (HOU) stood out in 2022, allowing the second highest average rushing yards over the last four years, but their performance has declined since.
- Carolina (CAR) stood out in 2024, allowing the highest average rushing yards over the last four years —a clear 500-yard gap ahead of the next cluster of teams.

The average number of RBs faced fluctuates significantly year over year. 
Jacksonville (JAX) led in 2021, saw a sharp decline over the next two years, and then rebounded in 2024 with the highest average in the last four years.

Denver faced the fewest average QBs in 2021, then peaked in 2022 and 2023 with one of the highest values before declining. 
Meanwhile, Tennessee (TEN) has shown consistent improvement, recording the highest average QBs faced over the past two seasons.



**Is it real? Or is it just fantasy?**

From 2021 to 2024, Josh Allen, Jalen Hurts, Lamar Jackson, Jayden Daniels, Patrick Mahomes, and Joe Burrow led in average fantasy points per game, all surpassing the 20-point mark.

When comparing average PPR fantasy points per game and total fantasy points, Josh Allen consistently ranks as the top performer.

Josh Allen led in average fantasy points per game in 2021.

In 2022, Jalen Hurts emerged as the top performer, with Josh Allen close behind.

Carson Wentz had the highest average in 2023, narrowly beating Josh Allen, but then dropped off the radar.

Lamar Jackson dominated in 2024, with Josh Allen once again right behind him.


## Conclusions

**Injuries:**
Lower Body Injuries Are the Most Common for NFL players, which suggests leg strength & conditioning programs should be a focus for teams.
Defensive Players (LBs, CBs, and Safeties) have high injury rates, likely due to tackling and coverage responsibilities.

**Red Zone Performance:**
The red zone remains a key battleground, with J. Taylor and J. Jacobs dominating rushing opportunities, while T. Kelce and A. St. Brown lead in pass completions.
Over the years, 2021 stood out as the strongest for overall performance, while 2022 saw the biggest decline, with gradual recovery since.

**Defense Time:**
Carolina (CAR) had the worst rushing defense in 2024, allowing the highest average rushing yards over the last four years, with a 500-yard gap ahead of the next closest teams.

**Fantasy Points:**
Josh Allen has been the most consistent top fantasy performer, leading in both average PPR points per game and total fantasy points across 2021-2024.

