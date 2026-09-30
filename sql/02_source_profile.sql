DESCRIBE
SELECT *
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

-- Identifier: VendorId, RateCodeId, PULocationID, DOLocationID
-- Timestamp:  tpep_pickup_datetime, tpep_dropoff_datetime  
-- Measure: passenger_count, trip_distance, fare_amount, 
-- Attribute: store_and_fwd_flag
-- Categorical: 

SELECT COUNT(*) AS row_count
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT
    MIN(tpep_pickup_datetime) AS first_pickup,
    MAX(tpep_pickup_datetime) AS last_pickup
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT
    MIN(trip_distance) AS min_distance,
    MAX(trip_distance) AS max_distance,
    AVG(trip_distance) AS avg_distance,
    MIN(total_amount) AS min_total,
    MAX(total_amount) AS max_total,
    AVG(total_amount) AS avg_total
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT
    payment_type,
    COUNT(*) AS trip_count
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
GROUP BY payment_type
ORDER BY trip_count DESC;

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(tpep_pickup_datetime) AS pickup_nulls,
    COUNT(*) - COUNT(tpep_dropoff_datetime) AS dropoff_nulls,
    COUNT(*) - COUNT(passenger_count) AS passenger_nulls,
    COUNT(*) - COUNT(trip_distance) AS distance_nulls,
    COUNT(*) - COUNT(fare_amount) AS fare_nulls,
    COUNT(*) - COUNT(total_amount) AS total_nulls
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT tpep_pickup_datetime, tpep_dropoff_datetime, trip_distance, total_amount
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
WHERE passenger_count IS NULL 
    AND total_amount > 0 ORDER BY total_amount DESC
    LIMIT 5;

SELECT COUNT(*) AS zero_distance_trips
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
WHERE trip_distance = 0;

SELECT COUNT(*) AS negative_fares
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
WHERE fare_amount < 0;

SELECT
    passenger_count,
    COUNT(*) AS trips
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
GROUP BY passenger_count
ORDER BY passenger_count;

SELECT COUNT(*) AS invalid_duration
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
WHERE tpep_dropoff_datetime < tpep_pickup_datetime;

--We have trips with no passengers
--Trips where drop off is less than pickup
--Fare is a negative number
--No distance covered
