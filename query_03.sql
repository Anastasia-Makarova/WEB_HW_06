SELECT d.name, sg.group_name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
JOIN disciplines d ON d.discipline_id = g.discipline_id
JOIN students_groups sg  ON sg.group_id  = s.group_id 
GROUP BY  d.name, sg.group_name
;
