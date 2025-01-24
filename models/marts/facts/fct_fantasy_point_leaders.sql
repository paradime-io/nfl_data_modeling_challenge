SELECT
    player_id,
    player_name,
    position,
    total_fantasy_points,
    total_fantasy_points_ppr,
    games_played,
    avg_fantasy_points_per_game,
    avg_fantasy_points_ppr_per_game,
    RANK() OVER (ORDER BY total_fantasy_points DESC) AS standard_rank,
    RANK() OVER (ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank,
    RANK() OVER (PARTITION BY position ORDER BY total_fantasy_points DESC) as standard_position_rank,
    RANK() OVER (PARTITION BY position ORDER BY total_fantasy_points_ppr DESC) as ppr_position_rank
FROM 
    {{ ref('int_fantasy_points') }}
ORDER BY 
    total_fantasy_points DESC