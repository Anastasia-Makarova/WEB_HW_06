from datetime import datetime, date, timedelta
from faker import Faker
from random import randint, choice

import sqlite3

fake = Faker()

# connect = sqlite3.connect('homework.db')
# cursor = connect.cursor()

NUMBER_OF_TEACHERS = 5
NUMBER_OF_STUDENTS = 50

disciplines = [
    'Math', 
    'Physics', 
    'History', 
    'Literature', 
    'Coding', 
    'English'
    'Biology'
    ]

students_groups = [
    'Py022', 
    'C023', 
    'JS021'
    ]


def seed_teachers():
    teachers = [fake.name() for _ in range(NUMBER_OF_TEACHERS)]
    with sqlite3.connect('hw.db') as con:
        cursor = con.cursor()
        sql = "INSERT INTO teachers(fullname) VALUES(?);"
        cursor.executemany(sql, zip(teachers,))
        con.commit()


def seed_disciplines():
    with sqlite3.connect('hw.db') as con:
        cursor = con.cursor()
        sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
        cursor.executemany(sql, zip(disciplines, iter(randint(1, NUMBER_OF_TEACHERS) for _ in range(len(disciplines)))))
        con.commit()

def seed_students_groups():
    with sqlite3.connect('hw.db') as con:
        cursor = con.cursor()
        sql = "INSERT INTO students_groups(group_name) VALUES(?);"
        cursor.executemany(sql, zip(students_groups,))
        con.commit()

def seed_students():
    students = [fake.name() for _ in range(NUMBER_OF_STUDENTS)]
    with sqlite3.connect('hw.db') as con:
        cursor = con.cursor()
        sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
        cursor.executemany(sql, zip(students, iter(randint(1, len(students_groups)) for _ in range(NUMBER_OF_STUDENTS))))
        con.commit()

def  seed_grades():
    
    
    start_date = datetime.strptime('2023-09-01', '%Y-%m-%d')
    end_date = datetime.strptime('2023-12-30', '%Y-%m-%d')

    def get_list_date(start: date, end: date):
        result = []

        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)

        return result
    
    list_dates = get_list_date(start_date, end_date)

    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_OF_STUDENTS) for _ in range(5)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 5), day.date()))

    with sqlite3.connect('hw.db') as con:
        cursor = con.cursor()
        sql = "INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);"
        cursor.executemany(sql, grades)
        con.commit()

    


if __name__ == '__main__':
    try:
        seed_teachers()
        seed_disciplines()
        seed_students_groups()
        seed_students()
        seed_grades()

    except sqlite3.Error as error:
        print(error)


    
 