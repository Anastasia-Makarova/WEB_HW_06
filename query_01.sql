SELECT s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
GROUP BY s.fullname
ORDER BY average_grade DESC 
LIMIT 5;