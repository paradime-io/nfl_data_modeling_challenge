with overtime_games as (
  select 
    distinct game_id
  from {{ ref('stg_play_by_play') }}  
  where game_half = 'Overtime'
),

overtime as (
  select 
    p.game_id,
    case when o.game_id is not null then 1 else 0 end as is_overtime
  from {{ ref('stg_play_by_play') }}  p
  left join overtime_games o
  on p.game_id = o.game_id
)

select distinct 
  p.game_id, 
  game_date, 
  season_type, 
  home_team, 
  away_team, 
  max(total_home_score) as total_home_score, max(total_away_score) as total_away_score,
  case 
    when max(total_home_score) > max(total_away_score) then home_team
    when max(total_home_score) < max(total_away_score) then away_team
    else null end as winning_team,
  is_overtime
from {{ ref('stg_play_by_play') }} p
join overtime o
on p.game_id = o.game_id
group by p.game_id, season_type, home_team, away_team, game_date, is_overtime