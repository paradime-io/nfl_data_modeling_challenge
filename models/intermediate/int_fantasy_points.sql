SELECT
    player_id,
    player_name,
    position,
    recent_team,
    season,
    --season_week, -- Having this column here messed up the grain, so I removed it to get season totals
    SUM(targets) AS total_targets,
    SUM(fantasy_points) AS total_fantasy_points,
    SUM(fantasy_points_ppr) AS total_fantasy_points_ppr,
    COUNT(DISTINCT season_week) AS games_played,
    ROUND(SUM(fantasy_points) / COUNT(DISTINCT season_week), 2) AS avg_fantasy_points_per_game,
    ROUND(SUM(fantasy_points_ppr) / COUNT(DISTINCT season_week), 2) AS avg_fantasy_points_ppr_per_game
FROM 
    {{ ref('stg_player_stats_by_game') }}
WHERE 
    SEASON_TYPE = 'REG'
GROUP BY 
    player_id, player_name, position, recent_team, season
    --, season_week
