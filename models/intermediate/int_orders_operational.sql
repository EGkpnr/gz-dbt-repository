select
    o.orders_id,
    o.date_date,
    round(
        o.margin + s.shipping_fee - (s.log_cost + s.ship_cost), 2
    ) as operational_margin,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.log_cost,
    s.ship_cost
from {{ ref("int_orders_margin") }} o
left join {{ ref("stg_raw_ship") }} s using (orders_id)
order by orders_id desc
