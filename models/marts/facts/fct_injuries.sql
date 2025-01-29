select
    week,
    team,
    position,
    full_name,
    injury,
    report_status,
    practice_status,
    sum(first_report) as injuries_count,
    -- potencjalnie do usunięcia, jeśli nie będzie używane
    count(*) as weeks -- weeks_reported
from {{ ref('int_injuries') }}
group by
    week,
    team,
    position,
    full_name,
    injury,
    report_status,
    practice_status