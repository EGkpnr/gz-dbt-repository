-- models/staging/stg_raw__sales.sql
with
    source as (select * from {{ source("raw", "raw_gz_sales") }}),
    renamed as (
        select date_date, orders_id, pdt_id as products_id, revenue, quantity
        from source
        where
            date_date is not null
            or orders_id is not null
            or pdt_id is not null
            or revenue is not null
            or quantity is not null
    )
select *
from renamed
