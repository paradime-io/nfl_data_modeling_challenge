with home_games as (
    select home_team,
        count(distinct game_id) as home_games
    from {{ref('int_game_results')}}
    group by 1
),

away_games as (
    select away_team,
        count(distinct game_id) as away_games
    from {{ref('int_game_results')}}
    group by 1
),

transformed as (
select
    gr.winner as team,
    t.team_full_name,
    sum(gr.home_win) as home_wins,
    sum(gr.away_win) as away_wins,
    sum(gr.home_win) + sum (gr.away_win) as wins,
    coalesce(hg.home_games,0) + coalesce(ag.away_games,0) as all_games,
    coalesce(hg.home_games,0) as home_games,
    coalesce(ag.away_games,0) as away_games
from {{ref('int_game_results')}} gr
left join home_games hg on hg.home_team = gr.winner
left join away_games ag on ag.away_team = gr.winner
left join {{ref('stg_nfl_teams')}} t on t.team_abbr = gr.winner
group by all
)

select
    team,
    team_full_name,
    home_wins,
    away_wins,
    wins,
    all_games,
    home_games,
    away_games,
    wins / nullif(all_games,0) as win_rate,
    home_wins / nullif(home_games,0) as home_win_rate,
    away_wins / nullif(away_games,0) as away_win_rate
from transformed