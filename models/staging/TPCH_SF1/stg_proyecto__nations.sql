select
    n_nationkey as nation_id,
    n_name as name,
    n_regionkey as region_id

from {{ source('proyecto', 'nations') }}
