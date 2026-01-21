{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='id',
    on_schema_change='append_new_columns'
  ) 
}}

SELECT
    CAST(_OFFSET AS BIGINT) AS offset,
    CAST(ID AS VARCHAR(500)) AS id,
    CAST(CANDIDATE_TYPE AS VARCHAR(500)) AS candidate_type,
    CAST(CANDIDATE_ID AS VARCHAR(500)) AS candidate_id,
    CAST(STATUS AS VARCHAR(500)) AS status,
    CAST(INTERVIEWER_ID AS VARCHAR(500)) AS interviewer_id,
    CAST(LOCATION AS VARCHAR(500)) AS location,
    CAST(LOGGED AS BOOLEAN) AS is_logged,
    CAST(MEDIA_AVAILABLE AS BOOLEAN) AS is_media_available,
    CAST(RUN_TYPE AS VARCHAR(500)) AS run_type,
    CAST(TYPE AS VARCHAR(500)) AS type,
    CAST(MEDIA_STATUS AS VARCHAR(500)) AS media_status,
    CAST(INVITE_ANSWER_STATUS AS VARCHAR(500)) AS invite_answer_status,
    CAST(_CREATED_MICROS AS DATETIME) AS created_at,
    CAST(_UPDATED_MICROS AS DATETIME) AS updated_at
FROM {{ source("interviews", "interviews") }}

{% if is_incremental() %}  
where updated_at > (  
  select max(updated_at)  
  from {{ this }}  
)  
{% endif %}