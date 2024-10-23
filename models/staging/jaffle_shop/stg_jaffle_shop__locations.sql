with

source as (

    select * from {{ source('ecom', 'raw_stores') }}

),

renamed as (

    select

        ----------  ids
        id as location_id,

        ---------- text
        name as location_name,

        ---------- numerics
        tax_rate,

        ---------- timestamps
        {{ dbt.date_trunc('day', 'opened_at') }}::timestamp_ntz(6) as opened_date

    from source

)

select * from renamed
