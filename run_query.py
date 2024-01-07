import sqlite3



def execute_query(sql: str) -> list:
    with sqlite3.connect('hw.db') as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


sql = """
SELECT t.fullname AS teacher, s.fullname AS student, d.name  AS discipline
FROM grades g 
JOIN students s ON s.student_id  = g.student_id 
JOIN disciplines d ON d.discipline_id  = g.discipline_id 
JOIN teachers t ON t.teacher_id = d.teacher_id 
WHERE s.student_id = 24 AND t.teacher_id = 1
GROUP BY d.name ;
"""

for res in execute_query(sql):
    print(res)