with source as (
    select * from {{ ref('moon_phases_23_24') }}
),

staged as (
    select
        moon_phase,
        date::date as phase_date,
        time::time as phase_time,
        timestamp_from_parts(date::date, time::time) as phase_timestamp
    from source
)

select * from staged 