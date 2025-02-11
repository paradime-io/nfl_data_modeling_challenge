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
    receiving.player_id,
    receiving.player_name,
    receiving.team,
    receiving.age,
    receiving.position,
    receiving.birth_date,
    receiving.entry_year,
    receiving.rookie_year,
    receiving.draft_club,
    receiving.draft_number,

    --Receiving stats
    receiving.games_played,
    receiving.targets,
    receiving.receptions,
    receiving.receiving_yds,
    receiving.touchdowns,
    receiving.first_downs,
    receiving.yds_after_catch,
    receiving.air_yds,
    receiving.target_share,
    receiving.air_yds_share,
    receiving.wopr_x as wopr_x,
    receiving.fantasy_points,
    receiving.fantasy_points_ppr,

    --Snap count stats (for 2023 only)
    snaps.offensive_snaps as offensive_snaps,
    DIV0(receiving.targets, snaps.offensive_snaps) AS avg_targets_per_snap,
    DIV0(receiving.receptions, snaps.offensive_snaps) AS avg_receptions_per_snap

FROM {{ ref('stg_yearly_player_stats') }} as receiving
--Pull in 2023 snap counts
LEFT JOIN snaps
    ON receiving.pfr_id = snaps.pfr_player_id
--Limit to only players who have at least 1 target within a season
WHERE targets > 0
--Limit to regular season
and season_type = 'REG'






