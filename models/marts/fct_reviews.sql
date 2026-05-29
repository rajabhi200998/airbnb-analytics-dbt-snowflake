WITH reviews AS (

    SELECT *
    FROM {{ ref('stg_reviews') }}

),

listings AS (

    SELECT *
    FROM {{ ref('dim_listings') }}

)

SELECT

    r.review_id,
    r.review_date,

    r.listing_id,
    l.host_id,

    r.reviewer_id,
    r.reviewer_name,

    r.review_comments,

    l.property_type,
    l.room_type,
    l.neighbourhood_cleansed

FROM reviews r
LEFT JOIN listings l
    ON r.listing_id = l.listing_id