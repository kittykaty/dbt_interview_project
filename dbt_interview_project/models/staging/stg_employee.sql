SELECT
    CAST(_OFFSET AS BIGINT) AS offset,
    CAST(EMPLOYEE_ID AS VARCHAR(500)) AS id,
    CAST(JOB_FUNCTION_ID AS VARCHAR(500)) AS job_function_id,
    CAST(PRIMARY_SKILL_ID AS VARCHAR(500)) AS primary_skill_id,
    CAST(PRODUCTION_CATEGORY AS VARCHAR(500)) AS production_category,
    CAST(EMPLOYMENT_STATUS AS VARCHAR(500)) AS employment_status,
    CAST(ORG_CATEGORY AS VARCHAR(500)) AS org_category,
    CAST(ORG_CATEGORY_TYPE AS VARCHAR(500)) AS org_category_type,
    CAST(WORK_START_MICROS AS DATE) AS work_start_date,
    CAST(WORK_END_MICROS AS DATE) AS work_end_date,
    CAST(IS_ACTIVE AS BOOLEAN) AS is_active,
    CAST(_CREATED_MICROS AS DATETIME) AS created_at,
    CAST(_UPDATED_MICROS AS DATETIME) AS updated_at
FROM {{ source("interviews", "employees") }}