WITH source AS (
    SELECT 
        * 
    FROM 
        {{ ref('seed_nfl_receiving_pfr_yearly') }}
),

renamed AS (
        SELECT 
        season AS year,

        --Player information
        pfr_id AS pfr_player_id,
        player AS player_name,
        tm AS team,
        age,
        pos AS position,
        CASE WHEN pos = 'WR' THEN true
             ELSE false
        END AS is_wide_receiver,

        --Game stats
        g AS games_played,
        gs AS games_started,

        --Receiving stats
        tgt AS targets,
        rec AS receptions,
        yds AS receiving_yds,
        td AS touchdowns,
        x1d AS first_downs,
        yac AS yds_after_catch,
        yac_r AS yds_after_catch_per_rec,
        brk_tkl AS broken_tackles_on_rec,
        drops AS dropped_passes,
        drop_percent AS drop_pct,
        int AS interceptions_on_targets,
        rat AS passer_rating_on_targets

    FROM 
        source
        

)

SELECT 
    *
FROM 
    renamed





