{{ stg_model(
    source_name='interviews', 
    table_name='candidates', 
    seed='raw_to_stg', 
    updated_column='updated_at', 
    sort_col='offset'
) }}
