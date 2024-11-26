{{
    config(
        materialized = "iceberg_table",
        external_volume="s3_lprocopi_iceberg",
    )
}}

with

supplies as (

    select * from {{ ref('stg_jaffle_shop__supplies') }}

)

select * from supplies
