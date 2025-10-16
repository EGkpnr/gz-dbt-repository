with
    source as (select * from {{ source("raw", "shipping") }}),
    renamed as (
        select
            orders_id,
            shipping_fee,
            logcost as log_cost,
            cast(ship_cost as int64) as ship_cost
        from source
        where
            orders_id is not null
            or shipping_fee is not null
            or logcost is not null
            or ship_cost is not null
    )
select *
from renamed 