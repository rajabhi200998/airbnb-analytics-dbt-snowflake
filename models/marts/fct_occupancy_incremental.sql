{{ config(
    materialized='incremental',
    unique_key='listing_id_calendar_date'
) }}

WITH calendar_data AS (

    SELECT *
    FROM {{ ref('int_listing_calendar') }}

),

final AS (

    SELECT

        listing_id,
        calendar_date,

        CONCAT(
            listing_id,
            '_',
            calendar_date
        ) AS listing_id_calendar_date,

        host_id,
        listing_name,

        nightly_price,
        adjusted_price,

        booked_flag,
        available_flag,

        estimated_revenue

    FROM {{ ref('fct_occupancy') }}

)

SELECT *
FROM final

{% if is_incremental() %}

WHERE calendar_date >
(
    SELECT MAX(calendar_date)
    FROM {{ this }}
)

{% endif %}