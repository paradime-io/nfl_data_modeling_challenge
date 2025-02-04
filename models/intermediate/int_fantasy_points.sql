with fantasy_ppr as (

    SELECT
        player_id,
        player_name,
        position,
        recent_team,
        season - rookie_year as years_experience,
        season,
        rookie_year,
        case when season = rookie_year then 1 else 0 end as is_rookie_season,
        sum(targets) as total_targets,
        sum(fantasy_points) as total_fantasy_points,
        sum(fantasy_points_ppr) as total_ppr,
        count(distinct season_week) as games_played,
        round(sum(fantasy_points) / count(distinct season_week), 2) as avg_fantasy_points_per_game,
        round(sum(fantasy_points_ppr) / count(distinct season_week), 2) as avg_ppr_per_game
    from 
        {{ ref('stg_player_stats_by_game') }}
    where season_type = 'REG'
        and rookie_year is not null --67 rows
    -- and season >= 2020 -- last 5 seasons only
    --AND fantasy_points_ppr > 0
    group by 
        player_id, player_name, position, recent_team, season, rookie_year

), ppr_ranking as (

    select 
        *,
        rank() over (partition by season order by total_fantasy_points desc) as standard_rank,
        rank() over (partition by season order by total_ppr desc) as ppr_rank,
        rank() over (partition by season order by avg_fantasy_points_per_game desc) as standard_rank_by_avg,
        rank() over (partition by season order by avg_ppr_per_game desc) as ppr_rank_by_avg,
    from fantasy_ppr

), filtering as (

    select distinct
        player_id
    from ppr_ranking
    where ppr_rank <= 100
    or ppr_rank_by_avg <= 100


) 
select 
    p.*
from ppr_ranking as p
inner join filtering as f
on p.player_id = f.player_id
qualify count(distinct player_name) over (partition by position) > 10 --there are four positions represented by only 1 player and it 
