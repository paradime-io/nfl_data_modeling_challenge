with plays as (
	select *
	from
		{{ source('staging', 'stg_play_by_play') }}
)

select *
from
	plays