/*
select
    expert_ranking,
    tiers,
    replace(player_name,'’', '''') as player_name,
    team,
    position_rank,
    bye_week,
    ecr_vs_adp
from  {{ source('external', 'FANTASY_DRAFT_RANKING_PREDICTION_2023') }}
*/