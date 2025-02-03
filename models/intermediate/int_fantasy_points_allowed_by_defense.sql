-- int_fantasy_points_allowed_by_defense.sql

WITH int_fantasy_points_allowed_by_defense AS (
    SELECT 
        -- Game and Team Context
        year,
        season_type,
        defending_team AS defteam,
        game_id,
        
        -- QB Fantasy Points
        SUM(COALESCE(pass_touchdown, 0) * 4) AS QB_fantasy_pts,

        -- RB Fantasy Points
        SUM(COALESCE(rushing_yards, 0) / 10 
            + COALESCE(rush_touchdown, 0) * 6) AS RB_fantasy_pts,
        SUM(COALESCE(rushing_yards, 0)) AS Total_Rushing_Yards,

        -- Player Involvement
        COUNT(DISTINCT game_id) AS games_played,
        COUNT(DISTINCT passer_player_id) AS unique_qbs_faced,
        COUNT(DISTINCT rusher_player_id) AS unique_rbs_faced,
        COUNT(DISTINCT receiver_player_id) AS unique_wrs_faced

    FROM {{ ref('stg_play_by_play') }}
    WHERE defending_team IS NOT NULL
    GROUP BY year, season_type, defending_team, game_id
)

SELECT * FROM int_fantasy_points_allowed_by_defense