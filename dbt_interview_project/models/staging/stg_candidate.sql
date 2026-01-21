SELECT
    CAST(_OFFSET AS BIGINT) AS offset,
    CAST(CANDIDATE_ID AS VARCHAR(500)) AS id,
    CAST(ENGLISH_LEVEL AS VARCHAR(500)) AS english_level,
    CAST(JOB_FUNCTION_ID AS VARCHAR(500)) AS job_function_id,
    CAST(PRIMARY_SKILL_ID AS VARCHAR(500)) AS primary_skill_id,
    CAST(STAFFING_STATUS AS VARCHAR(500)) AS staffing_status,
    CAST(_CREATED_MICROS AS DATETIME) AS created_at,
    CAST(_UPDATED_MICROS AS DATETIME) AS updated_at
FROM {{ source("interviews", "candidates") }}