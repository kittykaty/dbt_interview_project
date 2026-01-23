{{ config(materialized='table') }}
{{ stg_model(
    source_name='interviews', 
    table_name='interviews', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}
