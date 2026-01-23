{% macro seed_filter(table_name, seed) %}
    {% set query %}
        SELECT raw_column_name, target_column_name, target_data_type
        FROM {{ ref(seed) }}
        WHERE raw_table_name = '{{ table_name }}'
        ORDER BY CAST(target_order_num AS integer)
    {% endset %}

    {% set results = run_query(query) %}
    
    {% if execute %}
        {{ return(results) }}
    {% else %}
        {{ return([]) }}
    {% endif %}
{% endmacro %}

{% macro stg_model(source_name, table_name, seed, updated_column='updated_at', partition_col='ID', sort_col='offset', end_date='9999-12-31') %}

    {% set rules = seed_filter(table_name, seed) %}
    {% set columns = [] %}

    {% if execute and rules.rows | length > 0 %}
        {% for row in rules.rows %}
            {% do columns.append('cast(' ~ row[0] ~ ' as ' ~ row[2] ~ ') as ' ~ row[1]) %}
        {% endfor %}
    {% else %}
        {% do columns.append('*') %}
    {% endif %}

    with base_data as (
        select
            {{ columns | join(',\n        ') }},
            {{ updated_column }} as _ROW_VALID_FROM,
            lead({{ updated_column }}, 1, '{{ end_date }}') over(partition by {{ partition_col }} order by {{ sort_col }}) as _ROW_VALID_TO
        from {{ source(source_name, table_name) }}
    )

    select 
        *,
        (_ROW_VALID_TO = '{{ end_date }}') as _ROW_IS_ACTIVE
    from base_data

{% endmacro %}

