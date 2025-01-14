WITH source AS (
    SELECT 
        * 
    FROM 
        {{ ref('seed_nfl_snap_counts_2023') }}
),

select_columns AS (
        SELECT 
        --Player info
        pfr_player_id,
        player as player_name,
        position,
        team,

        --Game info
        season,
        game_id,
        CASE WHEN game_type = 'REG'
             THEN true
             ELSE false
        END AS is_regular_season_game,
        week,
        opponent,

        --Snap counts
        offense_snaps,
        offense_pct,
        defense_snaps,
        defense_pct,
        st_snaps as special_teams_snaps,
        st_pct as special_teams_pct
        
        FROM source
)

SELECT 
    *
FROM 
    select_columns
