with
    performance as (
        select *
        from {{ ref('agg_player_performance') }}
    )
    
    , injuries as (
        select 
            gsis_id
            , season_nr
            , week_nr
            , report_st
            , injury_desc
        from {{ ref('stg_nfl__injuries') }}
    )

    , final as (
        select
            hash(performance.player_id, performance.season_nr, performance.week_nr) as fact_injury_impact_sk
            , performance.player_id
            , performance.player_nm
            , performance.season_nr
            , performance.week_nr
            , performance.total_fantasy_points_nr
            , performance.total_fantasy_points_ppr_nr
            , case
                when injuries.gsis_id is not null then true
                else false
            end as has_injury_fl
        from performance
        left join injuries 
            on performance.player_id = injuries.gsis_id
            and performance.season_nr = injuries.season_nr
            and performance.week_nr = injuries.week_nr
    )

select *
from final
