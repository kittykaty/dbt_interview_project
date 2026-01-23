{% set status_mappings = [
    {'status': 'REQUESTED',        'col': 'requested_datetime',         'agg': 'min'},
    {'status': 'SCHEDULED',        'col': 'scheduled_datetime',         'agg': 'min'},
    {'status': 'IN_PROGRESS',      'col': 'started_datetime',           'agg': 'min'},
    {'status': 'PENDING_FEEDBACK', 'col': 'pending_feedback_datetime',  'agg': 'min'},
    {'status': 'COMPLETED',        'col': 'feedback_provided_datetime', 'agg': 'min'},
    {'status': 'COMPLETED',        'col': 'finished_datetime',          'agg': 'max'},
    {'status': 'CANCELLED',        'col': 'cancelled_datetime',         'agg': 'max'}
] %}

WITH pivoted_timestamps AS (
    -- 12786 ID
    SELECT
      id,
      {% for mapping in status_mappings %}
        {{ mapping.agg }}(CASE WHEN status = '{{ mapping.status }}' THEN updated_at END) AS {{ mapping.col }}{{ "," if not loop.last }}
      {% endfor %}
    FROM {{ ref('stg_interview') }}
    GROUP BY 1
),

latest_interview_and_offset AS (
    SELECT 
      i.id,
      i.candidate_type,
      c.offset AS candidate_offset,
      i.status,
      e.offset AS interviewer_offset,
      i.location,
      i.is_logged,
      i.is_media_available,
      i.run_type,
      i.type,
      i.media_status,
      i.invite_answer_status,
      DATE(i.created_at) AS created_date,
      i.created_at AS created_datetime
    FROM {{ ref('latest_interview') }} i
      LEFT JOIN {{ ref('stg_candidate') }} c ON i.candidate_id = c.id AND i.created_at BETWEEN c._row_valid_from AND c._row_valid_to
        LEFT JOIN {{ ref('stg_employee') }} e ON i.interviewer_id = e.id AND i.created_at BETWEEN e._row_valid_from AND e._row_valid_to
),

joined AS (
    SELECT
      ls.*, -- columns with offset
      pt.requested_datetime,
      pt.scheduled_datetime,
      pt.started_datetime,
      pt.pending_feedback_datetime,
      pt.feedback_provided_datetime,
      pt.finished_datetime,
      pt.cancelled_datetime
    FROM latest_interview_and_offset ls
    LEFT JOIN pivoted_timestamps pt ON ls.id = pt.id
),

durations AS (
    SELECT *,
    -- Duration: ONLINE interviews only
        CASE 
            WHEN run_type = 'ONLINE' 
            THEN {{ dbt.datediff("started_datetime", "pending_feedback_datetime", "minute") }} 
        END AS interview_duration_minutes,
    
        {{ dbt.datediff("pending_feedback_datetime", "finished_datetime", "hour") }} AS feedback_delay_hours
    FROM joined

)

SELECT *
FROM joined