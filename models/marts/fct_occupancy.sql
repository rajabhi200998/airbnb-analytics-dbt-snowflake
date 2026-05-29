WITH calendar_data AS (

    SELECT *
    FROM {{ ref('int_listing_calendar') }}

)

SELECT

    listing_id,
    listing_name,

    host_id,
    host_name,

    property_type,
    room_type,

    neighbourhood_cleansed,

    calendar_date,

    nightly_price,
    adjusted_price,

    minimum_nights,
    maximum_nights,

    booked_flag,
    available_flag,

    CASE
        WHEN booked_flag = 1 THEN nightly_price
        ELSE 0
    END AS estimated_revenue

FROM calendar_data