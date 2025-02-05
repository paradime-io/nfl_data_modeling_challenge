WITH fantasy_points AS (
    SELECT
        player_id,
        player_name,
        position,
        recent_team,
        season_week,
        total_fantasy_points_ppr,
        games_played,
        avg_fantasy_points_ppr_per_game,
        RANK() OVER (ORDER BY total_fantasy_points_ppr DESC) AS ppr_rank
    FROM {{ ref('fct_fantasy_point_leaders') }}
),

red_zone AS (
    SELECT 
        fantasy_player_id,
        fantasy_player_name,
        red_zone_opportunities,
        red_zone_rush_attempts,
        red_zone_targets,
        red_zone_pass_completions,
        red_zone_touchdowns,
        red_zone_td_rate
    FROM {{ ref('int_red_zone_performance') }}
),

clutch_players AS (
    SELECT 
        fantasy_player_id,
        fantasy_player_name,
        clutch_play_count,
        clutch_epa,
        clutch_touchdowns
    FROM {{ ref('int_clutch_performance') }}
),

expected_fantasy AS (
    SELECT 
        player_id,
        player_name,
        expected_fantasy_points,
        actual_fantasy_points,
        fantasy_points_over_expectation
    FROM {{ ref('int_expected_fantasy_points') }}
)

SELECT
    f.player_id,
    f.player_name,
    f.position,
    f.recent_team,
    f.season_week,
    f.total_fantasy_points_ppr,
    f.games_played,
    f.avg_fantasy_points_ppr_per_game,
    f.ppr_rank,
    r.red_zone_opportunities,
    r.red_zone_rush_attempts,
    r.red_zone_targets,
    r.red_zone_pass_completions,
    r.red_zone_touchdowns,
    r.red_zone_td_rate,
    c.clutch_play_count,
    c.clutch_epa,
    c.clutch_touchdowns,
    e.expected_fantasy_points,
    e.actual_fantasy_points,
    e.fantasy_points_over_expectation
FROM fantasy_points f
LEFT JOIN red_zone r ON f.player_id = r.fantasy_player_id
LEFT JOIN clutch_players c ON f.player_id = c.fantasy_player_id
LEFT JOIN expected_fantasy e ON f.player_id = e.player_id
ORDER BY f.total_fantasy_points_ppr DESC
