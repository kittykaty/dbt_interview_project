with macro_data as ({{ stg_model(
    source_name='interviews', 
    table_name='candidates', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset') }}
)

select 
    offset || id as offset,
    id,
    english_level,
    job_function_id,
    primary_skill_id,
    staffing_status,
    created_at,
    updated_at,
    _ROW_VALID_FROM,
    _ROW_VALID_TO,
    _ROW_IS_ACTIVE

from macro_data
