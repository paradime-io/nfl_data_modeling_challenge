select distinct
    player_id,
    full_position_name,
    full_position_group_name,
    weight,
    height,
    weight/height as bmi
from {{ ref('int_weight') }}
