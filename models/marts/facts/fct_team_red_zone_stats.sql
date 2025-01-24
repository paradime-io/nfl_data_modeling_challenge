WITH team_rz_plays AS (
    SELECT
        possession_team,
        COUNT(*) as total_red_zone_plays,
        COUNT(CASE WHEN touchdown = 1 THEN 1 END) as red_zone_touchdowns,
        COUNT(CASE WHEN play_type = 'run' THEN 1 END) as rush_attempts,
        COUNT(CASE WHEN play_type = 'pass' AND (complete_pass = 1 OR incomplete_pass = 1) THEN 1 END) as pass_attempts,
        COUNT(CASE WHEN play_type = 'run' AND touchdown = 1 THEN 1 END) as rush_touchdowns,
        COUNT(CASE WHEN play_type = 'pass' AND touchdown = 1 THEN 1 END) as pass_touchdowns
    FROM {{ ref('int_red_zone_plays') }}
    GROUP BY 1
)

SELECT
    possession_team as team,
    total_red_zone_plays,
    red_zone_touchdowns,
    rush_attempts,
    pass_attempts,
    rush_touchdowns,
    pass_touchdowns,
    ROUND(CAST(red_zone_touchdowns AS FLOAT) / NULLIF(total_red_zone_plays, 0) * 100, 2) as red_zone_touchdown_percentage,
    ROUND(CAST(rush_touchdowns AS FLOAT) / NULLIF(rush_attempts, 0) * 100, 2) as rush_touchdown_percentage,
    ROUND(CAST(pass_touchdowns AS FLOAT) / NULLIF(pass_attempts, 0) * 100, 2) as pass_touchdown_percentage,
    RANK() OVER (ORDER BY CAST(red_zone_touchdowns AS FLOAT) / NULLIF(total_red_zone_plays, 0) DESC) as efficiency_rank
FROM team_rz_plays