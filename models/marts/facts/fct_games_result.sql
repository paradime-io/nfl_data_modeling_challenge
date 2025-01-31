select
   r.game_id,
   r.game_date,
   r.season_type,
   r.home_team,
   r.away_team,
   r.total_home_score, 
   r.total_away_score,
   r.winning_team,
   -- fantasy points for the home team
   sum(case when r.home_team = p.team and r.away_team = p.opponent_team then p.fantasy_points end) as home_fantasy_points,
    -- fantasy points for the away team
   sum(case when r.away_team = p.team and r.home_team = p.opponent_team then p.fantasy_points end) as away_fantasy_points,
   -- fantasy points ppr for the home team
   sum(case when r.home_team = p.team and r.away_team = p.opponent_team then p.fantasy_points_ppr end) as home_fantasy_points_ppr,
    -- fantasy points ppr for the away team
   sum(case when r.away_team = p.team and r.home_team = p.opponent_team then p.fantasy_points_ppr end) as away_fantasy_points_ppr,

   case when r.home_team = r.winning_team then 1 else 0 end as is_home_team_win,
   case when r.away_team = r.winning_team then 1 else 0 end as is_away_team_win,
   is_overtime 
from  {{ ref('int_game_result') }} r
join {{ ref('int_player_game_fantasy_points') }}  p
on r.season_type = p.season_type
and 
 ( (r.home_team = p.team and r.away_team = p.opponent_team)
 or 
   (r.away_team = p.team and r.home_team = p.opponent_team)
 )  
group by 
   r.game_id,
   r.game_date,
   r.season_type,
   r.home_team,
   r.away_team,
   r.total_home_score, 
   r.total_away_score,
   r.winning_team,
   is_overtime