select
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
    row_number() over (partition by season_week order by cumulative_points desc) as cumulative_points_rank,
    row_number() over (partition by season_week, position order by cumulative_points desc) as positional_cumulative_points_rank
from
    {{ ref('int_fantasy_points_weekly') }}