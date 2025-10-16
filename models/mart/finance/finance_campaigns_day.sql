select
    date_date,
    cast(operational_margin as float64) - cast(ads_cost as float64) as ads_margin,
    round(average_basket, 2) as average_basket,
    cast(operational_margin as float64) as operational_margin,
    cast(ads_cost as float64) as ads_cost,
    impression as ads_impression,
    click as ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
from {{ ref("int_campaigns") }}
full outer join {{ ref("finance_days") }} using (date_date)
order by date_date desc
