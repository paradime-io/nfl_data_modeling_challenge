-- models/marts/facts/fct_team_comparison.sql
WITH team_performance AS (
    SELECT * FROM {{ ref('int_team_performance') }}
),

qb_performance AS (
    SELECT * FROM {{ ref('int_qb_performance') }}
),

combined_analysis AS (
    SELECT 
        t.team,
        t.season_avg_epa,
        t.red_zone_efficiency,
        t.season_avg_wpa,
        q.player_name as primary_qb,
        q.avg_epa_per_game as qb_epa_per_game,
        q.total_pass_yards / NULLIF(q.games_played, 0) as pass_yards_per_game,
        q.total_completions::float / NULLIF(q.total_attempts, 0) as completion_rate
    FROM team_performance t
    LEFT JOIN qb_performance q 
        ON t.team = q.team
    WHERE t.team IN ('KC', 'PHI')
)

SELECT 
    *,
    RANK() OVER (ORDER BY season_avg_epa DESC) as epa_rank,
    RANK() OVER (ORDER BY red_zone_efficiency DESC) as redzone_rank,
    RANK() OVER (ORDER BY qb_epa_per_game DESC) as qb_rank
FROM combined_analysis