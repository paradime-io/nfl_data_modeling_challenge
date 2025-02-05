with game_results as (
select 
    game_id,
    home_team,
    away_team,
    max(total_home_score) as home_score,
    max(total_away_score) as away_score,
    case when max(total_home_score) > max(total_away_score) then home_team
        when max(total_home_score) < max(total_away_score) then away_team
        else 'TIE' end as WINNER
from {{ref('stg_play_by_play_all')}}
group by 1,2,3
)
select
    gr.*,
    case when gr.winner = gr.home_team then 1 else 0 end as home_win,
    case when gr.winner = gr.away_team then 1 else 0 end as away_win
from game_results gr
