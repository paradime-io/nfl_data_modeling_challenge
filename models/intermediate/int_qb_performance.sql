-- models/intermediate/int_qb_performance.sql
SELECT 
    p.player_name,
    p.team,
    SUM(p.pass_yards) as total_pass_yards,
    SUM(p.pass_attempts) as total_attempts,
    SUM(p.completions) as total_completions,
    SUM(p.passing_air_yards) as total_air_yards,
    SUM(p.passing_epa) as total_passing_epa,
    AVG(p.passing_epa) as avg_epa_per_game,
    COUNT(DISTINCT p.season_week) as games_played
FROM {{ ref('stg_player_stats_by_game') }} p
WHERE 
    p.position = 'QB'
    AND p.team IN ('KC', 'PHI')
    AND p.season_type = 'REG'
GROUP BY 1, 2