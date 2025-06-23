{{
    config(
        materialized = "table",
        on_schema_change="append_new_columns"
    )
}}
with

locations as (

    select
        *, 
    from {{ ref('stg_jaffle_shop__locations') }}

)

select * from locations
