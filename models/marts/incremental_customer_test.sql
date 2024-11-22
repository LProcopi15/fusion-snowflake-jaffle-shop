{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key=['pkey']
    )
}}

select * from {{ ref('stg_snowflake_sample_data__customer') }}