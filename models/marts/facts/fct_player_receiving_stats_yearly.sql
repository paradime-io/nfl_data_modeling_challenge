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
    receiving.avg_td_per_target

FROM {{ ref('int_player_receiving_stats') }} as receiving
where year < 2024 --Remove incomplete 2024 season data