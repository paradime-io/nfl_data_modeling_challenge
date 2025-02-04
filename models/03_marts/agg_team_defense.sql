with
    defense_agg as (
        select
            defteam_abbr_desc
            , week_nr
            , count(*) as total_plays_nr
            , sum(yards_gained_nr) as total_yards_allowed_nr
            , sum(epa_nr) as total_epa_allowed_nr
            , sum(case
                when is_touchdown_fl = 1 then 1
                else 0
            end) as total_touchdowns_allowed_nr
        from {{ ref('stg_nfl__play_by_play') }}
        where defteam_abbr_desc is not null
        group by defteam_abbr_desc, week_nr
    )

    , dim_teams as (
        select *
        from {{ ref('dim_teams') }}
    )

    , final as (
        select
            dim_teams.team_nick_nm
            , defense_agg.week_nr
            , defense_agg.total_plays_nr
            , defense_agg.total_yards_allowed_nr
            , defense_agg.total_epa_allowed_nr
            , defense_agg.total_touchdowns_allowed_nr
        from defense_agg
        left join dim_teams on defense_agg.defteam_abbr_desc = dim_teams.team_abbr_desc
        order by 1, 2
    )

select *
from final
