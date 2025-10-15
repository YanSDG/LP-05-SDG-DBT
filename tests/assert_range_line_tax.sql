select
    order_id,
    line_number,
    tax
from {{ ref('stg_proyecto__lineitems') }}
where tax < 0 or tax > 1