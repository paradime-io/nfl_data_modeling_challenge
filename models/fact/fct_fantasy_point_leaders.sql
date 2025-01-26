with points as (
	select *
	from
		{{ source('fact', 'fct_fantasy_point_leaders') }}
)

select *
from
	points