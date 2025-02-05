select
    p.season_x as season,
    p.position_x as position,
    pos.full_position_group_name,
    p.team,
    t.team_full_name,
    SUM(p.fantasy_points_ppr) as ppr_points
from {{ref('stg_player_stats_all')}} p
left join {{ source('vlikar','nfl_positions') }} pos
    on pos.position_x = p.position_x
left join {{ref('stg_nfl_teams')}} t
    on t.team_abbr = p.team
group by all