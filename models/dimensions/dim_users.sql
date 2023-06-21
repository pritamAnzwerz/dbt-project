
/*User Dimension:

user_id (Primary Key): Unique identifier for each user.
city: City where the user resides.
country: Country where the user resides.
hometown: Town that the user specified as their hometown.*/

with users as (
    select * from {{ref('stage_users')}}
),


final as
(select distinct 
user_id,
city,
country,
hometown 
from 
users)

select * from final