{% macro generate_listing_key(listing_id) %}

MD5(
    CAST({{ listing_id }} AS VARCHAR)
)

{% endmacro %}