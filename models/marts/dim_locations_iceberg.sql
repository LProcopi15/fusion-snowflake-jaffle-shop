{{
  config(
    materialized = "table",
    table_format="iceberg",
    external_volume="s3_lprocopi_iceberg_encrypted"
  )
}}

with

locations as (

    select * from {{ ref('stg_jaffle_shop__locations') }}

)

select * from locations
