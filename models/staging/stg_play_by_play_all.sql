with pbp1 as (
    select * from {{ source('vlikar', 'raw_nfl_play_by_play_1') }}
),

pbp2 as (
    select * from {{ source('vlikar', 'raw_nfl_play_by_play_2') }}
),

pbp3 as (
    select * from {{ source('vlikar', 'raw_nfl_play_by_play_3') }}
)

select * from pbp1
UNION
select * from pbp2
UNION
select * from pbp3
