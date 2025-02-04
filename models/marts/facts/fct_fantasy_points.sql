SELECT
    player_id,
    player_name,
    position,
    recent_team,
    sum(total_fantasy_points) as fantasy_points,
    sum(total_fantasy_points_ppr)  as fantasy_points_ppr
FROM 
    {{ ref('int_fantasy_points') }}
GROUP BY 
    player_id,
    player_name,
    position,
    recent_team
