with team_aggregated as (
    select
        team,
        AVG(case when type ='offense' then epa else null end) AS TEAM_OFFENSIVE_EPA, 
        AVG(case when type ='defense' then epa else null end) AS TEAM_DEFENSIVE_EPA,
        count(distinct game_id) as games_played
    from {{ref('int_team_epa')}}
    group by team
),

median_values as (
    select
        percentile_cont(0.5) within group (order by TEAM_OFFENSIVE_EPA) as median_offensive_epa,
        percentile_cont(0.5) within group (order by TEAM_DEFENSIVE_EPA) as median_defensive_epa
    from team_aggregated
)

select
    ta.team,
    ta.TEAM_OFFENSIVE_EPA,
    ta.TEAM_DEFENSIVE_EPA,
    mv.median_offensive_epa,
    mv.median_defensive_epa
from team_aggregated ta
cross join median_values mv
where ta.games_played >= 10