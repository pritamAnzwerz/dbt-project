with source as (
    select * from {{ source('meetup', 'venues') }}
),
stage_venues as (
    select venue_id,
    name,
    city,
    country,
    lat,
    lon from source
)

select * from stage_venues