SELECT
    player_id,
    player_name,
    position,
    recent_team,
    season,
    season_week,
    total_targets,
    total_fantasy_points,
    total_fantasy_points_ppr,
    games_played,
    sum(total_fantasy_points) over (partition by player_name order by season_week asc) as cumulative_points,
    row_number() over (partition by season_week order by total_fantasy_points desc) as weekly_points_rank,
    row_number() over (partition by season_week order by total_fantasy_points_ppr desc) as weekly_ppr_rank,
    row_number() over (partition by season_week, position order by total_fantasy_points desc) as positional_weekly_points_rank,
    row_number() over (partition by season_week, position order by total_fantasy_points_ppr desc) as positional_weekly_ppr_rank
FROM 
    {{ ref('int_fantasy_points') }}
--  WHERE 
--      player_id = '00-0033040' order by season_week asc
--  GROUP BY 
--      player_id, player_name, position, recent_team, season, season_week
