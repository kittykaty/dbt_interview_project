with macro_data as (
{{ stg_model(
    source_name='interviews', 
    table_name='job_functions', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}
)
select
  offset,
  id,
  base_name,
  category,
  CASE when track NOT IN ('A', 'B', 'C') AND is_active = True THEN false ELSE is_active END as is_active,
  level,
  track,
  seniority_level,
  seniority_index,
  created_at,
  updated_at
from macro_data
