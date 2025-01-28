SELECT
    player_id,
    player_name,
    position,
    recent_team,
    years_experience,
    season,
    total_fantasy_points,
    total_fantasy_points_ppr,
    games_played,
    avg_fantasy_points_per_game,
    avg_fantasy_points_ppr_per_game,
    RANK() OVER (ORDER BY total_fantasy_points DESC) AS standard_rank,
    RANK() OVER (ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank,
    RANK() OVER (ORDER BY avg_fantasy_points_per_game DESC) AS standard_rank_by_avg,
    RANK() OVER (ORDER BY avg_fantasy_points_ppr_per_game DESC) AS ppr_rank_by_avg,
    
FROM 
    {{ ref('int_fantasy_points') }}
ORDER BY 
    total_fantasy_points DESC