WITH weekly_ranks AS (
    SELECT
        player_id,
        player_name,
        position,
        recent_team,
        season_week,
        total_fantasy_points,
        total_fantasy_points_ppr,
        -- Rank within position for each week
        RANK() OVER (
            PARTITION BY position, season_week 
            ORDER BY total_fantasy_points DESC
        ) as position_rank_standard,
        RANK() OVER (
            PARTITION BY position, season_week 
            ORDER BY total_fantasy_points_ppr DESC
        ) as position_rank_ppr,
        -- Overall rank for each week
        RANK() OVER (
            PARTITION BY season_week 
            ORDER BY total_fantasy_points DESC
        ) as overall_rank_standard,
        RANK() OVER (
            PARTITION BY season_week 
            ORDER BY total_fantasy_points_ppr DESC
        ) as overall_rank_ppr
    FROM {{ ref('int_fantasy_points') }}
)

SELECT 
    *,
    -- Flag top performers
    CASE WHEN position_rank_standard = 1 THEN TRUE ELSE FALSE END as position_leader_standard,
    CASE WHEN position_rank_ppr = 1 THEN TRUE ELSE FALSE END as position_leader_ppr
FROM weekly_ranks