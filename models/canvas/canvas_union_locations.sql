WITH dim_locations_iceberg AS (
  SELECT
    *
  FROM {{ ref('leah_snowflake_jaffle_shop', 'dim_locations_iceberg') }}
), dim_locations AS (
  SELECT
    *
  FROM {{ ref('leah_snowflake_jaffle_shop', 'dim_locations') }}
), "union" AS (
  SELECT
    *
  FROM dim_locations_iceberg
  UNION ALL
  SELECT
    *
  FROM dim_locations
), canvas_union_locations_sql AS (
  SELECT
    *
  FROM "union"
)
SELECT
  *
FROM canvas_union_locations_sql