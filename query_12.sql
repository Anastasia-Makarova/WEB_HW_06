SELECT sg.group_name, s.fullname, d.name, g.grade , g.date_of 
FROM grades g 
JOIN students s ON s.student_id = g.student_id 
JOIN students_groups sg ON sg.group_id = s.group_id 
JOIN disciplines d ON d.discipline_id = g.discipline_id 
WHERE sg.group_id = 3 AND g.date_of = (SELECT MAX(g.date_of) FROM grades g)
ORDER BY g.date_of DESC
;