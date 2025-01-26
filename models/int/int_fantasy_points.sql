with points as (
	select *
	from
		{{ source('intermediate', 'int_fantasy_points') }}
)

select *
from
	points