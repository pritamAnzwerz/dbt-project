
/*RSVP Dimension:

rsvp_id (Primary Key): Unique identifier for each RSVP.
event_id (Foreign Key): Reference to the Event Fact table.
user_id (Foreign Key): Reference to the User dimension table.
when: Timestamp of when the user gave their RSVP.
response: RSVP response ('Yes' or 'No').
guests: Number of guests the user is planning to bring.*/

with users as (
    select * from {{ref('stage_users')}}
),
 events as (
    select * from {{ref('stage_events')}}
), 
 final as (
select 
row_number() over () as rsvp_id,
u.user_id,
TIMESTAMP_MILLIS(e.when) AS w,
e.response,
e.guests
from events e 
 join users u
on u.user_id=e.user_id

)

select * from final