with plays as (
	select *
	from
		{{ source('intermediate', 'int_red_zone_plays') }}
)

select *
from
	plays