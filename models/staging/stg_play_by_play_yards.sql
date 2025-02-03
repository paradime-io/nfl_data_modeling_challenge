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
        posteam AS offense_team,
        defteam AS defending_team,

        -- Field position and game context
        yardline_100 AS distance_to_goal,
        game_date,

        -- Play details
        play_type,
        yards_gained,

        -- Player involvement

        passer_player_id,
        passer_player_name,
        receiver_player_id,      
        receiver_player_name,
        rusher_player_id,
        rusher_player_name,
        fantasy_player_id,
        fantasy_player_name,

        -- Penalties
        
        penalty,
        first_down_penalty,
        penalty_type,
        penalty_team,
        penalty_player_id,
        penalty_player_name,
        penalty_yards,
        
        -- Rushing stats
        rush,
        rush_attempt,
        rushing_yards,

        -- Passing stats
        pass_attempt,
        incomplete_pass,
        complete_pass,
        passing_yards,

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
