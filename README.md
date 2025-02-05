# Fantasy Football dbt Data Modeling Challenge - Fantasy Football Edition

Project for the dbt™ Data Modeling Challenge - Fantasy Football Edition, hosted by Paradime!

*by **[Arthur Rogério](https://www.linkedin.com/in/rogeriothur/)***  

---

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [Methodology](#methodology)
4. [Visualizations](#visualizations)
5. [Insights](#insights)
6. [Conclusions](#conclusions)

---

## Introduction

This project transforms raw fantasy football data into actionable insights by leveraging robust data modeling with dbt™, data warehousing in Snowflake, and interactive dashboards built in Lightdash. Our aim is to uncover key trends in player performance, team defense, red zone efficiency, and the impact of injuries on NFL fantasy football outcomes.

**Dashboard Link:** [Lightdash Dashboard](https://app.lightdash.cloud/projects/f661a422-a5cb-46d9-9f0c-79b443b00694/dashboards/49af509c-c067-4a7d-94d3-07e05a64d881/view)  

---

## Data Sources

- **NFL Fantasy Football Data (Snowflake):**
  - **player_stats_by_game:** Contains per-game statistics for players (e.g., passing, rushing, receiving, fantasy points).
  - **play_by_play:** Provides detailed play-by-play data including EPA (Expected Points Added), yards gained, and play types.
- **NFL Injuries Data:**
  - **nfl_injuries:** Reports detailing player injuries, statuses, and modifications (e.g., report status, practice status).

---

## Data Lineage
![image](images/data_lineage.png)

## Methodology

### Tools Used
- **Paradime:** For dbt™ modeling and SQL development.
- **Snowflake:** Cloud data warehousing and computing.
- **Lightdash:** Building interactive, “scroll-stopper” dashboards.
- **dbt:** For data transformations, testing, and documentation.

### Applied Techniques
- **Staging Layer:** Standardized raw data (e.g., renaming columns with suffixes like `_nr` for numbers and `_ts` for timestamps) and applied light transformations.
- **Data Mart Layer:** Built fact and dimension models:
  - **agg_player_performance:** Aggregates player statistics by week and season.
  - **agg_team_defense:** Aggregates defensive metrics (yards allowed, EPA allowed, touchdowns allowed).
  - **fact_redzone_efficiency:** Analyzes offensive efficiency in the red zone.
  - **fact_injury_impact:** Joins player performance with injury data to assess impact.
- **Testing & Documentation:** Implemented dbt tests (e.g., `not_null`, `unique_combination_of_columns`) to ensure data quality.
- **Visualization:** Developed dashboards in Lightdash for each analytical focus area.

---

## Visualizations

Our dashboards provide multiple perspectives on NFL fantasy football data:

1. **Top Performers**
   - **Objective:** Display the top 10 players based on total fantasy points.
   - **Key Metrics:** `total_fantasy_points` (standard) and `total_fantasy_points_ppr` (Points Per Reception).
   - **Visualization:** Bar chart ranking players, with filters for season and week.

2. **Team Defense Impact**
   - **Objective:** Evaluate defensive performance.
   - **Key Metrics & Visualizations:**
     - **Defensive Yards Allowed by Team:** Bar chart exibiting `total_yards_allowed`.
     - **Defensive EPA Allowed:** Bar/column chart displaying `total_epa_allowed`.
     - **Defensive Touchdowns Allowed:** Bar chart com `total_touchdowns_allowed`.
   - **Filters:** Seleção por `week_nr` para análises temporais.

3. **Red Zone Efficiency**
   - **Objective:** Measure offensive performance in high-pressure situations.
   - **Key Metrics:** `redzone_plays_nr`, `redzone_touchdowns_nr`, `avg_yards_gained`, `avg_epa`, e `touchdown_rate`.
   - **Visualization:** Gráficos de pizza ou barras que evidenciem a taxa de conversão de touchdowns na red zone.

4. **Injury Impact**
   - **Objective:** Comparar a performance dos jogadores com e sem lesões.
   - **Key Metrics:** `total_fantasy_points` e `total_fantasy_points_ppr` diferenciados por `injury_flag`.
   - **Visualization:** Gráfico de barras lado a lado para identificar a influência das lesões.

*Incluir capturas de tela ou links diretos para os dashboards interativos no Lightdash conforme a disponibilidade.*

---

## Insights

*(Esta seção será atualizada à medida que os dados das visualizações forem analisados. Seguem alguns insights preliminares baseados nas análises realizadas:)*

- **Top Performers:**  
  Os jogadores que acumulam altos valores de `total_fantasy_points` consistentemente se destacam, mas diferenças surgem quando se compara o sistema padrão com o sistema PPR. Isso indica que jogadores com muitas recepções podem ser valorizados de forma diferente em ligas PPR.

- **Team Defense Impact:**  
  As defesas que restringem os yards permitidos e limitam o EPA tendem a sofrer menos touchdowns, evidenciando uma relação clara entre eficiência defensiva e redução de pontos adversários.

- **Red Zone Efficiency:**  
  Equipes com altas taxas de conversão na red zone (elevado `touchdown_rate`) demonstram maior eficiência ofensiva, um indicador crítico em momentos decisivos dos jogos.

- **Injury Impact:**  
  A análise preliminar sugere que jogadores com lesões relatadas apresentam uma redução significativa na produção de pontos, sublinhando a importância de monitorar o status de saúde para decisões de escalação.

*Os insights serão refinados conforme novos dados e análises sejam incorporados.*

---

## Conclusions

Our analysis demonstrates that robust data modeling combined with interactive visualization can reveal critical insights into fantasy football performance. Key takeaways include:

- **Defensive Excellence:**  
  Reducing yards and EPA allowed correlates strongly with defensive success.

- **Offensive Prowess in the Red Zone:**  
  Efficient red zone performance is crucial for maximizing scoring opportunities.

- **Injury Impact:**  
  Monitoring injury status is essential, as injuries have a clear negative impact on player performance.

These findings offer valuable guidance for fantasy football managers and set the stage for further predictive analysis with additional external data sources.

---

*Thank you for reviewing this submission. We believe the combination of detailed data modeling, rigorous testing, and intuitive visualizations provides a strong foundation for actionable insights in the world of fantasy football.*

