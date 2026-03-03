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