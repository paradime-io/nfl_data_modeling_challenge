select
    winner as team,
    sum(home_win) as home_wins,
    sum(away_win) as away_wins,
    sum(home_win) + sum (away_win) as wins,
    count(distinct game_id) as games
from {{ref('int_game_results')}}
group by 1