WITH source AS (
    SELECT 
        * 
    FROM 
        {{ ref('seed_nfl_player_stats_yearly') }}
),

renamed AS (
        SELECT 
        season AS year,

        --Player information
        player_id,
        pfr_id,
        player_name,
        team,
        age,
        position,
        birth_date,
        entry_year,
        rookie_year,
        draft_club,
        draft_number,

        season_type,

        --Receiving Stats
        games as games_played,
        targets,
        receptions,
        receiving_yards AS receiving_yds,
        receiving_tds AS touchdowns,
        receiving_first_downs AS first_downs,
        receiving_yards_after_catch AS yds_after_catch,

        receiving_air_yards AS air_yds,
        target_share,
        air_yards_share as air_yds_share,
        wopr_x,
        fantasy_points,
        fantasy_points_ppr


    FROM 
        source
        

)

SELECT 
    *
FROM 
    renamed





