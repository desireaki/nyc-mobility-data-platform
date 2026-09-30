import duckdb

con = duckdb.connect()

def print_result(query):
    result = con.sql(query)
    print(result)

q1 = f"""
    SELECT *
    FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
    LIMIT 10;
"""

print_result(q1)

q2 = f"""
    SELECT COUNT(*) volume
    FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';
"""

print_result(q2)

q3 = f"""
    SELECT
        MIN(tpep_pickup_datetime) AS min_pickup,
        MAX(tpep_pickup_datetime) AS max_pickup
    FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';
"""

print_result(q3)


q4 = f"""
    SELECT
        payment_type,
        COUNT(*) AS trips
    FROM 'data\\raw\\yellow_tripdata_2025-01.parquet'
    GROUP BY payment_type
    ORDER BY trips DESC;
"""

print_result(q4)

q5 = f"""
SELECT
    MIN(trip_distance),
    MAX(trip_distance),
    AVG(trip_distance),
    MIN(total_amount),
    MAX(total_amount),
    AVG(total_amount)
FROM 'data\\raw\\yellow_tripdata_2025-01.parquet';
"""

print_result(q5)

#Not normal
#future pickup times 
#dropoff time equal or less than pickup
#negative payment amount
