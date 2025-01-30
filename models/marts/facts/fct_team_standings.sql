with fantasy_points_per_team as (
  select
    team,
    sum(fantasy_points) as total_fantasy_points,
    sum(fantasy_points_ppr) as total_fantasy_points_ppr
  from {{ ref('int_player_game_fantasy_points') }}
  where season_type = 'REG'
  group by team
)
select
  team_name,
  team_abbr, 
  team_conf,
  team_division,
  team_nick,
  sum(case when winning_team = team_abbr then 1 end) as wins,
  sum(case when winning_team != team_abbr then 1 end) as loses,
  sum(case when team_abbr = g.home_team then total_home_score else total_away_score end) as total_points_scored,
  sum(case when team_abbr = g.home_team then total_away_score else total_home_score end) as total_points_lost,
  total_fantasy_points,
  total_fantasy_points_ppr,
  rank() over(partition by team_division order by wins desc, total_points_scored desc) as division_rank,
  rank() over(partition by team_conf order by wins desc, total_points_scored desc) as conference_rank
from {{ ref('nfl_teams_2023') }}  t
join {{ ref('int_game_result') }} g
on (t.team_abbr = g.home_team or t.team_abbr = g.away_team)
join fantasy_points_per_team fp
on t.team_abbr = fp.team
where g.season_type = 'REG'
group by team_name, team_abbr, team_conf, team_division, team_nick, total_fantasy_points, total_fantasy_points_ppr
order by wins desc