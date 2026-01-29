with macro_data as (
{{ stg_model(
    source_name='interviews', 
    table_name='employees', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}
)

SELECT
  offset,
  id,
  job_function_id,
  primary_skill_id,
  production_category,
  employment_status,
  org_category,
  work_start_date,
  work_end_date,
  CASE WHEN work_end_date IS NOT NULL THEN FALSE ELSE is_active END AS is_active,
  created_at,
  updated_at,
  _ROW_VALID_FROM,
  _ROW_VALID_TO,
  _ROW_IS_ACTIVE
FROM macro_data