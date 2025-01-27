select 
  season,
  week,
  game_type,
  team,
  gsis_id,
  position,
  full_name,
  first_name,
  last_name,
  report_primary_injury,
  report_secondary_injury,
  report_status,
  practice_primary_injury,
  practice_secondary_injury,
  practice_status,
  case when
    report_primary_injury in ('Knee', 'Ankle', 'Hamstring', 'Shoulder', 'Concussion', 'Illness', 'Foot', 'Calf', 'Back', 'Hip', 'Groin', 'Toe', 'Quadricep') then report_primary_injury
    when report_primary_injury in ('right Knee', 'left Knee') then 'Knee'
    when report_primary_injury in ('right Shoulder', 'left Shoulder') then 'Shoulder'
    when report_primary_injury in ('right Hamstring', 'left Hamstring') then 'Hamstring'
    when report_primary_injury in ('right Quadricep', 'left Quadricep') then 'Quadricep'
    when report_primary_injury in ('right Groin', 'left Groin') then 'Groin'
    else 'Other' end as injury
from {{ ref('nfl_injuries_2023') }} 
where report_primary_injury not ilike '%not injury related%' 
  and report_primary_injury not ilike 'Inactive'
  and report_primary_injury not ilike 'Coach''s decision'
  and report_primary_injury not ilike 'Returning from suspension'
  and report_primary_injury not ilike 'Coaching'
  and practice_primary_injury not ilike '%not injury related%'
  and game_type = 'REG'


