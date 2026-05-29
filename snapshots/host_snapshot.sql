{% snapshot host_snapshot %}

{{
    config(
        target_schema='AIRBNB_SNAPSHOTS',
        unique_key='host_id',

        strategy='check',
        check_cols=[
            'host_name',
            'host_location',
            'host_is_superhost',
            'host_response_rate',
            'host_acceptance_rate'
        ]
    )
}}

SELECT

    host_id,
    host_name,
    host_location,
    host_is_superhost,
    host_response_rate,
    host_acceptance_rate

FROM {{ ref('dim_host') }}

{% endsnapshot %}