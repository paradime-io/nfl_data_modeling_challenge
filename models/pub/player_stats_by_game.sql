with stats as (
	select *
	from
		{{ source('public', 'player_stats_by_game') }}
)

select *
from
	stats