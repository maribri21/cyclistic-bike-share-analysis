-- ======================================================
-- File: data_cleaning_and_exploratory_analysis.sql
-- Purpose: Clean Cyclistic trip data and create new columns for analysis
-- Includes: Removing invalid rows, calculating ride duration, adding day/month/hour
-- Tool: Google BigQuery
-- ======================================================


-- ========================================
-- DATA CLEANING
-- ========================================

-- Remove trips with invalid duration (negative or zero minutes)
-- These are likely errors or incomplete trips
DELETE FROM cyclistic_trips.all_trips_2024_2025
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 0;

-- Remove rows with missing essential values
-- This includes trips missing start/end time or user type info
DELETE FROM cyclistic_trips.all_trips_2024_2025
WHERE started_at IS NULL 
   OR ended_at IS NULL 
   OR member_casual IS NULL;

-- ========================================
-- FEATURE ENGINEERING
-- ========================================

-- Add a new column for ride duration in minutes
ALTER TABLE cyclistic_trips.all_trips_2024_2025
ADD COLUMN ride_duration_mins INT64;

-- Populate ride_duration_mins using timestamp difference
UPDATE cyclistic_trips.all_trips_2024_2025
SET    ride_duration_mins = TIMESTAMP_DIFF(ended_at, started_at, MINUTE)
WHERE  ride_duration_mins IS NULL            -- only rows that still need a value
  AND  started_at IS NOT NULL                -- extra safety
  AND  ended_at   IS NOT NULL;

-- Add new time-based columns to help identify patterns
ALTER TABLE cyclistic_trips.all_trips_2024_2025
ADD COLUMN day_of_week STRING,    -- Day name: Monday, Tuesday, etc.
ADD COLUMN month STRING,          -- Month in YYYY-MM format
ADD COLUMN hour INT64;            -- Hour of day (0–23)

-- Populate the new time-based columns
UPDATE cyclistic_trips.all_trips_2024_2025
SET 
  day_of_week = FORMAT_TIMESTAMP('%A', started_at),
  month = FORMAT_TIMESTAMP('%Y-%m', started_at),
  hour = EXTRACT(HOUR FROM started_at)
WHERE 
  day_of_week IS NULL 
  OR month IS NULL 
  OR hour IS NULL;

-- ========================================
-- EXPLORATORY ANALYSIS QUERIES
-- ========================================

-- 1. Average ride duration by user type
-- This helps compare casual riders vs. members
SELECT 
  member_casual, 
  ROUND(AVG(ride_duration_mins), 2) AS avg_duration
FROM cyclistic_trips.all_trips_2024_2025
GROUP BY member_casual;

-- 2. Number of rides by day of the week and user type
-- Helps identify usage trends across weekdays vs. weekends
SELECT 
  member_casual, 
  day_of_week, 
  COUNT(*) AS num_trips
FROM cyclistic_trips.all_trips_2024_2025
GROUP BY member_casual, day_of_week;

-- 3. Number of rides by bike type and user type
-- Useful for understanding user preferences for bike types
SELECT 
  member_casual, 
  rideable_type, 
  COUNT(*) AS num_rides
FROM cyclistic_trips.all_trips_2024_2025
GROUP BY member_casual, rideable_type;
