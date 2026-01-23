SELECT
    id,
    base_name,
    category,
    is_active,
    level,
    track,
    seniority_level,
    seniority_index
FROM {{ ref('stg_job_function')}}