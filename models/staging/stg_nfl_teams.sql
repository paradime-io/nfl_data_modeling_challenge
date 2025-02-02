with source as (
    select * from {{ ref('nfl_teams_mapping') }}
),

staged as (
    select
        team_name,
        team_abbreviation
    from source
)

select * from staged 