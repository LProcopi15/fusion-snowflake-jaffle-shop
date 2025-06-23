{{
    config(
        materialized = "incremental",
        table_format = "iceberg",
        external_volume="s3_lprocopi_iceberg",
        on_schema_change="append_new_columns"
    )
}}

with

locations as (

    select
        location_id,
        location_name,
        tax_rate as tax_rate,
        opened_date
    from {{ ref('stg_jaffle_shop__locations') }}

)

select * from locations
