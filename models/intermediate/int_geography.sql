{{ config(
    materialized='view'
) }}

with nations as (
    select * from {{ ref('stg_proyecto__nations') }}
),
regions as (
    select * from {{ ref('stg_proyecto__regions') }}
),
geography as (
    select nation_id, n.name as nation, r.name as region
    from nations n left join regions r
    using (region_id)
)
select * from geography