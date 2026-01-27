{{ config(tags=['unit-test1111']) }}

{% call dbt_unit_testing.test('dim_customers', 'test_is_valid_email_address') %}

  {% call dbt_unit_testing.mock_ref('stg_customers') %}

    SELECT 'cool@example.com' AS email, 'example.com' AS email_top_level_domain
    UNION ALL
    SELECT 'cool@unknown.com' AS email, 'unknown.com' AS email_top_level_domain
    UNION ALL
    SELECT 'badgmail.com' AS email, 'gmail.com' AS email_top_level_domain
    UNION ALL
    SELECT 'missingdot@gmailcom' AS email, 'gmail.com' AS email_top_level_domain

  {% endcall %}

  {% call dbt_unit_testing.mock_ref('top_level_email_domains') %}

    SELECT 'example.com' AS tld
    UNION ALL
    SELECT 'gmail.com' AS tld

  {% endcall %}

  {% call dbt_unit_testing.expect() %}

    SELECT 'cool@example.com' AS email, TRUE AS is_valid_email_address
    UNION ALL
    SELECT 'cool@unknown.com' AS email, FALSE AS is_valid_email_address
    UNION ALL
    SELECT 'badgmail.com' AS email, FALSE AS is_valid_email_address
    UNION ALL
    SELECT 'missingdot@gmailcom' AS email, FALSE AS is_valid_email_address

  {% endcall %}

{% endcall %}