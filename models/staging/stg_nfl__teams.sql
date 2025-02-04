with
    src_teams as (
        select
            team_id
            , team_name as team_nm
            , team_nick as team_nick_nm
            , team_abbr as team_abbr_desc
        from {{ source('nfl', 'nfl_teams') }}
    )

select *
from src_teams