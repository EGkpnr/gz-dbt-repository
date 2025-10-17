with
    pp_details as (
        select parcel_id, sum(qty) as qty, count(model_name) as nb_model
        from {{ ref("stg_cc_parcel_products") }}
        group by parcel_id
    )
select
    rcp.parcel_id,
    parcel_tracking,
    transporter,
    priority,
    date_purchase,
    date_shipping,
    date_delivery,
    date_cancelled,
    extract(month from date_purchase) as month_purchase,
    case
        when date_shipping is null
        then 'Hazırlanıyor'
        when date_delivery is null
        then 'Taşınıyor'
        when date_delivery is not null
        then 'Teslim Edildi'
        when date_cancelled is not null
        then 'İptal Edildi'
        else null
    end as `status`,
    date_diff(date_shipping, date_purchase, day) as expedition_time,
    date_diff(date_delivery, date_shipping, day) as transport_time,
    date_diff(date_delivery, date_purchase, day) as delivery_time,
    if(
        date_delivery is null,
        null,
        if(date_diff(date_delivery, date_purchase, day) > 3, 1, 0)
    ) as `delay`,
    qty,
    nb_model
from {{ ref("stg_cc_parcel") }} as rcp
join pp_details as ppd on rcp.parcel_id = ppd.parcel_id
