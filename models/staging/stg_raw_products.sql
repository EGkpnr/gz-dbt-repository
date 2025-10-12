with
    source as (select * from {{ source("raw", "products") }}),
    renamed as (
        select products_id, cast(purchSE_PRICE as float64) as purchase_price
        from source
    )
select *
from renamed
