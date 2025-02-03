
SELECT year,
       season_type,
       defteam, 
       SUM(QB_fantasy_pts) AS Total_QB_Points,
       SUM(RB_fantasy_pts) AS Total_RB_Points,
       SUM(Total_Rushing_Yards) AS Total_Rushing_Yards,
       COUNT(DISTINCT game_id) AS Games_Played,
       COUNT(DISTINCT unique_qbs_faced) AS QBs_Faced,
       COUNT(DISTINCT unique_rbs_faced) AS RBs_Faced,
       COUNT(DISTINCT unique_wrs_faced) AS WRs_Faced
FROM {{ ref('int_fantasy_points_allowed_by_defense') }}
GROUP BY year, season_type, defteam
ORDER BY Total_QB_Points DESC, Total_RB_Points DESC