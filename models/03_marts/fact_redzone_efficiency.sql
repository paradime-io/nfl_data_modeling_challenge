with
    redzone_plays as (
        select
            posteam_abbr_desc
            , yardline_100_nr
            , is_touchdown_fl
            , yards_gained_nr
            , epa_nr
        from {{ ref('stg_nfl__play_by_play') }}
        where yardline_100_nr <= 20
    )

    , dim_teams as (
        select *
        from {{ ref('dim_teams') }}
    )

    , agg_data as (
        select
            posteam_abbr_desc
            , count(*) as redzone_plays_nr
            , sum(case
                when is_touchdown_fl = 1 then 1
                else 0
            end) as redzone_touchdowns_nr
            , avg(yards_gained_nr) as avg_yards_gained_nr
            , avg(epa_nr) as avg_epa_nr
            , (sum(case when is_touchdown_fl = 1 then 1 else 0 end) * 1.0 / count(*)) as touchdown_rate_nr
        from redzone_plays
        group by posteam_abbr_desc
    )

    , final as (
        select
            dim_teams.team_nick_nm
            , agg_data.redzone_plays_nr
            , agg_data.redzone_touchdowns_nr
            , agg_data.avg_yards_gained_nr
            , agg_data.avg_epa_nr
            , agg_data.touchdown_rate_nr
        from agg_data
        left join dim_teams on agg_data.posteam_abbr_desc = dim_teams.team_abbr_desc
        order by 1
    )

select *
from final
