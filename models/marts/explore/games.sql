with final_scores as (
    select
        game_id,
        total_home_score as final_home_score,
        total_away_score as final_away_score,
        case
            when total_home_score > total_away_score then 'Home'
            when total_home_score < final_away_score then 'Away'
            else 'Tie'
        end as winning_team_side,
        case
            when winning_team_side = 'Home' then home_team
            when winning_team_side = 'Away' then away_team
            else 'Tie'
        end as winning_team
    from
        {{ ref('stg_play_by_play') }} qualify row_number() over (
            partition by game_id
            order by
                play_id desc
        ) = 1
),

final as (
    select
        final_scores.game_id,
        final_home_score,
        final_away_score,
        winning_team,
        winning_team_side,
        season_type,
        home_team,
        away_team,
        game_date
    from
        {{ ref('stg_play_by_play') }}
    inner join final_scores using (game_id)
    group by
        all
)

select *
from
    final
