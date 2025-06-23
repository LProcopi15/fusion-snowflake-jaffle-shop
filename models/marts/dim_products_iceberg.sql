{{
    config(
        materialized = "table",
        table_format="iceberg",
        external_volume="s3_lprocopi_iceberg",
    )
}}

with

products as (

    select *
    from {{ ref('stg_jaffle_shop__products') }}

)

select * from products
