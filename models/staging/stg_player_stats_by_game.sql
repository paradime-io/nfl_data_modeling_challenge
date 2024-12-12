WITH source AS (
    SELECT 
        * 
    FROM 
        {{ source('nfl', 'player_stats_by_game') }}
),

renamed AS (
    SELECT 
        -- Player identifiers
        player_id,
        
        -- Player basic info
        player_display_name AS player_name,
        first_name,
        last_name,
        headshot_url_x AS headshot_url,
        jersey_number,
        status AS player_status,
        status_description_abbr,
        
        -- Physical attributes
        height,
        weight AS player_weight,
        age,
        birth_date,
        
        -- Player background
        college,
        years_exp AS years_experience,
        entry_year,
        rookie_year,
        draft_club AS draft_team,
        draft_number,
        
        -- Position and team
        position_x AS position,
        position_group,
        team,
        recent_team AS recent_team,
        
        -- Game context
        season_x AS season, 
        week_x AS season_week,
        season_type,
        game_type,
        opponent_team,
        
        -- Passing stats
        completions,
        attempts AS pass_attempts,
        passing_yards AS pass_yards,
        passing_air_yards,
        passing_yards_after_catch,
        passing_first_downs,
        passing_epa,
        passing_2pt_conversions,
        interceptions,
        pacr,
        dakota,
        
        -- Sack stats
        sacks,
        sack_yards,
        sack_fumbles,
        sack_fumbles_lost,
        
        -- Rushing stats
        carries,
        rushing_yards,
        rushing_tds,
        rushing_fumbles,
        rushing_fumbles_lost,
        rushing_first_downs,
        rushing_epa,
        rushing_2pt_conversions,
        
        -- Receiving stats
        receptions,
        targets,
        receiving_yards,
        receiving_tds,
        receiving_fumbles,
        receiving_fumbles_lost,
        receiving_air_yards,
        receiving_yards_after_catch,
        receiving_first_downs,
        receiving_epa,
        receiving_2pt_conversions,
        
        -- Advanced receiving metrics
        racr,
        target_share,
        air_yards_share,
        wopr,
        
        -- Special teams and fantasy
        special_teams_tds,
        fantasy_points,
        fantasy_points_ppr,
        
        -- External IDs
        espn_id,
        sportradar_id,
        yahoo_id,
        rotowire_id,
        pff_id,
        pfr_id,
        fantasy_data_id,
        sleeper_id,
        esb_id,
        gsis_it_id,
        smart_id
    FROM 
        source
)

SELECT 
    *
FROM 
    renamed
