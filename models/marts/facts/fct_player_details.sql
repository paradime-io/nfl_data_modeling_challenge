SELECT 
  player_id,
  player_name,
  first_name,
  last_name,
  team,
  position,
  position_group,
  weight,
  height,
  age,
  birth_date,
  college,
  entry_year,
  rookie_year
FROM
  {{ ref('int_player_details') }}