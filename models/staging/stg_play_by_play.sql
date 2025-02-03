WITH source AS (
    SELECT * FROM {{ ref('src_play_by_play_2021') }}
    UNION ALL
    SELECT * FROM {{ ref('src_play_by_play_2022') }}
    UNION ALL 
    SELECT * FROM {{ ref('src_play_by_play_2023') }}
    UNION ALL 
    SELECT * FROM {{ ref('src_play_by_play_2024') }}
),

add_red_zone AS (
    SELECT 
        -- Play identifiers
        play_id,
        game_id,
        SUBSTRING(game_id, 0, 4) AS year,
        legacy_game_id,
        season_type,
        
        -- Team information
        home_team,
        away_team,
        possession_team,
        possession_team_type,
        defending_team,

        -- Field position and game context
        side_of_field,
        distance_to_goal,
        game_date,
        quarter_seconds_remaining,
        half_seconds_remaining,
        game_seconds_remaining,
        game_half,
        quarter_end,
        drive,
        quarter,
        down,
        goal_to_go,
        game_clock,
        yard_line,
        yards_to_go,
        drive_net_yards,
        play_description,

        -- Play details
        play_type,
        yards_gained,
        shotgun,
        no_huddle,
        qb_dropback,
        qb_kneel,
        qb_spike,
        qb_scramble,
        pass_length,
        pass_location,
        air_yards,
        yards_after_catch,
        run_location,
        run_gap,

        -- Player involvement
        rusher_player_id,
        rusher_player_name,
        receiver_player_id,
        receiver_player_name,
        passer_player_id,
        passer_player_name,
        fantasy_player_name,
        fantasy_player_id,

        -- Scoring and results
        touchdown,
        rush_touchdown,
        pass_touchdown,
        field_goal_result,
        kick_distance,
        extra_point_result,
        two_point_conversion_result,
        
        -- Rushing stats
        rush,
        rush_attempt,
        rushing_yards,

        -- Passing stats
        pass_attempt,
        incomplete_pass,
        complete_pass,

        -- Penalty information
        penalty,
        penalty_type,

        -- Team stats
        home_timeouts_remaining,
        away_timeouts_remaining,
        possession_team_timeouts,
        defending_team_timeouts,
        total_home_score,
        total_away_score,
        possession_team_score,
        defending_team_score,
        score_differential,

        -- Advanced metrics
        expected_points,
        expected_points_added,
        total_home_expected_points_added,
        total_away_expected_points_added,
        air_expected_points_added,
        yards_after_catch_expected_points_added,

        -- Win probabilities
        win_probability,
        defensive_win_probability,
        home_win_probability,
        away_win_probability,
        win_probability_added,

        -- Red zone indicator
        CASE 
            WHEN distance_to_goal <= 20 THEN TRUE 
            ELSE FALSE 
        END AS in_red_zone
    FROM 
        source
)

SELECT 
    *
FROM 
    add_red_zone
