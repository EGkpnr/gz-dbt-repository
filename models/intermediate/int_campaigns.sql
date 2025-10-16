select *
from {{ ref("stg_raw_adwords") }}
union all
select *
from {{ ref("stg_raw_bing") }}
union all
select *
from {{ ref("stg_raw_criteo") }}
union all
select *
from {{ ref("stg_raw_facebook") }}