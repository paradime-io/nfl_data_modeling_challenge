-- fct_red_zone_player_stats.sql

WITH aggregated_stats AS (
    SELECT
        fantasy_player_id,
        fantasy_player_name,
        COUNT(CASE 
            WHEN play_type = 'run' AND rush_attempt = 1 THEN 1 
        END) AS total_rush_attempts,
        COUNT(CASE 
            WHEN play_type = 'pass' AND (incomplete_pass = 1 OR complete_pass = 1) THEN 1 
        END) AS total_targets,
        COUNT(CASE 
            WHEN play_type = 'pass' AND complete_pass = 1 THEN 1 
        END) AS total_pass_completions
    FROM {{ ref('int_red_zone_plays') }}
    GROUP BY 
        fantasy_player_id, fantasy_player_name
)

SELECT 
    fantasy_player_id,
    fantasy_player_name,
    (total_rush_attempts + total_targets) AS total_opportunities,
    total_rush_attempts,
    total_targets,
    total_pass_completions
FROM aggregated_stats
ORDER BY total_rush_attempts DESC
