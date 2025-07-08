-- Cyclistic Bike Share Analysis
-- File: member_vs_casual.sql
-- Description: Compares ride behavior between annual members and casual riders
-- Data: Combined dataset from April 2024 to April 2025

-- 1. Average ride length per user type
SELECT
  member_casual,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_ride_duration_minutes
FROM
  `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025`
GROUP BY
  member_casual;

-- 2. Most popular days of the week by user type
SELECT
  member_casual,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
  COUNT(*) AS trip_count
FROM
  `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025`
GROUP BY
  member_casual, day_of_week
ORDER BY
  member_casual, trip_count DESC;

-- 3. Ride count and average duration by rideable type
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_duration_minutes
FROM
  `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025`
GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, total_rides DESC;
