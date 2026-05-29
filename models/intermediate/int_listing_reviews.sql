WITH listings AS (

    SELECT *
    FROM {{ ref('stg_listings') }}

),

reviews AS (

    SELECT *
    FROM {{ ref('stg_reviews') }}

),

review_summary AS (

    SELECT

        listing_id,
        COUNT(review_id) AS total_reviews,
        MIN(review_date) AS first_review_date,
        MAX(review_date) AS latest_review_date

    FROM reviews
    GROUP BY listing_id

)

SELECT

    l.listing_id,
    l.listing_name,
    l.host_id,
    l.host_name,
    l.room_type,
    l.property_type,
    l.price,
    l.review_scores_rating,

    rs.total_reviews,
    rs.first_review_date,
    rs.latest_review_date

FROM listings l
LEFT JOIN review_summary rs
    ON l.listing_id = rs.listing_id