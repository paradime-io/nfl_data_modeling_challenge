WITH source AS (
    SELECT 
        * 
    FROM 
        {{ source('nfl', 'play_by_play') }}
),

renamed AS (
    SELECT 
        -- Play identifiers
        play_id,
        game_id,
        old_game_id_x AS legacy_game_id,
        season_type,
        
        -- Team information
        home_team,
        away_team,
        posteam AS possession_team,
        posteam_type AS possession_team_type,
        defteam AS defending_team,

        -- Field position and game context
        side_of_field,
        yardline_100 AS distance_to_goal,
        game_date,
        quarter_seconds_remaining,
        half_seconds_remaining,
        game_seconds_remaining,
        game_half,
        quarter_end,
        drive,
        qtr AS quarter,
        down,
        goal_to_go,
        time AS game_clock,
        yrdln AS yard_line,
        ydstogo AS yards_to_go,
        ydsnet AS drive_net_yards,
        desc AS play_description,

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
        two_point_conv_result AS two_point_conversion_result,
        
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
        posteam_timeouts_remaining AS possession_team_timeouts,
        defteam_timeouts_remaining AS defending_team_timeouts,
        total_home_score,
        total_away_score,
        posteam_score AS possession_team_score,
        defteam_score AS defending_team_score,
        score_differential,

        -- Advanced metrics
        ep AS expected_points,
        epa AS expected_points_added,
        total_home_epa AS total_home_expected_points_added,
        total_away_epa AS total_away_expected_points_added,
        air_epa AS air_expected_points_added,
        yac_epa AS yards_after_catch_expected_points_added,

        -- Win probabilities
        wp AS win_probability,
        def_wp AS defensive_win_probability,
        home_wp AS home_win_probability,
        away_wp AS away_win_probability,
        wpa AS win_probability_added,

        -- Red zone indicator
        CASE 
            WHEN yardline_100 <= 20 THEN TRUE 
            ELSE FALSE 
        END AS in_red_zone
    FROM 
        source
)

SELECT 
    *
FROM 
    renamed
