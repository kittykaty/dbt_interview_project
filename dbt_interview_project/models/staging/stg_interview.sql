{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='id',
    on_schema_change='append_new_columns'
  ) 
}}

with macro_data as (
{{ stg_model(
    source_name='interviews', 
    table_name='interviews', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}
)

select
  offset,
  id,
  candidate_type,
  candidate_id,
  REGEXP_REPLACE(status, '^__|__$', '') AS status,
  interviewer_id,
  location,
  is_logged,
  is_media_available,
  run_type,
  type,
  media_status,
  invite_answer_status,
  created_at,
  updated_at,
  _ROW_VALID_FROM,
  _ROW_VALID_TO,
  _ROW_IS_ACTIVE

  FROM macro_data

{% if is_incremental() %}  
where updated_at > (  
  select max(updated_at)  
  from {{ this }}  
)  
{% endif %}
