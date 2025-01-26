with plays as (
	select *
	from
		{{ source('public', 'play_by_play') }}
)

select *
from
	plays