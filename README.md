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
[Brief overview: What you aimed to achieve and why it matters]
[Include link to Lightdash dashboard]

## Data Sources
- [Fantasy Football Data (Snowflake)](... link or details ...)
- [Additional Data Set 1] - [Description]
- [Additional Data Set 2] - [Description]

## Methodology
### Tools Used
- Paradime for dbt™ modeling and SQL
- Snowflake for data warehousing
- Lightdash for visualization
- [Any other tools/techniques used]

### Applied Techniques
[Discuss transformations, tests, and models built]

## Visualizations
[Include screenshots or links to Lightdash dashboards]

## Insights
[Detail your findings, supported by data and visuals]

## Conclusions
[Summarize key takeaways and recommendations]
