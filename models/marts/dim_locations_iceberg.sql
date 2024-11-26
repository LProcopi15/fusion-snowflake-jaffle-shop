{{
    config(
        materialized = "iceberg_table",
        external_volume="s3_lprocopi_iceberg",
    )
}}

with

locations as (

    select * from {{ ref('stg_jaffle_shop__locations') }}

)

select * from locations
