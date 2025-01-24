SELECT
    player_id,
    player_name,
    position,
    -- recent_team, Removing as team changes affect season totals
    season,
    -- season_week, Removing as it throws out the granuallity going for season totals
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
    player_id, player_name, position, season
