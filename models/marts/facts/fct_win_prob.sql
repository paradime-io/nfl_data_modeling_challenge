select 
    3600 - game_seconds_remaining as game_time,
    winning_team_wp,
    1-winning_team_wp as losing_team_wp
from {{ref('int_win_prob')}}