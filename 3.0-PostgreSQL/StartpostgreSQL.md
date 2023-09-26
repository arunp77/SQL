Here, I will disuss step by step to proseed with the postgreSQL on [freecodecamp.org](https://www.freecodecamp.org/fcc7011b5c1).

## Step-1: Login
```
codeally@147a091d400c:~/project$ psql --username=freecodecamp --dbname=postgres
```
**Output:**
```
Border style is 2.
Title is " ".
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.
```
Now terminal will be converted to

```
postgres=>
```
## Step-2: Check content of the filess in the directory

```
postgres=> \l

```
**Output:**

```
                               List of databases
+-----------+----------+----------+---------+---------+-----------------------+
|   Name    |  Owner   | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+----------+----------+---------+---------+-----------------------+
| postgres  | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |          |          |         |         | postgres=CTc/postgres |
| template1 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |          |          |         |         | postgres=CTc/postgres |
+-----------+----------+----------+---------+---------+-----------------------+
```
## Step-3: Creeating aa database

The databases you see are there by default. You can make your own like this:
```
postgres=> CREATE DATABASE first_database;
```
The capitalized words are keywords telling PostgreSQL what to do. The name of the database 
is the lowercase word. Note that all commands need a semi-colon at the end. Create a new database named `first_database`.

**Output:**
```
                                   List of databases
+----------------+--------------+----------+---------+---------+-----------------------+
|      Name      |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+----------------+--------------+----------+---------+---------+-----------------------+
| first_database | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| postgres       | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0      | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|                |              |          |         |         | postgres=CTc/postgres |
| template1      | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|                |              |          |         |         | postgres=CTc/postgres |
+----------------+--------------+----------+---------+---------+-----------------------+
```

## Step:4 connect with a database


You can connect to a database by entering `\c database_name`. You need to connect to add information. Connect to your `second_database`.
```
postgres=> \c second_database
```
**Output:** You are now connected to database "second_database" as user "freecodecamp.


You should see a message that you are connected. Notice that the prompt changed to `second_database=>`. So the `postgres=>` prompt before must have meant you were connected to that database. A database is made of tables that hold your data. Enter `\d` to display the tables.

```
second_database=> \d
```
**Output:** Did not find any relations.

## Step-5: Creating a table

Looks like there's no tables or relations yet. Similar to how you created a database, you can create a table like this:
```
CREATE TABLE table_name();
```
Note that the parenthesis are needed for this one. It will create the table in the database you are connected to. Create a table named `first_table` in `second_database`.

```
second_database=> CREATE TABLE first_table();
```
we can see the newly created table as
```
second_database=> \d
```
**Output:**
```
               List of relations
+--------+-------------+-------+--------------+
| Schema |    Name     | Type  |    Owner     |
+--------+-------------+-------+--------------+
| public | first_table | table | freecodecamp |
+--------+-------------+-------+--------------+
```
To see the more details about a table: `\d table_name`.
```
second_database=> \d second_table
```
**Output:**
```
           Table "public.second_table"
+--------+------+-----------+----------+---------+
| Column | Type | Collation | Nullable | Default |
+--------+------+-----------+----------+---------+
+--------+------+-----------+----------+---------+
```
## Step-6: Add a column to the table

Tables need columns to describe the data in them. To add a column:
```
ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
```
To add a column, with name 'first_column' in 'second_table' with a datatype: INT
```
second_database=> ALTER TABLE second_table ADD COLUMN first_column INT
```
To check the changed column name, type
```
second_database=> \d second_table
```
**Output:**
```
                Table "public.second_table"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| first_column | integer |           |          |         |
+--------------+---------+-----------+----------+---------+
```
## Step-7: Add a id to the newly created column to the table

```
second_database=> ALTER TABLE second_table ADD COLUMN id INT;
```
To check the added details are there:
```
\d second_table
```
**Output:** We can see the first_column with the id and integeer type is addeed.
```
second_database=>                 Table "public.second_table"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| first_column | integer |           |          |         |
| id           | integer |           |          |         |
+--------------+---------+-----------+----------+---------+
```

## Step-8: Add a 'age' column to the table
```
second_database=> ALTER TABLE second_table ADD COLUMN age INT;
```
To see the modification of the table, use:
```
\d second_table
```
**Output:**
```
second_database=>                 Table "public.second_table"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| first_column | integer |           |          |         |
| id           | integer |           |          |         |
| age          | integer |           |          |         |
+--------------+---------+-----------+----------+---------+
```

## Step-9: Drop a column

```
ALTER TABLE table_name DROP COLUMN column_name;
```

## Step-10: Rename a column name
```
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;
```

## Step-10: Add a data in a row
```
INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
```
## Step-11: To view the newly created table with the above entry
```
SELECT * FROM table_name;
```
Let's supposse, we have created 'second_table' with following table
```
+----+----------+
| id | username |
+----+----------+
|  1 | samus    |
|  1 | Samus    |
|  2 | Mario    |
|  3 | Luigi    |
+----+----------+
```

## Step-12: To delete a specific entry in a row

To delete entry for 'Luigi'
```
second_database=> DELETE FROMM second_table WHERE username='Luigi'
```

## Step-13: Drop a table
Let's suppose that we have two tables- 'first_table' and 'second_table' and now we want to delet second one.
```
DROP TABLE 'second_table'
```

## Step-14: Insert mmultiple entries of rows in a table

Example: 'mario_database'

```
NSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink'),
('Toadstool', 'Mushroom Kingdom', 'Red'),
('Bowser', 'Mushroom Kingdom', 'Green')
('Daisy', 'Sarasaland', 'Yellow'),
('Yoshi', 'Dinosaur Land', 'Green');;
```
so we have created a mario database of-
```
mario_database=>    
```
**Output:**
```
+--------------+-----------+------------------+----------------+
| character_id |   name    |     homeland     | favorite_color |
+--------------+-----------+------------------+----------------+
|            1 | Mario     | Mushroom Kingdom | Red            |
|            2 | Luigi     | Mushroom Kingdom | Green          |
|            3 | Peach     | Mushroom Kingdom | Pink           |
|            4 | Toadstool | Mushroom Kingdom | Red            |
|            5 | Bowser    | Mushroom Kingdom | Green          |
|            6 | Daisy     | Sarasaland       | Yellow         |
|            7 | Yoshi     | Dinosaur Land    | Green          |
+--------------+-----------+------------------+----------------+
```

## Step-15:




## Step-16:


## Step-17:





## Step-18:





## Step-19:



















