SELECT t.fullname, d.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t 
JOIN disciplines d ON d.teacher_id = t.teacher_id 
JOIN grades g  ON g.discipline_id = d.discipline_id 
GROUP BY d.name , t.fullname ;