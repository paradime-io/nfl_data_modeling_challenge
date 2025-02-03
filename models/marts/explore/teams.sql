select 
    team,
    founded_yr as founded,
    wins,
    losses,
    ties,
    wl_pct,
    yr_plyf,
    w_plyf,
    l_plyf,
    wl_pct_plyf,
    chmp,
    sbwl,
    conf,
    div,
    abvr
from {{ ref('football_teams') }}