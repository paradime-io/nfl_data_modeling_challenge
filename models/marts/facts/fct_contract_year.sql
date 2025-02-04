with recursive year_cte (season) as (

    select 2025 -- Start year
    union all
    select season - 1 
    from year_cte 
    where season > 2000 -- Decrement by 1 until 2000

), contract_years as (
    
    select
        player_name,
        year_signed AS contract_start_year,
        years,
        year_signed + years - 1 AS contract_end_year
    from {{ref('stg_contracts')}}
    where years is not null

), joined as (
    
    select distinct
        int.player_id,
        coalesce(int.player_name, con.player_name) as player_name,
        coalesce(y.season,int.season,con.year_signed) as season,
        int.position,
        --y.recent_team,
        int.rookie_year,
        int.years_experience,
        int.total_targets,
        int.total_fantasy_points,
        int.total_ppr,
        int.games_played,
        int.avg_fantasy_points_per_game,
        int.avg_ppr_per_game,
        int.standard_rank,
        int.ppr_rank,
        int.standard_rank_by_avg,
        int.ppr_rank_by_avg,
        --con.year_signed,
        con.years as contract_length_years,
        con.value,
        con.apy,
        con.guaranteed,
        con.apy_as_percent_of_cap_at_signing,
        con.inflated_value,
        con.inflated_apy,
        con.inflated_guaranteed,
        cy.contract_start_year,
        cy.contract_end_year,
        CASE 
            WHEN int.season BETWEEN cy.contract_start_year AND cy.contract_end_year
            THEN int.season - cy.contract_start_year + 1
        END AS contract_year,
        case when lead(con.year_signed) over (partition by int.player_id order by y.season) is not null then 1 else 0 end as is_final_year,
        case when contract_length_years is not null then 1 else 0 end as is_first_year
    from year_cte as y
    left join {{ref('int_fantasy_points')}} as int
    on y.season = int.season
    left join {{ref('stg_contracts')}} as con
    on y.season = con.year_signed
    and int.player_name = con.player_name
    left join contract_years as cy
    on int.player_name = cy.player_name
    and int.season between cy.contract_start_year and cy.contract_end_year
    
    where int.player_id is not null
    --and int.player_name = 'DK Metcalf'

), binned as (
    select 
        *,
        case 
            when is_final_year = 1 and is_first_year = 1 and contract_length_years = 1
            then '1-year contract'
            when is_final_year = 1 and is_first_year = 0
            then 'Final year of multi-year contract'
            when is_final_year = 0 and is_first_year = 1
            then 'First year of multi-year contract'
            when is_final_year = 0 and is_first_year = 0
            then 'Mid-contract year'
            else 'First year of multi-year contract'
        end as contract_status
    from joined
    where (is_first_year = 1
    and contract_year = 1) or 
    (is_first_year = 0
    and contract_year != 0)
)
select 
    *
from binned