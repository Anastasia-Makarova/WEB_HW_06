DROP TABLE IF EXISTS students_groups;
CREATE TABLE students_groups (
  group_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  group_name VARCHAR(30)
  );
 
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
  teacher_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  fullname VARCHAR(250)
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
  student_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  fullname VARCHAR(250),
  group_id INTEGER,
  FOREIGN KEY (group_id) REFERENCES students_groups (group_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
  );

 DROP TABLE IF EXISTS disciplines;
 CREATE TABLE disciplines (
  discipline_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(100),
  teacher_id INTEGER,
  FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
  );
 
 DROP TABLE IF EXISTS grades;
 CREATE TABLE grades (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  discipline_id  VARCHAR(30),
  student_id VARCHAR(30),
  grade INTEGER,
  date_of DATE,
  FOREIGN KEY (discipline_id) REFERENCES disciplines (discipline_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
  FOREIGN KEY (student_id) REFERENCES students (student_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
        );