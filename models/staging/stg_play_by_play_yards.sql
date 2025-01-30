WITH source AS (
    SELECT 
        * 
    FROM 
        {{ ref('play_by_play') }}
),

renamed AS (
    SELECT 
        -- Play identifiers
        game_id,
        season_type,
        
        -- Team information
        home_team,
        away_team,
        posteam AS possession_team,
        posteam_type AS possession_team_type,
        defteam AS defending_team,

        -- Field position and game context
        yardline_100 AS distance_to_goal,
        game_date,

        -- Play details
        play_type,
        yards_gained,
        pass_length,
        pass_location,
        air_yards,
        yards_after_catch,

        -- Player involvement
        passer_player_name,
        passing_yards,        
        receiver_player_name,
        receiving_yards,
        lateral_rusher_player_name,
        lateral_rushing_yards,
        lateral_receiver_player_name,
        lateral_receiving_yards,
        fantasy_player_name,

        -- Fumbles & penalties
        fumble_recovery_1_team,
        fumble_recovery_1_yards,
        fumble_recovery_1_player_name,
        fumble_recovery_2_team,
        fumble_recovery_2_yards,
        fumble_recovery_2_player_name,
        return_team,
        return_yards,
        penalty_team,
        penalty_player_name,
        penalty_yards,
        
        -- Rushing stats
        rush,
        rush_attempt,
        rusher_player_name,
        rushing_yards,

        -- Passing stats
        pass_attempt,
        incomplete_pass,
        complete_pass,

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
