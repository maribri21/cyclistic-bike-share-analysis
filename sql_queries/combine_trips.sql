-- ======================================================
-- File: combine_trips.sql
-- Purpose: Merge monthly Cyclistic trip data (April 2024 – April 2025)
-- Output: Combined table 'all_trips_2024_2025'
-- Tool: Google BigQuery
-- ======================================================


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
