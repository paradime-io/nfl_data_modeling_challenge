with
    dim_teams as (
        select
            hash(team_abbr_desc) as dim_teams_sk
            , *
        from {{ ref('stg_nfl__teams') }}
    )

select *
from dim_teams
