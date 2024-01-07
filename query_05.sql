SELECT t.fullname, d.name
FROM teachers t 
JOIN disciplines d ON t.teacher_id  = d.teacher_id 
ORDER BY t.fullname 
;