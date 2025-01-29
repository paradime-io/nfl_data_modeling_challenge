with medical_injury_reports as (
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
    report_primary_injury in ('Knee', 'Ankle',  'Concussion', 'Illness') then report_primary_injury
    when report_primary_injury in ('right Knee', 'left Knee') then 'Knee'
    when report_primary_injury in ('Hamstring', 'right Hamstring', 'left Hamstring', 'Quadricep', 'right Quadricep', 'left Quadricep', 'Thigh') then 'Thigh'  
    when report_primary_injury in ('Foot', 'Toe', 'Heel', 'Achilles') then 'Foot'
    when report_primary_injury in ('Calf', 'Shin') then 'Lower Leg'
    when report_primary_injury in ('Groin', 'Hip', 'right Groin', 'left Groin') then 'Pelvis'
    when report_primary_injury in ('Neck') then 'Spinal & Core'
    when report_primary_injury in ('Ribs', 'Oblique', 'Pectoral', 'Chest', 'Abdomen', 'Rib') then 'Spinal & Core'   
    when report_primary_injury in ('Shoulder', 'right Shoulder', 'left Shoulder', 'Thumb', 'Hand', 'Finger', 'right Thumb', 'Elbow', 'Wrist', 'Biceps', 'Forearm', 'Triceps','right Elbow', 'right Wrist') then 'Arm'
    else 'Other' end as injury,
from {{ ref('nfl_injuries_2023') }} 
where report_primary_injury not ilike '%not injury related%' 
  and report_primary_injury not ilike 'Inactive'
  and report_primary_injury not ilike 'Coach''s decision'
  and report_primary_injury not ilike 'Returning from suspension'
  and report_primary_injury not ilike 'Coaching'
  and practice_primary_injury not ilike '%not injury related%'
  and game_type = 'REG'
),

medical_injury_reports_with_first_report as (
  select 
  *, 
  rank() over (partition by full_name, injury order by week) as rank
  from medical_injury_reports
)

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
  injury,
  case when rank = 1 then 1 else 0 end as first_report
from medical_injury_reports_with_first_report




