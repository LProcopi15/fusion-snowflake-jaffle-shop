{% materialization iceberg_table, adapter='snowflake', supported_languages=['sql']%}

  {% set original_query_tag = set_query_tag() %}

  {%- set identifier = model['alias'] -%}
  {%- set language = model['language'] -%}
  
  {% set grant_config = config.get('grants') %}

  {%- set existing_relation = adapter.get_relation(database=database, schema=schema, identifier=identifier) -%}
  {%- set target_relation = api.Relation.create(
	identifier=identifier,
	schema=schema,
	database=database,
	type='table',
	table_format='iceberg'
    ) -%}

  {{ run_hooks(pre_hooks) }}

  {#-- Drop the relation if it was a non-iceberg table. This may lead to
    -- downtime, but it should be a relatively infrequent occurrence  #}
  {% if existing_relation is not none and existing_relation.table_format != 'iceberg' %}
    {{ log("Dropping relation " ~ existing_relation ~ " because it is of type " ~ existing_relation.type) }}
    {{ drop_relation_if_exists(existing_relation) }}
  {% endif %}

  {% call statement('main', language=language) -%}
      {{ iceberg_create_table_as(False, target_relation, compiled_code, language) }}
  {%- endcall %}

  {{ run_hooks(post_hooks) }}

  {% set should_revoke = should_revoke(existing_relation, full_refresh_mode=True) %}
  {% do apply_grants(target_relation, grant_config, should_revoke=should_revoke) %}

  {% do persist_docs(target_relation, model) %}

  {% do unset_query_tag(original_query_tag) %}

  {{ return({'relations': [target_relation]}) }}

{% endmaterialization %}