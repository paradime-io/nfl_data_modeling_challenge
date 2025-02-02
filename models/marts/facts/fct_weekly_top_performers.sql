WITH weekly_ranks AS (
    SELECT
        -- Player and game info
        player_id,
        player_name,
        position,
        recent_team,
        season_week,
        current_moon_phase,
        moon_phase_timestamp,
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
        ) as overall_rank_ppr,
        
        -- Moon phase specific rankings
        RANK() OVER (
            PARTITION BY position, current_moon_phase 
            ORDER BY total_fantasy_points DESC
        ) as moon_phase_position_rank,
        
        -- Average points for this moon phase
        AVG(total_fantasy_points) OVER (
            PARTITION BY current_moon_phase
        ) as avg_points_in_moon_phase
    FROM {{ ref('int_fantasy_points') }}
),

final as (
    SELECT 
        *,
        -- Performance flags
        CASE WHEN position_rank_standard = 1 THEN TRUE ELSE FALSE END as position_leader_standard,
        CASE WHEN position_rank_ppr = 1 THEN TRUE ELSE FALSE END as position_leader_ppr,
        CASE WHEN moon_phase_position_rank = 1 THEN TRUE ELSE FALSE END as moon_phase_position_leader,
        ROUND(total_fantasy_points - avg_points_in_moon_phase, 2) as points_vs_moon_phase_avg,
        CASE WHEN position_rank_standard = 1 AND overall_rank_standard <= 10 THEN TRUE ELSE FALSE END as top_10_position_leader
    FROM weekly_ranks
)

SELECT * FROM final