SELECT t.fullname, s.fullname , ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t 
JOIN disciplines d ON d.teacher_id = t.teacher_id 
JOIN grades g  ON g.discipline_id = d.discipline_id 
JOIN students s ON s.student_id  = g.student_id 
GROUP BY t.fullname  , s.fullname  ;