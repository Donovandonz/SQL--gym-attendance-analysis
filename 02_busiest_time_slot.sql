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