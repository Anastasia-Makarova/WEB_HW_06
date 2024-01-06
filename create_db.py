import sqlite3

def create_db():

    with open('create_tables.sql', 'r') as f:
        sql = f.read()

    
    with sqlite3.connect('hw.db') as con:
        cur = con.cursor()
        # виконуємо скрипт із файлу, який створить таблиці в БД
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()