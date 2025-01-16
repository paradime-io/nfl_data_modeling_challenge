WITH snaps AS 
    (
        SELECT
        pfr_player_id,
        SUM(offense_snaps) AS offensive_snaps
        FROM {{ ref('stg_player_snap_counts') }} 
        GROUP BY pfr_player_id
    )

SELECT 
    receiving.year,

    --Player information
    receiving.pfr_player_id,
    receiving.player_name,
    receiving.team,
    receiving.age,
    receiving.position,
    receiving.is_wide_receiver,
    
    --Game stats
    receiving.games_played,
    receiving.games_started,

    --Receiving stats
    receiving.targets,
    receiving.receptions,
    receiving.receiving_yds,
    receiving.touchdowns,
    receiving.first_downs,
    receiving.yds_after_catch,
    receiving.yds_after_catch_per_rec,
    receiving.broken_tackles_on_rec,
    receiving.dropped_passes,
    receiving.drop_pct,
    receiving.passer_rating_on_targets,

    --Receiving calculations
    DIV0(receiving.games_played, receiving.games_started) as pct_of_games_as_starter,
    DIV0(receiving.receiving_yds, receiving.receptions) as avg_yds_per_reception,
    DIV0(receiving.receptions, receiving.targets) as avg_receptions_per_target,
    DIV0(receiving.touchdowns, receiving.targets) as avg_td_per_target,

    --Snap count stats
    snaps.offensive_snaps,
    DIV0(receiving.targets, snaps.offensive_snaps) AS avg_targets_per_snap,
    DIV0(receiving.receptions, snaps.offensive_snaps) AS avg_receptions_per_snap,

FROM {{ ref('stg_yearly_receiving_pfr_stats') }} as receiving
LEFT JOIN snaps
    ON receiving.pfr_player_id = snaps.pfr_player_id








