select
    r_regionkey as region_id,
    r_name as name

from {{ source('proyecto', 'regions') }}
