SELECT
    player_id,
    player_name,
    position,
    recent_team,
    total_fantasy_points,
    total_fantasy_points_ppr,
    games_played,
    avg_fantasy_points_per_game,
    avg_fantasy_points_ppr_per_game,
    RANK() OVER (ORDER BY total_fantasy_points DESC) AS standard_rank,
    RANK() OVER (ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank,
    RANK() OVER (PARTITION BY position ORDER BY total_fantasy_points DESC) AS standard_rank_for_position,
    RANK() OVER (PARTITION BY position ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank_for_position
FROM 
    {{ ref('int_fantasy_points') }}
GROUP BY 
    player_id,
    player_name,
    position,
    recent_team,
    total_fantasy_points,
    total_fantasy_points_ppr,
    games_played,
    avg_fantasy_points_per_game,
    avg_fantasy_points_ppr_per_game
ORDER BY 
    total_fantasy_points DESC