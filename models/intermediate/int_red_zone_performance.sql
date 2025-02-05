WITH red_zone AS (
    SELECT
        fantasy_player_id,
        fantasy_player_name,
        COUNT(CASE WHEN play_type = 'run' AND rush_attempt = 1 THEN 1 END) AS red_zone_rush_attempts,
        COUNT(CASE WHEN play_type = 'pass' AND complete_pass = 1 THEN 1 END) AS red_zone_pass_completions,
        COUNT(CASE WHEN play_type = 'pass' THEN 1 END) AS red_zone_targets,
        COUNT(CASE WHEN touchdown = 1 THEN 1 END) AS red_zone_touchdowns
    FROM {{ ref('stg_play_by_play') }}
    WHERE in_red_zone = TRUE
    GROUP BY fantasy_player_id, fantasy_player_name
)

SELECT 
    fantasy_player_id,
    fantasy_player_name,
    red_zone_rush_attempts + red_zone_targets AS red_zone_opportunities,
    red_zone_rush_attempts,
    red_zone_pass_completions,
    red_zone_targets,
    red_zone_touchdowns,
    (red_zone_touchdowns * 1.0 / NULLIF(red_zone_opportunities, 0)) AS red_zone_td_rate
FROM red_zone
