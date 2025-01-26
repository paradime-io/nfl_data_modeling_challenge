select distinct 
  game_id, 
  game_date, 
  season_type, 
  home_team, 
  away_team, 
  max(total_home_score) as total_home_score, max(total_away_score) as total_away_score,
  case 
    when max(total_home_score) > max(total_away_score) then home_team
    when max(total_home_score) < max(total_away_score) then away_team
    else null end as winning_team
from {{ ref('stg_play_by_play') }}
group by game_id, season_type, home_team, away_team, game_date