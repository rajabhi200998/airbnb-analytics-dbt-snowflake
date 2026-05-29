WITH calendar_data AS (

    SELECT *
    FROM {{ ref('stg_calendar') }}

),

listing_data AS (

    SELECT *
    FROM {{ ref('stg_listings') }}

)

SELECT

    c.listing_id,
    l.listing_name,
    l.host_id,
    l.host_name,
    l.property_type,
    l.room_type,
    l.neighbourhood_cleansed,

    c.calendar_date,
    c.available,

    TRY_TO_DOUBLE(c.price) AS nightly_price,
    TRY_TO_DOUBLE(c.adjusted_price) AS adjusted_price,

    c.minimum_nights,
    c.maximum_nights,

    CASE
        WHEN c.available = 'f' THEN 1
        ELSE 0
    END AS booked_flag,

    CASE
        WHEN c.available = 't' THEN 1
        ELSE 0
    END AS available_flag

FROM calendar_data c
LEFT JOIN listing_data l
    ON c.listing_id = l.listing_id