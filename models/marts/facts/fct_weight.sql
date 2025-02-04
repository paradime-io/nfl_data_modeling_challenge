select distinct
    player_id,
    full_position_name,
    full_position_group_name,
    weight
from {{ ref('int_weight') }}
