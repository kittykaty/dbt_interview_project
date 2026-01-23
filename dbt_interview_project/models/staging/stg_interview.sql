{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='id',
    on_schema_change='append_new_columns'
  ) 
}}

{{ stg_model(
    source_name='interviews', 
    table_name='interviews', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}

{% if is_incremental() %}  
where updated_at > (  
  select max(updated_at)  
  from {{ this }}  
)  
{% endif %}
