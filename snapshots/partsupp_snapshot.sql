{% snapshot partsupp_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key=['ps_partkey', 'ps_suppkey'],
      strategy='check',
      check_cols=['ps_availqty', 'ps_supplycost']
    )
  }}

  select * from {{ source('proyecto', 'partsupp') }}
{% endsnapshot %}