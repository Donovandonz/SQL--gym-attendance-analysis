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