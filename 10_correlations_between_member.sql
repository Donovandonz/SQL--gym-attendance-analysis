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