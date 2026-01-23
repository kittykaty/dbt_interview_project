SELECT
    id,
    is_active,
    type,
    name,
    url,
    parent_id
FROM {{ ref('stg_skill')}}