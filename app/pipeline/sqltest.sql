# Implicit inner join 
select 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	concat(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
	concat(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc"
from
	yellow_taxi_trips_2021_7 t,
	zones zpu,
	zones zdo
where
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
limit 100;

# Explicit Inner join
select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	concat(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
	concat(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc"
from
	yellow_taxi_trips_2021_7 t 
	join 
	zones zpu 
	on 
	t."PULocationID" = zpu."LocationID"
	join
	zones zdo
	on
	t."DOLocationID" = zdo."LocationID"
limit 100;

# Data Quality Checks
select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	"PULocationID",
	"DOLocationID"
from
	yellow_taxi_trips_2021_7
where
	"PULocationID" is null
	or "DOLocationID" is null
limit 100;

# Checking for Location Ids not in Zones table
select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	"PULocationID",
	"PDLocationID"
from
	yellow_taxi_trips_2021_7
where
	"DOLocationID" not in (select "LocationID" from zones)
	or "PULocationID" not in (select "LocationID" from zones)
limit 100;

# Left, Right, and outer joins
select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	concat(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
	concat(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc"
from
	yellow_taxi_trips_2021_7
left join
	zones zpu on t."PULocationID" = zpu."LocationID"
join
	zones zdo on t."DOLocationID" = zdo."LocationID"
limit 100;

select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	concat(zpu."Borough", ' | ', zpu."Zone") AS "pickup_loc",
	concat(zdo."Borough", ' | ', zdo."Zone") AS "dropoff_loc"
from
	yellow_taxi_trips_2021_7
outer join
	zones zpu on t."PULocationID" = zpu."LocationID"
join
	zones zdo on t."DOLocationID" = zdo."LocationID"
limit 100;

select
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	concat(zpu."Borough", ' | ', zpu."Zone") AS "pickup_loc",
	concat(zdo."Borough", ' | ', zdo."Zone") AS "dropoff_loc"
from
	yellow_taxi_trips_2021_7
right join
	zones zpu on t."PULocationID" = zpu."LocationID"
join
	zones zdo on t."DOLocationID" = zdo."LocationID"
limit 100;

# group by
Calculate Number of Trips Per Day
select
	cast(tpep_dropoff_datetime as date) as dropoff_date,
	count(1)
from
	yellow_taxi_trips_2021_7
group by
	cast(tpep_dropoff_datetime as date)
limit 100;

# order by
select
	cast(tpep_dropoff_datetime as date) as "day",
	count(1)
from 
	yellow_taxi_trips_2021_7
group by
	cast(tpep_dropoff_datetime as date)
order by
	"day" asc
limit 100;

# Order by Count
select
	cast(tpep_dropoff_datetime as date) as "day",
	count(1)
from
	yellow_taxi_trips_2021_7
group by
	cast(tpep_dropoff_datetime as date)
order by
	"count" desc
limit 100;

# Other Aggregations
select
	cast(tpep_dropoff_datetime as date) as "day",
	count(1) as "count",
	max(total_amount) as "total_amount",
	max(passenger_count) as "passenger_count"
from
	yellow_taxi_trips_2021_7
group by
	cast(tpep_dropoff_datetime as date)
order by
	"count" desc
limit 100;

# Grouping by Multiple Fields
select
	cast(tpep_dropoff_datetime as date) as "day",
	"DOLocationID",
	count(1) as "count",
	max(total_amount) as "total_amount",
	max(passenger_count) as "passenger_count"
from
	yellow_taxi_trips_2021_7
group by
	1, 2
order by
	"day" asc,
	"DOLocationID" asc,
limit 100;