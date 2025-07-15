-- metricflow_time_spine.sql
with

days as (

    {{ dbt_date.get_base_dates(n_dateparts=365*10, datepart="day") }}

),


final as (

    select
        {{ dbt_utils.generate_surrogate_key(['date_day::date']) }} as date_id,
        date_day::date as date_day,
        monthname(date_day) as fiscal_month_name,
        'Q' || quarter(date_day) as fiscal_quarter_name,
        'Y' || year(date_day) as fiscal_year_name

    from days

)

select * from final
