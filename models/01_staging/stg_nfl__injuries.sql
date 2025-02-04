with
    src_injuries as (
        select
            season as season_nr
            , game_type as game_tp
            , team as team_abbr_desc
            , week as week_nr
            , gsis_id
            , full_name as player_nm
            , position as player_position_desc
            , report_primary_injury as injury_desc
            , report_status as report_st
            , practice_status as practice_st
            , date_modified as modified_ts
        from {{ source('nfl', 'nfl_injuries') }}
    )

select *
from src_injuries