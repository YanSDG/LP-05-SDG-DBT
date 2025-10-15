with partsupp as (
    select * from {{ ref('stg_proyecto__parts') }}
)
select
    order_id,
    line_number,
    part_id,
    retail_price,
    quantity,
    extended_price
from {{ ref('stg_proyecto__lineitems') }}
join partsupp using (part_id)
where (retail_price * quantity) <> extended_price