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