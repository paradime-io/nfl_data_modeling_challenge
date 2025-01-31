select
    player as player_name,
    team as team_name,
    "Year Signed" as year_signed,
    years,
    value,
    apy,
    guaranteed,
    "APY as % Of Cap At Signing" as apy_as_percent_of_cap_at_signing,
    "Inflated Value" as inflated_value,
    "Inflated APY" as inflated_apy,
    "Inflated Guaranteed" as inflated_guaranteed
from {{source('external', 'NFL_CONTRACTS')}}