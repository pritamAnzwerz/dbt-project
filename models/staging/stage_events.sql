with source as (
    select * from {{ source('meetup', 'events') }}
),
stage_events as (
    select    
    venue_id,	
    time,
    status,	
    duration,		
    rsvp_limit,		
    created,	
    group_id,		
    name,		
    description,	
    rsvps.user_id,		
    rsvps.response,		
    rsvps.when,		
    rsvps.guests
FROM
  source cross join UNNEST(rsvps) AS rsvps
)

select * from stage_events