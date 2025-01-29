with fantasy_ppr as (
    SELECT
        player_id,
        player_name,
        position,
        recent_team,
        rank() over (partition by player_id order by season) - 1 as years_experience,
        season,
        SUM(targets) AS total_targets,
        SUM(fantasy_points) AS total_fantasy_points,
        SUM(fantasy_points_ppr) AS total_fantasy_points_ppr,
        COUNT(DISTINCT season_week) AS games_played,
        ROUND(SUM(fantasy_points) / COUNT(DISTINCT season_week), 2) AS avg_fantasy_points_per_game,
        ROUND(SUM(fantasy_points_ppr) / COUNT(DISTINCT season_week), 2) AS avg_fantasy_points_ppr_per_game
    FROM 
        {{ ref('stg_player_stats_by_game') }}
    WHERE 
        SEASON_TYPE = 'REG'
    --AND fantasy_points_ppr > 0
    GROUP BY 
        player_id, player_name, position, recent_team, season
)
select 
    *,
    RANK() OVER (partition by season ORDER BY total_fantasy_points DESC) AS standard_rank,
    RANK() OVER (partition by season ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank,
    RANK() OVER (partition by season ORDER BY avg_fantasy_points_per_game DESC) AS standard_rank_by_avg,
    RANK() OVER (partition by season ORDER BY avg_fantasy_points_ppr_per_game DESC) AS ppr_rank_by_avg,
from fantasy_ppr