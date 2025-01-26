with stats as (
	select *
	from
		{{ source('fact', 'fct_red_zone_player_stats') }} 
)

select *
from
	stats