with
    src_play_by_play as (
        select
            play_id
            , game_id
            , game_date as game_dt
            , week as week_nr
            , posteam as posteam_abbr_desc
            , defteam as defteam_abbr_desc
            , play_type as play_tp
            , yards_gained as yards_gained_nr
            , epa as epa_nr
            , touchdown as is_touchdown_fl
            , yardline_100 as yardline_100_nr
        from {{ source('nfl', 'nfl_play_by_play') }}
    )

select *
from src_play_by_play
