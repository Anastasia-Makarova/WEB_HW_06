SELECT s.fullname, sg.group_name 
FROM students s 
JOIN students_groups sg  ON s.group_id  = sg.group_id  
WHERE sg.group_id = 3
;
