{% snapshot suppliers_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key='s_suppkey',
      strategy='check',
      check_cols=['s_name', 's_nationkey', 's_acctbal']
    )
  }}

  select * from {{ source('proyecto', 'suppliers') }}
{% endsnapshot %}