{% macro validate_naming_conventions() %}

    {% set model_name = model.path.split('/')[-1] %}

    {# Define a list of models to exclude from naming convention validation #}
    {% set excluded_models = get_exclusion_list() %}

    {# Regex pattern for naming validation #}
    {% set naming_pattern = '^(?:(?:DIM|F_FACT)_[A-Z0-9]{3,4}(?:_[A-Z0-9]+)*_(?:DPI|EXTRNL)|(?:INTRM|FACT|DIM|I_FACT|F_FACT)_[A-Z0-9]{3,4}(?:_[A-Z0-9]+)*(?<!_DPI)(?<!_EXTRNL))\.[a-z]+$' %}

    {# Skip validation if the model is in the exclusion list #}
    {% if model_name in excluded_models %}
        {{ log('⏩ Skipping validation for excluded model: ' ~ model_name, info=True) }}
    
    {# Otherwise validate filename against the regex pattern #}
    {% elif not modules.re.match(naming_pattern, model_name) %}
        {{ exceptions.raise_compiler_error('⚠️ Invalid filename format. Path: ' ~ model.path ~ ', Model Name: ' ~ model_name) }}

    {% else %}
        {{ log('✅ Success: ' ~ model_name ~ ' matches file naming standards', info=True) }}
    {% endif %}
    
{% endmacro %}