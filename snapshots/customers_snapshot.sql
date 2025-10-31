{% snapshot customers_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key='c_custkey',
      strategy='check',
      check_cols=['c_name', 'c_nationkey', 'c_acctbal', 'c_mktsegment']
    )
  }}

  select * from {{ source('proyecto', 'customers') }}
{% endsnapshot %}