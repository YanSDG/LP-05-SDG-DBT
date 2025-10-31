select
    c_custkey as customer_id,
    c_name as name,
    c_nationkey as nation_id,
    c_acctbal as account_balance,
    c_mktsegment as market_segment

from {{ ref('customers_snapshot') }}
where dbt_valid_to is null
