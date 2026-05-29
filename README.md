# Airbnb Analytics Platform using Snowflake, dbt & GitHub Actions

## Project Overview

This project demonstrates an end-to-end modern data analytics platform built using Snowflake, dbt Core, Git, GitHub, and GitHub Actions.

The objective is to transform raw Airbnb datasets into analytics-ready fact and dimension models while implementing software engineering and data engineering best practices such as testing, documentation, snapshots, incremental models, macros, version control, and CI/CD.

---

## Tech Stack

* Snowflake
* dbt Core
* SQL
* Git
* GitHub
* GitHub Actions
* Python
* Power BI (planned)

---

## Architecture

Raw CSV Files

↓

Snowflake Raw Layer

↓

dbt Staging Layer

↓

dbt Intermediate Layer

↓

Fact & Dimension Models

↓

Business Mart

↓

Documentation & Lineage

↓

GitHub Actions CI/CD

---

## Data Model

### Raw Layer

* raw_listings
* raw_calendar
* raw_reviews
* raw_neighbourhoods

### Staging Layer

* stg_listings
* stg_calendar
* stg_reviews
* stg_neighbourhoods

### Intermediate Layer

* int_listing_calendar
* int_listing_reviews

### Dimensions

* dim_listings
* dim_host

### Facts

* fct_occupancy
* fct_reviews
* fct_occupancy_incremental

### Business Mart

* mart_host_performance

---

## dbt Features Implemented

### Data Quality Testing

* not_null tests
* unique tests
* relationship tests
* source tests

### Incremental Models

Implemented incremental processing using:

* materialized='incremental'
* unique_key
* is_incremental()

### Snapshots (SCD Type 2)

Implemented host history tracking using dbt snapshots.

Tracked attributes:

* host_name
* host_location
* host_is_superhost
* host_response_rate
* host_acceptance_rate

Snapshot metadata:

* dbt_scd_id
* dbt_valid_from
* dbt_valid_to

### Macros

Created reusable macros for:

* Occupancy rate calculation
* Surrogate key generation

---

## CI/CD Implementation

GitHub Actions workflow automatically:

* Installs dbt
* Creates dbt profile using GitHub Secrets
* Validates Snowflake connectivity
* Runs dbt project validation

---

## Challenges Faced

### Challenge 1

CSV header mismatch during raw file loading.

Resolution:
Reviewed file structure and adjusted ingestion strategy.

### Challenge 2

Date parsing errors in listings dataset.

Resolution:
Applied data type corrections and validation during staging.

### Challenge 3

Snowflake role permission issues.

Resolution:
Granted required privileges on schemas and objects.

### Challenge 4

Snapshot discovery issue in dbt.

Resolution:
Validated snapshot configuration and project structure.

### Challenge 5

GitHub Actions profile configuration issue.

Resolution:
Generated profiles.yml dynamically using GitHub Secrets.

---

## Key Learnings

* Snowflake data warehouse design
* dbt modeling best practices
* Incremental processing
* Slowly Changing Dimensions (SCD Type 2)
* Reusable macro development
* Git branching strategy
* GitHub Actions CI/CD implementation
* End-to-end analytics engineering workflow

---

## Future Enhancements

* Power BI dashboard
* Environment-specific deployments (DEV / QA / PROD)
* Automated deployment workflows
* Advanced dbt packages
* Data observability and monitoring
