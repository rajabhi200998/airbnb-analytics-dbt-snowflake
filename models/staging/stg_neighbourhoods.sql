WITH source_data AS (

    SELECT *
    FROM {{ source('airbnb_raw', 'raw_neighbourhoods') }}

)

SELECT

    c1 AS neighbourhood_group,
    c2 AS neighbourhood_name

FROM source_data