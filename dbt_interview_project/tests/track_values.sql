select *
from {{ ref('stg_job_function') }}
where track NOT IN ('A', 'B', 'C') AND is_active = True