select
    week,
    team,
    position,
    full_name,
    injury,
    report_status,
    practice_status,
    count(*) as injuries_count
from {{ ref('int_injuries') }}
group by
    week,
    team,
    position,
    full_name,
    injury,
    report_status,
    practice_status