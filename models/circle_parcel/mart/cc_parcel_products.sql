select
    ppdt.parcel_id,
    model_name,
    parcel_tracking,
    transporter,
    priority,
    date_purchase,
    date_shipping,
    date_delivery,
    date_cancelled,
    month_purchase,
    status,
    expedition_time,
    transport_time,
    delivery_time,
    delay,
    ppdt.qty
from {{ref('cc_parcel')}} as cpt
right join {{ref('stg_cc_parcel_products')}} as ppdt
    on cpt.parcel_id = ppdt.parcel_id
