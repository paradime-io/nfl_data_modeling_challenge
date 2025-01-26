with stats as (
	select *
	from
		{{ source('staging', 'stg_player_stats_by_game') }}
)

select *
from
	stats