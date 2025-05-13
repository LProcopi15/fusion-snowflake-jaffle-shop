with

locations as (

    select *, 1 as foo from {{ ref('stg_jaffle_shop__locations') }}

)

select * from locations
