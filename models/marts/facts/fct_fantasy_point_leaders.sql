SELECT
    player_id,
    player_name,
    position,
    recent_team,
    SUM(total_fantasy_points) as total_fantasy_points,
    SUM(total_fantasy_points_ppr) as total_fantasy_points_ppr,
    --  games_played,
    --  avg_fantasy_points_per_game,
    --  avg_fantasy_points_ppr_per_game,
    --  RANK() OVER (ORDER BY total_fantasy_points DESC) AS standard_rank,
    --  RANK() OVER (ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank
FROM 
    {{ ref('int_fantasy_points') }}
GROUP BY ALL
ORDER BY 
    total_fantasy_points DESC