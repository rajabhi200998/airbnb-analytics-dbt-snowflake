WITH source_data AS (

    SELECT *
    FROM {{ source('airbnb_raw', 'raw_listings') }}

)

SELECT

    c1  AS listing_id,
    c2  AS listing_url,
    c3  AS scrape_id,
    TRY_TO_DATE(c4) AS last_scraped,
    c5  AS source,
    c6  AS listing_name,
    c7  AS description,
    c8  AS neighborhood_overview,
    c9  AS picture_url,
    c10 AS host_id,
    c11 AS host_url,
    c12 AS host_name,
    TRY_TO_DATE(c13) AS host_since,
    c14 AS host_location,
    c15 AS host_about,
    c16 AS host_response_time,
    c17 AS host_response_rate,
    c18 AS host_acceptance_rate,
    c19 AS host_is_superhost,
    c20 AS host_thumbnail_url,
    c21 AS host_picture_url,
    c22 AS host_neighbourhood,
    TRY_TO_NUMBER(c23) AS host_listings_count,
    TRY_TO_NUMBER(c24) AS host_total_listings_count,
    c25 AS host_verifications,
    c26 AS host_has_profile_pic,
    c27 AS host_identity_verified,
    c28 AS neighbourhood,
    c29 AS neighbourhood_cleansed,
    c30 AS neighbourhood_group_cleansed,
    TRY_TO_DOUBLE(c31) AS latitude,
    TRY_TO_DOUBLE(c32) AS longitude,
    c33 AS property_type,
    c34 AS room_type,
    TRY_TO_NUMBER(c35) AS accommodates,
    TRY_TO_DOUBLE(c36) AS bathrooms,
    c37 AS bathrooms_text,
    TRY_TO_NUMBER(c38) AS bedrooms,
    TRY_TO_NUMBER(c39) AS beds,
    c40 AS amenities,
    REPLACE(c41, '$', '') AS price,
    TRY_TO_NUMBER(c42) AS minimum_nights,
    TRY_TO_NUMBER(c43) AS maximum_nights,
    TRY_TO_NUMBER(c57) AS number_of_reviews,
    TRY_TO_DOUBLE(c62) AS review_scores_rating,
    c70 AS instant_bookable,
    TRY_TO_DOUBLE(c77) AS reviews_per_month

FROM source_data