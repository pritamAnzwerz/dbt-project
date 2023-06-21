/*Venue Dimension:

venue_id (Primary Key): Unique identifier for each venue.
name: Name of the venue.
city: City where the venue is located.
country: Country where the venue is located.
lat: Latitude of the venue location.
lon: Longitude of the venue location.*/


with venues as (
    select * from {{ref('stage_venues')}}
),
final as
(select distinct 
venue_id,
name,
city,
country,
lat,
lon 
from 

venues)

select * from final