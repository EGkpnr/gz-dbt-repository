select
    s.pdt_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchSE_PRICE as purchase_price,
    round(s.quantity * p.purchase_price, 2) as purchase_cost,
    round(s.revenue - s.quantity * p.purchase_price, 2) as margin
from {{ ref("stg_raw__sales") }} s
left join {{ ref("stg_raw_products") }} p using (products_id)