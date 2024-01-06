SELECT d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
JOIN disciplines d ON d.discipline_id = g.discipline_id
WHERE d.discipline_id = 4
GROUP BY s.fullname
ORDER BY average_grade DESC 
LIMIT 3;