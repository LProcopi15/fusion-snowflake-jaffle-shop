-- metricflow_time_spine.sql
with

days as (

    {{ dbt_date.get_base_dates(n_dateparts=365*10, datepart="day") }}

),


add_fiscal_year as (

    select
        date_day::date as date_day,
        date_trunc('year', dateadd('month', 13, date_day)::date) as fiscal_year

    from days

)

select * from add_fiscal_year
