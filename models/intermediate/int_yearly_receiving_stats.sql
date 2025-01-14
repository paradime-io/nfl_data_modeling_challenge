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

    --Snap count
    CASE WHEN receiving.year = 2023
         THEN snaps.offensive_snaps
         ELSE null
    END AS offensive_snaps,

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

    --Calculations
    DIV0(games_played, games_started) as pct_of_games_as_starter,
    DIV0(receiving_yds, receptions) as avg_yds_per_reception,
    DIV0(receptions, targets) as avg_receptions_per_target,
    DIV0(touchdowns, targets) as avg_td_per_target,
    CASE WHEN receiving.year = 2023
         THEN DIV0(receiving.targets, snaps.offensive_snaps) 
         ELSE null
    END as avg_targets_per_snap,
    CASE WHEN receiving.year = 2023
         THEN DIV0(receiving.receptions, snaps.offensive_snaps) 
         ELSE null
    END as avg_receptions_per_snap

FROM {{ ref('stg_yearly_receiving_pfr_stats') }} as receiving
LEFT JOIN snaps
    ON receiving.pfr_player_id = snaps.pfr_player_id






