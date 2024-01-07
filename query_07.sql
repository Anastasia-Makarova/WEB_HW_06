SELECT d.name, sg.group_name, s.fullname,  g.grade 
FROM grades g
JOIN students s ON g.student_id = s.student_id 
JOIN disciplines d ON g.discipline_id = d.discipline_id 
JOIN students_groups sg
WHERE sg.group_id = 3 AND d.discipline_id = 5
;