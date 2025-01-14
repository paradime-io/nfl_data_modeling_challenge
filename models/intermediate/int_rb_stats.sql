select
    player_id,
    --  position,
    player_name,
    recent_team,
    season,
    season_week,
    targets,
    target_share,
    sum(receiving_yards) as total_receiving_yards,
    sum(receiving_yards_after_catch) as total_receiving_yards_after_catch,
    sum(receiving_fumbles) as total_receiving_fumbles,
    sum(receiving_fumbles_lost) as total_receiving_fumbles_lost
from
    {{ref('stg_player_stats_by_game')}}
WHERE
    position = 'RB'
group by
    player_id, player_name, recent_team, season, targets, target_share, season_week