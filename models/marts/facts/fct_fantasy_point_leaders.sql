WITH player_stats AS (
    SELECT 
        player_id,
        player_name,
        position,
        season_week,
        -- Take the most recent team for players who changed teams
        LAST_VALUE(recent_team) OVER (
            PARTITION BY player_id 
            ORDER BY season_week
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as recent_team,
        total_fantasy_points,
        total_fantasy_points_ppr
    FROM {{ ref('int_fantasy_points') }}
),

player_totals AS (
    SELECT
        player_id,
        player_name,
        position,
        MAX(recent_team) as recent_team,
        SUM(total_fantasy_points) as total_fantasy_points,
        SUM(total_fantasy_points_ppr) as total_fantasy_points_ppr,
        COUNT(DISTINCT season_week) as games_played,
        ROUND(SUM(total_fantasy_points), 2) as total_fantasy_points_rounded,
        ROUND(SUM(total_fantasy_points_ppr), 2) as total_fantasy_points_ppr_rounded,
        ROUND(AVG(total_fantasy_points), 2) as avg_fantasy_points_per_game,
        ROUND(AVG(total_fantasy_points_ppr), 2) as avg_fantasy_points_ppr_per_game
    FROM player_stats
    GROUP BY 1, 2, 3
)

SELECT 
    *,
    -- Adding ranks for better filtering/comparison in Lightdash
    ROW_NUMBER() OVER (ORDER BY total_fantasy_points DESC) as standard_rank,
    ROW_NUMBER() OVER (ORDER BY total_fantasy_points_ppr DESC) as ppr_rank,
    ROW_NUMBER() OVER (PARTITION BY position ORDER BY total_fantasy_points DESC) as standard_position_rank,
    ROW_NUMBER() OVER (PARTITION BY position ORDER BY total_fantasy_points_ppr DESC) as ppr_position_rank
FROM player_totals