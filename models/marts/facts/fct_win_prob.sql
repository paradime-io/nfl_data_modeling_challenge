select 
    floor(3600 - game_seconds_remaining / 60) * 60 as game_time,
    avg(winning_team_wp) as winning_team_wp,
    1-avg(winning_team_wp) as losing_team_wp
from {{ref('int_win_prob')}}
where game_time is not null
group by 1