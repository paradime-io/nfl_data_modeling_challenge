with
    dim_teams as (
        select *
        from {{ ref('stg_nfl__teams') }}
    )

select *
from dim_teams
