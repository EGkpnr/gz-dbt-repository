select
    date_trunc(date_date, MONTH) as datemonth,
    sum(cast(operational_margin as float64) - cast(ads_cost as float64)) as ads_margin,
    sum(cast(average_basket as float64)) as average_basket,
    sum(cast(operational_margin as float64)) as operational_margin,
    sum(cast(ads_cost as int)) as ads_cost,
    sum(ads_impression) as ads_impression,
    sum(ads_clicks) as ads_clicks,
    sum(quantity) as quantity,
    sum(revenue) as revenue,
    sum(purchase_cost) as purchase_cost,
    sum(margin) as margin,
    sum(shipping_fee) as shipping_fee,
    sum(log_cost) as log_cost,
    sum(ship_cost) as ship_cost
from {{ ref("int_campaigns_day") }}
full outer join {{ ref("finance_days") }} using (date_date)
group by datemonth
order by datemonth desc
