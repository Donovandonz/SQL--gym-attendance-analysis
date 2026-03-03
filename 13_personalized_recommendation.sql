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
