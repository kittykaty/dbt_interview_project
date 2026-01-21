WITH date_range AS (
    SELECT
        DATEADD(DAY, SEQ4(), DATE '2020-01-01') AS date
    FROM TABLE(GENERATOR(ROWCOUNT => 365*10)) -- 10 years of dates
)
SELECT
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(QUARTER FROM date) AS quarter,
    EXTRACT(MONTH FROM date) AS month,
    EXTRACT(DAY FROM date) AS day,
    EXTRACT(WEEK FROM date) AS week,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    TO_VARCHAR(DAYNAME(date)) AS day_name,
    TO_VARCHAR(MONTHNAME(date)) AS month_name,
    CASE WHEN DAYOFWEEK(date) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend,
    FALSE AS is_holiday
FROM date_range