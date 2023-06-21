/*
membership_id (Primary Key): Unique identifier for each membership.
user_id (Foreign Key): Reference to the User dimension table.
group_id (Foreign Key): Reference to the Group dimension table.
joined: Timestamp of when the user joined the group.*/

with users as (
    select * from {{ref('stage_users')}}
),
 usergroups as (
    select * from {{ref('stage_groups')}}
),
 final as (
select 
row_number() over () as membership_id,
g.group_id,
u.user_id,
TIMESTAMP_MILLIS(u.joined) AS joined
from users u 
join usergroups g
on u.group_id=g.group_id
)
select * from final