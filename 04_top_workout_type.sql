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