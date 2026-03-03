CREATE DATABASE gym_analysis;

USE gym_analysis;

CREATE TABLE gym_staging AS
SELECT *
FROM daily_gym_attendance_workout_data;

SELECT *
FROM gym_staging;


-- IDENTIFY QUALITY DATA ISSUES --

SELECT 
ROW_NUMBER() OVER (PARTITION BY member_id, visit_date, age, gender, membership_type, workout_type, workout_duration_minutes, calories_burned, check_in_time,
attendance_status) AS row_num
FROM gym_staging;


WITH duplicate_cte AS
(SELECT 
ROW_NUMBER() OVER (PARTITION BY member_id, visit_date, age, gender, membership_type, workout_type, workout_duration_minutes, calories_burned, check_in_time,
attendance_status) AS row_num
FROM gym_staging)
SELECT *
FROM duplicate_cte
WHERE row_num >= 1;


-- Check for NULL values in specific columns --

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN member_id IS NULL THEN 1 ELSE 0 END) AS null_member_id,
    SUM(CASE WHEN visit_date IS NULL THEN 1 ELSE 0 END) AS null_visit_date,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN membership_type IS NULL THEN 1 ELSE 0 END) AS null_membership_type,
    SUM(CASE WHEN workout_type IS NULL THEN 1 ELSE 0 END) AS null_workout_type,
    SUM(CASE WHEN workout_duration_minutes IS NULL THEN 1 ELSE 0 END) AS null_duration,
    SUM(CASE WHEN calories_burned IS NULL THEN 1 ELSE 0 END) AS null_calories,
    SUM(CASE WHEN check_in_time IS NULL THEN 1 ELSE 0 END) AS null_check_in,
    SUM(CASE WHEN attendance_status IS NULL THEN 1 ELSE 0 END) AS null_attendance
FROM gym_staging;


-- Standardize Text Formatting --


 UPDATE your_table_name
 SET gender = 
   CASE 
        WHEN UPPER(gender) IN ('M', 'MALE', 'MALE ') THEN 'Male'
        WHEN UPPER(gender) IN ('F', 'FEMALE', 'FEMALE ') THEN 'Female'
        WHEN UPPER(gender) IN ('O', 'OTHER', 'NON-BINARY') THEN 'Other'
        WHEN gender IS NULL OR LTRIM(RTRIM(gender)) = '' THEN 'Unknown'
        ELSE INITCAP(LTRIM(RTRIM(gender)))  -- Capitalize first letter
    END;
    
    
-- Member Behavior Analysis: Implementation Plan --

-- 1. Identify Peak Hour Visit --


SELECT 
	HOUR(check_in_time) AS visit_hour,
    COUNT(*) AS total_visits,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM gym_staging
WHERE check_in_time IS NOT NULL 
AND attendance_status = 'Present'
GROUP BY HOUR(check_in_time)
ORDER BY total_visits DESC;


-- Peak hours by day of week    

WITH Hourly_visit AS
	(SELECT
		DAYNAME(visit_date) AS day_of_week,
        HOUR(check_in_time) AS visit_hour,
        COUNT(*) AS visits,
        ROW_NUMBER() OVER(PARTITION BY DAYNAME(visit_date) 
        ORDER BY COUNT(*) DESC) AS `rank`
FROM gym_staging
WHERE check_in_time IS NOT NULL
AND attendance_status = 'Present'
GROUP BY DAYNAME(visit_date), HOUR(check_in_time))

SELECT 
	day_of_week,
    visit_hour,
    visits,
ROUND(visits * 100.0 / SUM(visits) OVER(PARTITION BY day_of_week), 2) AS day_percentage
FROM Hourly_visit
WHERE `rank` <= 5
ORDER BY 
	FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), `rank`;
    
    
-- Heatmap: Visits by hour and day --

SELECT 
    HOUR(check_in_time) AS hour_of_day,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Monday' THEN 1 ELSE 0 END) AS monday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Tuesday' THEN 1 ELSE 0 END) AS tuesday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Wednesday' THEN 1 ELSE 0 END) AS wednesday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Thursday' THEN 1 ELSE 0 END) AS thursday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Friday' THEN 1 ELSE 0 END) AS friday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Saturday' THEN 1 ELSE 0 END) AS saturday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Sunday' THEN 1 ELSE 0 END) AS sunday,
    COUNT(*) AS total_visits
FROM gym_staging
WHERE check_in_time IS NOT NULL 
    AND attendance_status = 'Present'
GROUP BY HOUR(check_in_time)
ORDER BY HOUR(check_in_time);
    


-- Busiest time slots for staff scheduling --

SELECT 
    CASE 
        WHEN HOUR(check_in_time) BETWEEN 5 AND 8 THEN 'Early Morning (5-8am)'
        WHEN HOUR(check_in_time) BETWEEN 9 AND 11 THEN 'Morning (9-11am)'
        WHEN HOUR(check_in_time) BETWEEN 12 AND 14 THEN 'Lunch (12-2pm)'
        WHEN HOUR(check_in_time) BETWEEN 15 AND 17 THEN 'Afternoon (3-5pm)'
        WHEN HOUR(check_in_time) BETWEEN 18 AND 21 THEN 'Evening (6-9pm)'
        WHEN HOUR(check_in_time) BETWEEN 22 AND 23 THEN 'Late Night (10-11pm)'
        WHEN HOUR(check_in_time) BETWEEN 0 AND 4 THEN 'Overnight (12-4am)'
        ELSE 'Other'
    END AS time_slot,
    COUNT(*) AS total_visits,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage,
    AVG(workout_duration_minutes) AS avg_duration,
    COUNT(DISTINCT member_id) AS unique_members
FROM gym_staging
WHERE check_in_time IS NOT NULL 
    AND attendance_status = 'Present'
GROUP BY 
    CASE 
        WHEN HOUR(check_in_time) BETWEEN 5 AND 8 THEN 'Early Morning (5-8am)'
        WHEN HOUR(check_in_time) BETWEEN 9 AND 11 THEN 'Morning (9-11am)'
        WHEN HOUR(check_in_time) BETWEEN 12 AND 14 THEN 'Lunch (12-2pm)'
        WHEN HOUR(check_in_time) BETWEEN 15 AND 17 THEN 'Afternoon (3-5pm)'
        WHEN HOUR(check_in_time) BETWEEN 18 AND 21 THEN 'Evening (6-9pm)'
        WHEN HOUR(check_in_time) BETWEEN 22 AND 23 THEN 'Late Night (10-11pm)'
        WHEN HOUR(check_in_time) BETWEEN 0 AND 4 THEN 'Overnight (12-4am)'
        ELSE 'Other'
    END
ORDER BY total_visits DESC;	



-- 2. Analyze Workout Preferences by Demographic Segments --

-- Workout preferences by age group and gender -- 

SELECT 
    age,
    gender,
    workout_type,
    COUNT(*) AS total_sessions,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY age, gender), 2) AS segment_percentage
FROM gym_staging
WHERE attendance_status = 'Present'
    AND workout_type IS NOT NULL
    AND workout_duration_minutes IS NOT NULL
GROUP BY age, gender, workout_type
ORDER BY age, gender, total_sessions DESC;



-- Top workout types by membership type

SELECT 
    membership_type,
    workout_type,
    COUNT(*) AS session_count,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY membership_type), 2) AS type_percentage
FROM gym_staging
WHERE attendance_status = 'Present'
GROUP BY membership_type, workout_type
ORDER BY membership_type, session_count DESC;



-- Time of day preferences by demographic and workout type --

SELECT gender, age, workout_type,
   HOUR(check_in_time) AS hour_of_day,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Monday' THEN 1 ELSE 0 END) AS monday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Tuesday' THEN 1 ELSE 0 END) AS tuesday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Wednesday' THEN 1 ELSE 0 END) AS wednesday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Thursday' THEN 1 ELSE 0 END) AS thursday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Friday' THEN 1 ELSE 0 END) AS friday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Saturday' THEN 1 ELSE 0 END) AS saturday,
    SUM(CASE WHEN DAYNAME(visit_date) = 'Sunday' THEN 1 ELSE 0 END) AS sunday,
    COUNT(*) AS total_visits
FROM gym_staging
WHERE attendance_status = 'Present'
GROUP BY gender, age, workout_type, HOUR(check_in_time)
ORDER BY hour_of_day;



-- 3. Understand Attendance Patterns & No-Show Trends --


-- Overall attendance vs no-show rates --

SELECT 
    attendance_status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM gym_staging
GROUP BY attendance_status
ORDER BY count DESC;



-- No-show patterns by day and time --

SELECT 
    DAYNAME(visit_date) AS day_of_week,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate
FROM gym_staging
GROUP BY DAYNAME(visit_date)
ORDER BY no_show_rate DESC;



-- Member-level attendance patterns --

WITH MemberStats AS 
    (SELECT 
        member_id,
        COUNT(*) AS total_bookings,
        SUM(CASE WHEN attendance_status = 'Present' THEN 1 ELSE 0 END) AS attended,
        SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) AS no_shows,
        MIN(visit_date) AS first_visit,
        MAX(visit_date) AS last_visit
    FROM gym_staging
    GROUP BY member_id)

SELECT 
    CASE 
        WHEN total_bookings >= 15 THEN 'Very Frequent (15+ visits)'
        WHEN total_bookings >= 10 THEN 'Frequent (10-19 visits)'
        WHEN total_bookings >= 5 THEN 'Occasional (5-9 visits)'
        ELSE 'Infrequent (1-4 visits)'
    END AS visit_frequency,
    COUNT(*) AS member_count,
    ROUND(AVG(total_bookings), 1) AS avg_bookings,
    ROUND(AVG(attended * 100.0 / total_bookings), 2) AS avg_attendance_rate,
    ROUND(AVG(no_shows * 100.0 / total_bookings), 2) AS avg_no_show_rate,
    ROUND(AVG(DATEDIFF(last_visit, first_visit)), 1) AS avg_member_tenure_days
FROM MemberStats
GROUP BY 
    CASE 
        WHEN total_bookings >= 15 THEN 'Very Frequent (15+ visits)'
        WHEN total_bookings >= 10 THEN 'Frequent (10-19 visits)'
        WHEN total_bookings >= 5 THEN 'Occasional (5-9 visits)'
        ELSE 'Infrequent (1-4 visits)'
    END
ORDER BY member_count DESC;



-- No-show patterns by membership type --

SELECT 
    membership_type,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate,
    AVG(workout_duration_minutes) AS avg_duration_booked
FROM gym_staging
GROUP BY membership_type
ORDER BY no_show_rate DESC;


-- 4. Determine Factors Influencing Workout Duration & Frequency --

-- Factors affecting workout duration --

SELECT 
    workout_type,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    COUNT(*) AS session_count
FROM gym_staging
WHERE attendance_status = 'Present'
    AND workout_duration_minutes IS NOT NULL
GROUP BY workout_type
HAVING COUNT(*) > 2
ORDER BY avg_duration DESC;



-- Correlation between membership type and workout frequency/duration --

WITH MemberStats AS (
    SELECT 
        membership_type,
        member_id,
        COUNT(*) AS member_visits,
        SUM(workout_duration_minutes) AS total_duration,
        AVG(workout_duration_minutes) AS avg_duration,
        AVG(calories_burned) AS avg_calories
    FROM gym_staging
    WHERE attendance_status = 'Present'
    GROUP BY membership_type, member_id
)
SELECT 
    membership_type,
    COUNT(DISTINCT member_id) AS total_members,
    ROUND(AVG(member_visits), 1) AS avg_visits_per_member,
    ROUND(AVG(avg_duration), 1) AS avg_duration_per_visit,
    ROUND(AVG(avg_calories), 0) AS avg_calories_per_visit,
    ROUND(AVG(total_duration), 1) AS total_avg_minutes_per_member
FROM MemberStats
GROUP BY membership_type
ORDER BY avg_visits_per_member DESC;



-- Age and gender impact on workout patterns --

SELECT 
    age,
    gender,
    COUNT(DISTINCT member_id) AS member_count,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT member_id), 1) AS avg_visits_per_member,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    (
        SELECT workout_type
        FROM gym_staging t2
        WHERE t2.age = t1.age
            AND t2.gender = t1.gender
            AND t2.attendance_status = 'Present'
            AND t2.workout_type IS NOT NULL
        GROUP BY workout_type
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) AS most_common_workout
FROM gym_staging t1
WHERE attendance_status = 'Present' 
GROUP BY age, gender
ORDER BY age, gender;



-- Seasonal/monthly patterns --

SELECT 
    MONTHNAME(visit_date) AS month,
    COUNT(*) AS total_visits,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    COUNT(DISTINCT member_id) AS active_members,
    ROUND(COUNT(*) * 100.0 / LAG(COUNT(*)) OVER (ORDER BY MIN(visit_date)), 2) AS month_over_month_change
FROM gym_staging
WHERE attendance_status = 'Present'
GROUP BY MONTHNAME(visit_date), MONTH(visit_date)
ORDER BY MONTH(visit_date);



-- 5. Actionable Insights Generation --

-- Staff scheduling recommendations

SELECT 
    DAYNAME(visit_date) AS day_of_week,
    CASE 
        WHEN HOUR(check_in_time) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(check_in_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN HOUR(check_in_time) BETWEEN 17 AND 21 THEN 'Evening'
        WHEN HOUR(check_in_time) BETWEEN 22 AND 23 OR HOUR(check_in_time) BETWEEN 0 AND 4 THEN 'Late Night'
        ELSE 'Other'
    END AS time_of_day,
    COUNT(*) AS expected_visits,
    ROUND(COUNT(*) / COUNT(DISTINCT DATE(visit_date)), 1) AS avg_daily_visits,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_session_length,
    COUNT(DISTINCT member_id) AS unique_members,
    ROUND(AVG(calories_burned), 0) AS avg_calories_burned
FROM gym_staging
WHERE attendance_status = 'Present'
    AND check_in_time IS NOT NULL
    AND visit_date IS NOT NULL
GROUP BY 
    DAYNAME(visit_date),
    CASE 
        WHEN HOUR(check_in_time) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(check_in_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN HOUR(check_in_time) BETWEEN 17 AND 21 THEN 'Evening'
        WHEN HOUR(check_in_time) BETWEEN 22 AND 23 OR HOUR(check_in_time) BETWEEN 0 AND 4 THEN 'Late Night'
        ELSE 'Other'
    END
ORDER BY time_of_day DESC;



-- Personalized recommendation opportunities using window functions --


SELECT 
    member_id,
    age,
    ROUND(AVG(workout_duration_minutes), 1) AS avg_duration,
    ROUND(AVG(calories_burned), 0) AS avg_calories,
    COUNT(*) AS total_visits,
    CASE 
        WHEN AVG(workout_duration_minutes) < 30 THEN 'Try longer workouts'
        WHEN AVG(calories_burned) < 200 THEN 'Increase intensity'
        WHEN COUNT(*) < 4 THEN 'Visit more often'
        ELSE 'Great routine'
    END AS recommendation
FROM gym_staging
WHERE attendance_status = 'Present'
    AND workout_duration_minutes IS NOT NULL
GROUP BY member_id, age
ORDER BY member_id;




SELECT *
FROM gym_staging;
    


