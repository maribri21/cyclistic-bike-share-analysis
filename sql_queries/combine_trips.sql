-- Cyclistic Bike Share Analysis
-- File: combine_trips.sql
-- Description: Combines 13 monthly trip tables (from Apr 2024 to Apr 2025) into one

CREATE OR REPLACE TABLE `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025` AS
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_04`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_05`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_06`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_07`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_08`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_09`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_10`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_11`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2024_12`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2025_01`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2025_02`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2025_03`
UNION ALL
SELECT * FROM `cyclistic-bike-analysis-460522.cyclistic_trips.tripdata_2025_04`;
