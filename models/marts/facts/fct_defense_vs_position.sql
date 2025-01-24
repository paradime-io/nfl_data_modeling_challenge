WITH player_games AS (
    SELECT 
        g.player_id,
        g.player_name,
        g.position,
        g.opponent_team,
        g.season_week,
        g.fantasy_points,
        g.fantasy_points_ppr
    FROM {{ ref('stg_player_stats_by_game') }} g
),

defense_aggregates AS (
    SELECT
        opponent_team as defense_team,
        position,
        COUNT(DISTINCT player_id) as players_faced,
        COUNT(DISTINCT season_week) as games_played,
        ROUND(AVG(fantasy_points), 2) as avg_fantasy_points_allowed,
        ROUND(AVG(fantasy_points_ppr), 2) as avg_fantasy_points_ppr_allowed,
        ROUND(SUM(fantasy_points), 2) as total_fantasy_points_allowed,
        ROUND(SUM(fantasy_points_ppr), 2) as total_fantasy_points_ppr_allowed
    FROM player_games
    GROUP BY 1, 2
)

SELECT 
    *,
    -- Rank defenses (1 = least points allowed)
    RANK() OVER (
        PARTITION BY position 
        ORDER BY avg_fantasy_points_allowed ASC
    ) as position_defense_rank_standard,
    RANK() OVER (
        PARTITION BY position 
        ORDER BY avg_fantasy_points_ppr_allowed ASC
    ) as position_defense_rank_ppr
FROM defense_aggregates 