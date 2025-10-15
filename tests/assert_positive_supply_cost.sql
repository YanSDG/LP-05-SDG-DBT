select
    part_id,
    supplier_id,
    supply_cost
from {{ ref('stg_proyecto__partsupp') }}
where supply_cost < 0