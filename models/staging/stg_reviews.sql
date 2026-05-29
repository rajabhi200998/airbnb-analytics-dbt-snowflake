WITH source_data AS (

    SELECT *
    FROM {{ source('airbnb_raw', 'raw_reviews') }}

)

SELECT

    c1 AS listing_id,
    c2 AS review_id,
    TRY_TO_DATE(c3) AS review_date,
    c4 AS reviewer_id,
    c5 AS reviewer_name,
    c6 AS review_comments

FROM source_data