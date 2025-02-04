with stats as (
    select distinct
        player_id,
        season_x,
        weight,
        position_x
    from {{ ref('stg_player_stats_all') }}
),
pos as (
    select * from {{ source('vlikar','nfl_positions') }}
)
select stats.*,
    pos.full_position_name,
    pos.full_position_group_name
from stats
left join pos
    on pos.position_x = stats.position_x