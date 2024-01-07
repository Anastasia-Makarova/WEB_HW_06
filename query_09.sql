SELECT s.fullname, d.name 
FROM grades g 
JOIN students s ON g.student_id = s.student_id 
JOIN disciplines d ON d.discipline_id  = g.discipline_id 
WHERE s.student_id = 20
GROUP BY d.name 
;