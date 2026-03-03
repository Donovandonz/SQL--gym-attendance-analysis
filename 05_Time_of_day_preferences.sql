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