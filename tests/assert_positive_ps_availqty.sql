select
    part_id,
    supplier_id,
    availble_quantity
from {{ ref('stg_proyecto__partsupp') }}
where availble_quantity < 0