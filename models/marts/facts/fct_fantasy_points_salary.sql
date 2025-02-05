with points as (
    select * from {{ref('int_fantasy_points_pos')}}
    where season = 2023
),
spend as (
    select team,
        position,
        spending * 1000000 as spend
    from {{ref('stg_team_spend')}}
)

select 
    p.* ,
    s.spend,
    nullif(s.spend / ppr_points, 0) as spend_per_points
from points p
left join spend s
    on s.team = p.team and p.position = s.position