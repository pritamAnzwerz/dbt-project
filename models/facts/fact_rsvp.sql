/*FactRSVP:
event_id (Foreign Key referencing DimEvent)
user_id (Foreign Key referencing DimUser)
when
response
guests

The central fact table is FACT_RSVP, which contains the RSVP information such as event attendance, response, and number of guests.
The dimension tables are DIM_USERS, DIM_GROUPS,DIM_MEMBERSHIP, DIM_EVENTS, and DIM_VENUES, 
which store the descriptive attributes related to users, groups, topics, events, and venues, respectively.
The relationship between dimensions and the fact table is established through foreign keys 
(e.g., user_id, group_id, event_id, venue_id).
*/


with  
stageevents as (
    select * from {{ref('stage_events')}}
),

events as (
    select * from {{ref('dim_events')}}
),

 users as (
    select * from {{ref('dim_users')}}
),
 usergroups as (
    select * from {{ref('dim_groups')}}
),


final as (

   
    select 
    e.event_id,
    u.user_id,
    TIMESTAMP_MILLIS(s.when) as whentheuserrsvp,
    s.response as userresponse,
    s.guests 
    
    from events e
    join stageevents s
    on s.group_id=e.group_id  
    join users u
    on u.user_id=s.user_id

)
select * from final