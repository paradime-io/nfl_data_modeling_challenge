-- models/marts/facts/fct_superbowl_prediction.sql
WITH matchup_stats AS (
    SELECT * FROM {{ ref('fct_team_comparison') }}
),

weighted_scores AS (
    SELECT 
        team,
        -- Normalize and weight key metrics
        (season_avg_epa / MAX(season_avg_epa) OVER()) * 0.3 + 
        (red_zone_efficiency / MAX(red_zone_efficiency) OVER()) * 0.3 +
        (qb_epa_per_game / MAX(qb_epa_per_game) OVER()) * 0.4 as weighted_score
    FROM matchup_stats
)

SELECT 
    team,
    weighted_score,
    weighted_score / SUM(weighted_score) OVER() as win_probability
FROM weighted_scores
ORDER BY win_probability DESC