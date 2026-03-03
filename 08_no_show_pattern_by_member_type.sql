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