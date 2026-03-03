-- No-show patterns by day and time --

SELECT 
    DAYNAME(visit_date) AS day_of_week,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate
FROM gym_staging
GROUP BY DAYNAME(visit_date)
ORDER BY no_show_rate DESC;