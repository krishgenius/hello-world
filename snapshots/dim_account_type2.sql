{% snapshot dim_account_type2 %}
    {{
        config(
            unique_key='id',
            strategy='check',
            updated_at='audit_etl_job_upd_ts',
            target_schema='common',
            check_cols=['billingcity', 'billingcountry'] 
        )
    }}
select * from {{ ref('dim_account_poc') }}
 {% endsnapshot %}
