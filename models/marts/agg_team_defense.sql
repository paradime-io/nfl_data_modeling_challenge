with
    defense_agg as (
        select
            hash(defteam_abbr_desc) dim_teams_fk
            , week_nr
            , count(*) as total_plays_nr
            , sum(yards_gained_nr) as total_yards_allowed_nr
            , sum(epa_nr) as total_epa_allowed_nr
            , sum(case
                when is_touchdown_fl = true then 1
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
            hash(dim_teams.dim_teams_sk, defense_agg.week_nr) as agg_team_defense_sk
            , dim_teams.team_nick_nm
            , defense_agg.week_nr
            , defense_agg.total_plays_nr
            , defense_agg.total_yards_allowed_nr
            , defense_agg.total_epa_allowed_nr
            , defense_agg.total_touchdowns_allowed_nr
        from defense_agg
        left join dim_teams on defense_agg.dim_teams_fk = dim_teams.dim_teams_sk
        order by 1, 2
    )

select *
from final
