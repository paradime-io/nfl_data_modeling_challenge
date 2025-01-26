select player_id,
 player_name,
 team,
 opponent_team,
 position,
 position_group,
 season,
 season_type,
 season_week,
 fantasy_points,
 fantasy_points_ppr
from {{ ref('stg_player_stats_by_game') }}
