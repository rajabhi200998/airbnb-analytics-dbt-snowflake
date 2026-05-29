{% macro calculate_occupancy_rate(booked_days,total_days) %}

ROUND(
    {{ booked_days }} * 100.0
    / NULLIF({{ total_days }}, 0),
    2
)

{% endmacro %}