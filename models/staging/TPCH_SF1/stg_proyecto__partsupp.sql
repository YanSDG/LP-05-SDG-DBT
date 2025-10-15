select
    ps_partkey as part_id,
    ps_suppkey as supplier_id,
    ps_availqty as availble_quantity,
    ps_supplycost as supply_cost

from {{ source('proyecto', 'partsupp') }}
