SELECT
    offset,
    id,
    primary_skill_id,
    staffing_status,
    english_level,
    job_function_id,
    _row_valid_from AS valid_from_datetime,
    _row_valid_to AS valid_to_datetime
FROM {{ ref('stg_candidate') }}