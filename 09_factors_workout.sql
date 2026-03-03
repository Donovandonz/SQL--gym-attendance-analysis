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