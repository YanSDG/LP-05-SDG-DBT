select
    s_suppkey as supplier_id,
    s_name as name,
    s_nationkey as nation_id,
    s_acctbal as account_balance

from {{ source('proyecto', 'suppliers') }}
