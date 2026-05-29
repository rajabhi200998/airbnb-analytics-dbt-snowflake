WITH source_data AS (

    SELECT *
    FROM {{ source('airbnb_raw', 'raw_calendar') }}

)

SELECT

    c1 AS listing_id,
    TRY_TO_DATE(c2) AS calendar_date,
    c3 AS available,
    REPLACE(c4, '$', '') AS price,
    REPLACE(c5, '$', '') AS adjusted_price,
    TRY_TO_NUMBER(c6) AS minimum_nights,
    TRY_TO_NUMBER(c7) AS maximum_nights

FROM source_data