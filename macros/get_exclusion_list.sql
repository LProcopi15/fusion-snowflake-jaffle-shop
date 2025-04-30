
{% macro get_exclusion_list() %}

    [
        'dim_customers.sql',
        'dim_locations.sql',
        'dim_locations_iceberg.sql',
        'dim_products.sql',
        'dim_products_iceberg.sql',
        'dim_supplies.sql',
        'dim_supplies_iceberg.sql',
        'fct_orders.sql',
        'fct_order_items.sql',
        'list_files_to_exclude.sql',
        'list_files_to_exclude.sql',
        'metricflow_time_spine.sql',
        'stg_jaffle_shop__customers.sql',
        'stg_jaffle_shop__locations.sql',
        'stg_jaffle_shop__order_items.sql',
        'stg_jaffle_shop__orders.sql',
        'stg_jaffle_shop__products.sql',
        'stg_jaffle_shop__supplies.sql',
        'stg_stripe__payments.sql',
        'dim_dbt__current_models.sql',
        'dim_dbt__exposures.sql',
        'dim_dbt__models.sql',
        'dim_dbt__seeds.sql'
    ]

{% endmacro %}