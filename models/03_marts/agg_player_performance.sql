with
    aggregated as (
        select
            player_id
            , player_nm
            , season_nr
            , week_nr
            , sum(passing_yards_nr) as total_passing_yards_nr
            , sum(passing_tds_nr) as total_passing_tds_nr
            , sum(rushing_yards_nr) as total_rushing_yards_nr
            , sum(rushing_tds_nr) as total_rushing_tds_nr
            , sum(receptions_nr) as total_receptions_nr
            , sum(receiving_yards_nr) as total_receiving_yards_nr
            , sum(receiving_tds_nr) as total_receiving_tds_nr
            , sum(fantasy_points_nr) as total_fantasy_points_nr
            , sum(fantasy_points_ppr_nr) as total_fantasy_points_ppr_nr
        from {{ ref('stg_nfl__player_stats_by_game') }}
        group by player_id, player_nm, season_nr, week_nr
        order by player_nm, season_nr, week_nr
    )

select *
from aggregated
