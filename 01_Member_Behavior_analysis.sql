-- Peak hours by day of week    

WITH Hourly_visit AS
	(SELECT
		DAYNAME(visit_date) AS day_of_week,
        HOUR(check_in_time) AS visit_hour,
        COUNT(*) AS visits,
        ROW_NUMBER() OVER(PARTITION BY DAYNAME(visit_date) 
        ORDER BY COUNT(*) DESC) AS `rank`
FROM gym_staging
WHERE check_in_time IS NOT NULL
AND attendance_status = 'Present'
GROUP BY DAYNAME(visit_date), HOUR(check_in_time))

SELECT 
	day_of_week,
    visit_hour,
    visits,
ROUND(visits * 100.0 / SUM(visits) OVER(PARTITION BY day_of_week), 2) AS day_percentage
FROM Hourly_visit
WHERE `rank` <= 5
ORDER BY 
	FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), `rank`;