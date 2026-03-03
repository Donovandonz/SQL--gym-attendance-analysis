-- Overall attendance vs no-show rates --

SELECT 
    attendance_status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM gym_staging
GROUP BY attendance_status
ORDER BY count DESC;