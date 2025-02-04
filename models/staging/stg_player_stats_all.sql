with stats as (
    select * from {{source('vlikar', 'raw_nfl_player_stats')}}
)

select * from stats