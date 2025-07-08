-- Cyclistic Bike Share Analysis
-- File: weekly_trends.sql
-- Description: Analyze ride trends by day of week and user type

-- Total number of rides by day of week and user type
SELECT
  member_casual,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
  COUNT(*) AS total_rides
FROM
  `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025`
GROUP BY
  member_casual, day_of_week
ORDER BY
  member_casual, total_rides DESC;

-- Average ride duration by weekday and user type
SELECT
  member_casual,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_ride_duration_minutes
FROM
  `cyclistic-bike-analysis-460522.cyclistic_trips.all_trips_2024_2025`
GROUP BY
  member_casual, day_of_week
ORDER BY
  member_casual, avg_ride_duration_minutes DESC;
