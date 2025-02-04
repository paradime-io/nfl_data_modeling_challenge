SELECT
    player_id,
    player_name,
    position,
    recent_team,
    season,
    season_week,
    SUM(targets) AS total_targets,
    SUM(fantasy_points) AS total_fantasy_points,
    SUM(fantasy_points_ppr) AS total_fantasy_points_ppr
FROM 
    {{ ref('stg_player_stats_by_game') }}
WHERE 
    SEASON_TYPE = 'REG'
GROUP BY 
    player_id, player_name, position, recent_team, season, season_week
