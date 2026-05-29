WITH occupancy AS (

    SELECT
        host_id,
        COUNT(*) AS total_days,
        SUM(booked_flag) AS booked_days,
        SUM(estimated_revenue) AS estimated_revenue

    FROM {{ ref('fct_occupancy') }}
    GROUP BY host_id

),

reviews AS (

    SELECT
        host_id,
        COUNT(*) AS total_reviews

    FROM {{ ref('fct_reviews') }}
    GROUP BY host_id

),

hosts AS (

    SELECT *
    FROM {{ ref('dim_host') }}

)

SELECT

    h.host_id,
    h.host_name,
    h.host_is_superhost,
    h.host_location,

    h.host_listings_count,

    COALESCE(r.total_reviews, 0) AS total_reviews,

    COALESCE(o.booked_days, 0) AS booked_days,

    COALESCE(o.total_days, 0) AS total_days,

    {{calculate_occupancy_rate(
        'COALESCE(o.booked_days,0)','o.total_days'
    )
    }} as occupancy_rate_pcts

    COALESCE(o.estimated_revenue, 0) AS estimated_revenue

FROM hosts h
LEFT JOIN occupancy o
    ON h.host_id = o.host_id
LEFT JOIN reviews r
    ON h.host_id = r.host_id