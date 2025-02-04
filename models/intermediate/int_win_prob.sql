with games_not_tied as (
    select distinct
        game_id
    from {{ref('stg_play_by_play_all')}}
    where game_seconds_remaining = 0
    and (home_wp = 1 or away_wp = 1)
)
select 
    pbp.game_id,
    game_seconds_remaining,
    total_home_score,
    total_away_score,
    case when total_home_score > total_away_score THEN home_team else away_team end as winning_team,
    case when total_home_score > total_away_score then home_wp else away_wp end as winning_team_wp
from {{ref('stg_play_by_play_all')}} pbp
left join games_not_tied gnt
    on gnt.game_id = pbp.game_id
where gnt.game_id is not null