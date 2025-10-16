with
    source as (select * from {{ source("raw", "products") }}),
    renamed as (
        select products_id, cast(purchse_price as float64) as purchase_price
        from source
        where products_id is not null or purchse_price is not null
    )
select *
from renamed
