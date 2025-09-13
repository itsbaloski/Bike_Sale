use bike_data;

-- Connecting yr_0 and yr_1
--select * from bike_share_yr_0
--union all
--select * from bike_share_yr_1;

--select * from cost_table;

--joining the cost_table to our bike share table

with bike as (
select * from bike_share_yr_0
union all
select * from bike_share_yr_1)

select dteday, season, a.yr, weekday, hr, rider_type, riders, 
price, COGS, riders * price as revenue,  riders * price - COGS as profit
from bike a
left join cost_table b
on a.yr = b.yr;

