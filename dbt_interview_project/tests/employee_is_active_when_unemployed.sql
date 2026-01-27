select *
from {{ ref('stg_employee') }}
where work_end_date IS NOT NULL and is_active = TRUE