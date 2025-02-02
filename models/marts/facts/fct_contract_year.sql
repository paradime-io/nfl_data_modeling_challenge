with recursive year_cte (season) as (

    select 2025 -- Start year
    union all
    select season - 1 
    from year_cte 
    where season > 2000 -- Decrement by 1 until 2000

), joined as (
    
    select distinct
        int.player_id,
        int.player_name,
        y.season,
        int.position,
        --y.recent_team,
        int.years_experience,
        int.total_targets,
        int.total_fantasy_points,
        int.total_fantasy_points_ppr,
        int.games_played,
        int.avg_fantasy_points_per_game,
        int.avg_fantasy_points_ppr_per_game,
        int.standard_rank,
        int.ppr_rank,
        int.standard_rank_by_avg,
        int.ppr_rank_by_avg,
        con.year_signed,
        con.years as contract_length_years,
        con.value,
        con.apy,
        con.guaranteed,
        con.apy_as_percent_of_cap_at_signing,
        con.inflated_value,
        con.inflated_apy,
        con.inflated_guaranteed,
        case when lead(con.year_signed) over (partition by int.player_id order by y.season) is not null then 1 else 0 end as is_contract_year
    from year_cte as y
    left join {{ref('int_fantasy_points')}} as int
    on y.season = int.season
    full outer join {{ref('stg_contracts')}} as con
    on y.season = con.year_signed
    and int.player_name = con.player_name
)
select 
    * 
from joined