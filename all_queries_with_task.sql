--1 Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
GROUP BY s.fullname
ORDER BY average_grade DESC 
LIMIT 5;

--2 Знайти студента із найвищим середнім балом з певного предмета
SELECT d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
JOIN disciplines d ON d.discipline_id = g.discipline_id
WHERE d.discipline_id = 4
GROUP BY s.fullname
ORDER BY average_grade DESC 
LIMIT 3;

--3 Знайти середній бал у групах з певного предмета.
SELECT d.name, sg.group_name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
JOIN disciplines d ON d.discipline_id = g.discipline_id
JOIN students_groups sg  ON sg.group_id  = s.group_id 
GROUP BY  d.name, sg.group_name
;

--4 Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
;

--5 Знайти які курси читає певний викладач.
SELECT t.fullname, d.name
FROM teachers t 
JOIN disciplines d ON t.teacher_id  = d.teacher_id 
ORDER BY t.fullname 
;

--6 Знайти список студентів у певній групі.
SELECT s.fullname, sg.group_name 
FROM students s 
JOIN students_groups sg  ON s.group_id  = sg.group_id  
WHERE sg.group_id = 3
;

--7 Знайти оцінки студентів у окремій групі з певного предмета.
SELECT d.name, sg.group_name, s.fullname,  g.grade 
FROM grades g
JOIN students s ON g.student_id = s.student_id 
JOIN disciplines d ON g.discipline_id = d.discipline_id 
JOIN students_groups sg
WHERE sg.group_id = 3 AND d.discipline_id = 5
;

--8 Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname, d.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t 
JOIN disciplines d ON d.teacher_id = t.teacher_id 
JOIN grades g  ON g.discipline_id = d.discipline_id 
GROUP BY d.name , t.fullname ;

-- 9 Знайти список курсів, які відвідує студент.
SELECT s.fullname, d.name 
FROM grades g 
JOIN students s ON g.student_id = s.student_id 
JOIN disciplines d ON d.discipline_id  = g.discipline_id 
WHERE s.student_id = 20
GROUP BY d.name 
;

-- 10 Список курсів, які певному студенту читає певний викладач.
SELECT t.fullname AS teacher, s.fullname AS student, d.name  AS discipline
FROM grades g 
JOIN students s ON s.student_id  = g.student_id 
JOIN disciplines d ON d.discipline_id  = g.discipline_id 
JOIN teachers t ON t.teacher_id = d.teacher_id 
WHERE s.student_id = 24 AND t.teacher_id = 1
GROUP BY d.name ;
