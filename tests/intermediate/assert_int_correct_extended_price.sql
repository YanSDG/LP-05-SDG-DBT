with parts as (
    select * from {{ ref('stg_proyecto__parts') }}
)
select
    order_id,
    line_number,
    part_id,
    retail_price,
    quantity,
    extended_price
from {{ ref('int_order_items') }}
join parts using (part_id)
where (retail_price * quantity) <> extended_price