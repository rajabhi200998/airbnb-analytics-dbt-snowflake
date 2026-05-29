WITH listings AS (

    SELECT *
    FROM {{ ref('stg_listings') }}

),

hosts AS (

    SELECT

        host_id,
        host_name,
        host_since,
        host_location,
        host_response_time,
        host_response_rate,
        host_acceptance_rate,
        host_is_superhost,
        host_listings_count,
        host_total_listings_count,
        host_identity_verified

    FROM listings

)

SELECT DISTINCT *

FROM hosts
WHERE host_id IS NOT NULL