with source as (
    select * from {{ source('meetup', 'users') }}
),

 stage_users as 
(
    select 
user_id,
city,
country,
hometown,
m.group_id,
m.joined
from source cross join UNNEST(memberships) AS m
)

select * from stage_users