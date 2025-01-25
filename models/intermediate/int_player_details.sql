SELECT DISTINCT
  player_id,
  player_name,
  first_name,
  last_name,
  team,
  position,
  position_group,
  player_weight as weight,
  height,
  age,
  birth_date,
  college,
  entry_year,
  rookie_year
FROM
  {{ ref('stg_player_stats_by_game') }}