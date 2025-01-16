WITH player_stats AS
    (
        SELECT
        player_id,
        --Fantasy points
        SUM(total_fantasy_points) AS total_fantasy_points,
        MAX(total_fantasy_points) AS max_fantasy_points_in_a_week,
        MIN(total_fantasy_points) AS min_fantasy_points_in_a_week,
        AVG(total_fantasy_points) AS avg_fantasy_points_per_game,

        SUM(total_fantasy_points_ppr) AS total_fantasy_points_ppr,
        MAX(total_fantasy_points_ppr) AS max_fantasy_points_ppr_in_a_week,
        MIN(total_fantasy_points_ppr) AS min_fantasy_points_ppr_in_a_week,
        AVG(total_fantasy_points_ppr) AS avg_fantasy_points_ppr_per_game
        FROM {{ ref('int_fantasy_points') }} as player_stats
        GROUP BY ALL
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
    receiving.pct_of_games_as_starter,
    receiving.avg_yds_per_reception,
    receiving.avg_receptions_per_target,
    receiving.avg_td_per_target,

    --Snap count stats
    receiving.offensive_snaps,
    receiving.avg_targets_per_snap,
    receiving.avg_receptions_per_snap,

    --Fantasy points
    player_stats.total_fantasy_points,
    player_stats.max_fantasy_points_in_a_week,
    player_stats.min_fantasy_points_in_a_week,
    player_stats.avg_fantasy_points_per_game,

    player_stats.total_fantasy_points_ppr,
    player_stats.max_fantasy_points_ppr_in_a_week,
    player_stats.min_fantasy_points_ppr_in_a_week,
    player_stats.avg_fantasy_points_ppr_per_game

FROM {{ ref('int_player_receiving_stats') }} as receiving
-- Use crosswalk to be able to join to player stats
LEFT JOIN {{ ref('stg_player_id_crosswalk') }} as ids
    ON receiving.pfr_player_id = ids.pfr_id
LEFT JOIN player_stats
    ON player_stats.player_id = ids.gsis_id
--Limit receiving stats to 2023
WHERE receiving.year = 2023







