{% macro stg_model_latest(stg_table) %}
SELECT *
FROM {{ ref(stg_table) }}
WHERE _ROW_IS_ACTIVE = TRUE
{% endmacro %}


-- stg_model_latest:

-- with stg_model AS (
    -- select
    --     cast(_OFFSET as BIGINT) as offset,
    -- cast(CANDIDATE_ID as VARCHAR(500)) as id,
    -- cast(ENGLISH_LEVEL as VARCHAR(500)) as english_level,
    -- cast(JOB_FUNCTION_ID as VARCHAR(500)) as job_function_id,
    -- cast(PRIMARY_SKILL_ID as VARCHAR(500)) as primary_skill_id,
    -- cast(STAFFING_STATUS as VARCHAR(500)) as staffing_status,
    -- cast(_CREATED_MICROS as DATETIME) as created_at,
    -- cast(_UPDATED_MICROS as DATETIME) as updated_at
    -- from dbt_project_db.raw.candidates ),
  -- row_windows AS (
--     SELECT 
--         *, 
--         UPDATED_at AS _ROW_VALID_FROM,
--         LEAD(UPDATED_AT, 1, '9999-12-31') OVER(ORDER BY "OFFSET") AS _ROW_VALID_TO
--     FROM "table"
-- )
-- SELECT 
--     *,
--     (_ROW_VALID_TO = '9999-12-31') AS _ROW_IS_ACTIVE
-- FROM row_windows;
