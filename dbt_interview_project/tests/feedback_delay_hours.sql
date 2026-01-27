{{ config(tags=['unit-test']) }}


{% call dbt_unit_testing.test('fct_interview', 'feedback delay hours calculation') %}

  {% call dbt_unit_testing.mock_ref('latest_interview') %}

    select
    93440 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'COMPLETED' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    true as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'DONE' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2025-01-07T16:05:35.000'::timestamp as updated_at,
    '2025-01-07T16:05:35.000'::timestamp as _row_valid_from,
    '9999-12-31T00:00:00.000'::timestamp as _row_valid_to,
    true as _row_is_active

  {% endcall %}

  {% call dbt_unit_testing.mock_ref('stg_interview') %}
    select
    85712 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'DRAFT' as status,
    null as interviewer_id,
    null as location,
    false as is_logged,
    false as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'NO_MEDIA' as media_status,
    null as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2024-12-10T10:00:07.000'::timestamp as updated_at,
    '2024-12-10T10:00:07.000'::timestamp as _row_valid_from,
    '2024-12-10T15:26:37.000'::timestamp as _row_valid_to,
    false as _row_is_active
    union all
    select
    85987 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'SCHEDULED' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    false as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'NO_MEDIA' as media_status,
    null as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2024-12-10T15:26:37.000'::timestamp as updated_at,
    '2024-12-10T15:26:37.000'::timestamp as _row_valid_from,
    '2024-12-17T14:00:37.326'::timestamp as _row_valid_to,
    false as _row_is_active
    union all
    select
    88524 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'SCHEDULED' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    false as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'NO_MEDIA' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2024-12-17T14:00:37.326'::timestamp as updated_at,
    '2024-12-17T14:00:37.326'::timestamp as _row_valid_from,
    '2024-12-17T14:05:01.000'::timestamp as _row_valid_to,
    false as _row_is_active
    union all
    select
    88530 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'IN_PROGRESS' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    false as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'NO_MEDIA' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2024-12-17T14:05:01.000'::timestamp as updated_at,
    '2024-12-17T14:05:01.000'::timestamp as _row_valid_from,
    '2024-12-17T15:30:00.000'::timestamp as _row_valid_to,
    false as _row_is_active
    union all
    select
    88600 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'PENDING_FEEDBACK' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    false as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'NO_MEDIA' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2024-12-17T15:30:00.000'::timestamp as updated_at,
    '2024-12-17T15:30:00.000'::timestamp as _row_valid_from,
    '2024-12-17T15:30:01.000'::timestamp as _row_valid_to,
    false as _row_is_active
    union all
    select
    93440 as offset,
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    '559749413008501836667687386931283002299' as candidate_id,
    'COMPLETED' as status,
    '82969909517776534315705883764315403688810' as interviewer_id,
    'MS_TEAMS' as location,
    false as is_logged,
    true as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'DONE' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10T10:00:00.000'::timestamp as created_at,
    '2025-01-07T16:05:35.000'::timestamp as updated_at,
    '2025-01-07T16:05:35.000'::timestamp as _row_valid_from,
    '9999-12-31T00:00:00.000'::timestamp as _row_valid_to,
    true as _row_is_active
  {% endcall %}

  {% call dbt_unit_testing.mock_ref('stg_candidate') %}
    select
    74780 as offset,
    '559749413008501836667687386931283002299' as id,
    'Unspecified' as english_level,
    '4060741400010084401' as job_function_id,
    '4060741400035457637' as primary_skill_id,
    'UnderConsideration' as staffing_status,
    '2024-11-29T08:29:18.789'::timestamp as created_at,
    '2024-12-09T12:54:59.609'::timestamp as updated_at,
    '2024-12-09T12:54:59.609'::timestamp as _row_valid_from,
    '2024-12-10T12:04:12.526'::timestamp as _row_valid_to,
    false as _row_is_active

  {% endcall %}

  {% call dbt_unit_testing.mock_ref('stg_employee') %}

    select
    9504 as offset,
    '82969909517776534315705883764315403688810' as id,
    '4060741400010084402' as job_function_id,
    '4060741400035457637' as primary_skill_id,
    'Production' as production_category,
    'Full-time employee' as employment_status,
    'Security' as org_category,
    'Security' as org_category_type,
    '2021-01-25'::date as work_start_date,
    null as work_end_date,
    true as is_active,
    '2021-01-20T10:30:00.000'::timestamp as created_at,
    '2021-12-27T12:01:24.049'::timestamp as updated_at,
    '2021-12-27T12:01:24.049'::timestamp as _row_valid_from,
    '2025-01-01T05:44:55.402'::timestamp as _row_valid_to,
    false as _row_is_active

  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
    '6609554575222440906202350127957983519327' as id,
    'Applicant' as candidate_type,
    74780 as candidate_offset,
    'COMPLETED' as status,
    9504 as interviewer_offset,
    'MS_TEAMS' as location,
    false as is_logged,
    true as is_media_available,
    'ONLINE' as run_type,
    'Technical' as type,
    'DONE' as media_status,
    'ACCEPTED' as invite_answer_status,
    '2024-12-10'::date as created_date,
    '2024-12-10T10:00:00.000'::timestamp as created_datetime,
    null as requested_datetime,
    '2024-12-10T15:26:37.000'::timestamp as scheduled_datetime,
    '2024-12-17T14:05:01.000'::timestamp as started_datetime,
    '2024-12-17T15:30:00.000'::timestamp as pending_feedback_datetime,
    '2025-01-07T16:05:35.000'::timestamp as feedback_provided_datetime,
    '2025-01-07T16:05:35.000'::timestamp as finished_datetime,
    null as cancelled_datetime,
    85 as interview_duration_minutes,
    505 as feedback_delay_hours

  {% endcall %}

{% endcall %}

