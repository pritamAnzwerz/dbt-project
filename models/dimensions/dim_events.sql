
/*Dim_Events:

event_id (Primary Key): Unique identifier for each event.
group_id (Foreign Key): Reference to the Group dimension table.
venue_id (Foreign Key): Reference to the Venue dimension table.
created: Timestamp of when the event was created.
time: Timestamp of when the event will start (or has started).
duration: Duration of the event in seconds.
rsvp_limit: Maximum number of YES RSVPs allowed for the event.
status: The status of the event ('past' or 'upcoming'). */

with  events as (
    select * from {{ref('stage_events')}}
),
 grp as (
    select * from {{ref('stage_groups')}}
),
 venues as (
    select * from {{ref('stage_venues')}}
),




final as (
    select row_number() over () as event_id,
    e.name,
    e.description,
    g.group_id,  
    v.venue_id,   
    TIMESTAMP_MILLIS(e.created) as created,
    TIMESTAMP_MILLIS(e.time) as time,
    e.duration,
    e.rsvp_limit,
    e.status 

    from events e
    
    join grp g

    on e.group_id=g.group_id
    
    join venues v 

    on e.venue_id=v.venue_id
   
    

)
select *   from final