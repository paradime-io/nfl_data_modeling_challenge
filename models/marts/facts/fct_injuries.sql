select
    week,
    team,
    position,
    full_name,
    injury,
    --sum(first_report) as injuries_count,
    duration
from {{ ref('int_injuries') }}
where first_report = 1
group by
    week,
    team,
    position,
    full_name,
    injury,
    duration