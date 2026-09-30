
SELECT *
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
LIMIT 10;

SELECT COUNT(*) volume
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT
    MIN(tpep_pickup_datetime) AS min_pickup,
    MAX(tpep_pickup_datetime) AS max_pickup
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';

SELECT
    payment_type,
    COUNT(*) AS trips
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
GROUP BY payment_type
ORDER BY trips DESC;

SELECT
MIN(trip_distance),
MAX(trip_distance),
AVG(trip_distance),
MIN(total_amount),
MAX(total_amount),
AVG(total_amount)
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';



