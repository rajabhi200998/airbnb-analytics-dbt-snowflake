WITH listings AS (

    SELECT *
    FROM {{ ref('stg_listings') }}

)

SELECT

    {{ generate_listing_key('listing_id') }} AS listing_sk,
    listing_id,
    listing_name,

    host_id,
    host_name,

    property_type,
    room_type,

    neighbourhood,
    neighbourhood_cleansed,
    neighbourhood_group_cleansed,

    latitude,
    longitude,

    accommodates,
    bedrooms,
    beds,
    bathrooms,

    minimum_nights,
    maximum_nights,

    review_scores_rating,
    reviews_per_month,

    host_is_superhost,
    instant_bookable

FROM listings