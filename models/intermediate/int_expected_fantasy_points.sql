WITH expected_points AS (
    SELECT
        player_id,
        player_name,
        SUM(
            (rushing_yards * 0.1) + (rushing_tds * 6) +
            (receiving_yards * 0.1) + (receiving_tds * 6) +
            (receptions * 1.0)  -- Adjust for PPR scoring
        ) AS expected_fantasy_points,
        SUM(fantasy_points_ppr) AS actual_fantasy_points,
        -- Efficiency metric: Overperformance vs. expectation
        (SUM(fantasy_points_ppr) - SUM(
            (rushing_yards * 0.1) + (rushing_tds * 6) +
            (receiving_yards * 0.1) + (receiving_tds * 6) +
            (receptions * 1.0)
        )) AS fantasy_points_over_expectation
    FROM {{ ref('stg_player_stats_by_game') }}
    GROUP BY player_id, player_name
)

SELECT 
    player_id,
    player_name,
    expected_fantasy_points,
    actual_fantasy_points,
    fantasy_points_over_expectation,
FROM expected_points
