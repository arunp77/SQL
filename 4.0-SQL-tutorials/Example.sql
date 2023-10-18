-- Reference video https://www.youtube.com/watch?v=HXV3zeQKqGY&list=WL&index=53&t=9458s&ab_channel=freeCodeCamp.org
-- Here we will learn creating students table with the details on their name, student id and the major. 
-- Important is that this example sheet contains only one table. IN reality there are many tables together
-- and they may be interconnected to each other. 

-- FOr this purpose, we will also consider the employey table creation and related things. 

-- First lets know about the Students table. 

-- Creating and inserting data to a tablebranch
CREATE TABLE student (
	student_id int PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
);


DESCRIBE student;

DROP TABLE student;

alter TABLE student ADD GPA DECIMAL(3, 2);

alter TABLE student DROP GPA;
CREATE TABLE student (
	student_id int,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) unique,
    PRIMARY KEY(student_id)
);
DESCRIBE student;

INSERT INTO student values(1, 'Jack', 'Biology');
INSERT INTO student values(2, 'Kate', 'Sociology');
INSERT INTO student values(3, 'Claire', 'English');
INSERT INTO student values(4, 'Jack', 'Biology');
INSERT INTO student values(5, 'Mike', 'Computer Science');
select * From Student;

-- ------------------- other way of enetring the data------------------------------
DROP TABLE student;
INSERT INTO student values(1, 'Jack', 'Biology');
INSERT INTO student values(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name) values(3, 'Claire');
INSERT INTO student values(4, 'Jack', 'Biology');
INSERT INTO student values(5, 'Mike', 'Computer Science');
select * From Student;

-- ------------------- Modifying the table ------------------------------
DROP TABLE student;
CREATE TABLE student (
	student_id int,
    name VARCHAR(20),
    major VARCHAR(20) default 'undecided',
    PRIMARY KEY(student_id)
);
DESCRIBE student;

INSERT INTO student(student_id, name) values(1, 'Jack');
INSERT INTO student values(2, 'Kate', 'Sociology');
INSERT INTO student values(3, 'NULL', 'English');
INSERT INTO student values(4, 'Jack', 'Biology');
INSERT INTO student values(5, 'Mike', 'Computer Science');
select * From Student;

-- -------------------------------------------------
DROP TABLE student;
CREATE TABLE student (
	student_id int auto_increment,
    name VARCHAR(20),
    major VARCHAR(20) default 'undecided',
    PRIMARY KEY(student_id)
);
DESCRIBE student;

INSERT INTO student(name, major) values('Jack', 'Biology');
INSERT INTO student(name, major) values('Kate', 'Sociology');
INSERT INTO student(name, major) values('Claire', 'English');
INSERT INTO student(name, major) values('Amy', 'Biology');
INSERT INTO student(name, major) values('Mike', 'Computer Science');
select * From Student;
-- ------------------------------------------
--
-- Updating and deleting from student table
--            Constraint 
-- ------------------------------------------
-- Example-1: Change Biology to Bio for all enetry
update student
SET major = 'Bio'
WHERE major = 'Biology';

-- Example-2: Change Computer Science to Comp Sci for all enetry
update student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

-- Example-3: Change Computer Science to Comp Sci for students with student_id=4 only
update student
SET major = 'Comp Sci'
WHERE student_id = 4;

-- Example-4: Set major to Biochemistry if any student study either Bio or Chemistry 
update student
SET major = 'BioChemistry'
WHERE major = 'Biology' OR major = 'Chemistry';

-- Example-5: Set student name to Tom and major = undecided for student_id=1
update student
SET name = 'Tom', major = 'Undecided'
WHERE Student_id = 1;

-- Example-6: Deleting row 
Delete from student
where student_id =5;

-- Example-6: Deleting row 
Delete from student
where name = 'Tom' AND major = 'Undecided';

-- ----------------------------------------------------------------
--
--            Basic queries
--     getting infromation from a table
--  <, >, <=, >=,  <>, AND, OR 
-- ----------------------------------------------------------------
select name, major
From student;

select student.name, student.major
From student;

select student.name, student.major
From student
Order By name;

select student.name, student.major
From student
Order By name DESC;

select student.name, student.major
From student
Order By student_id DESC;

select *
From student
Order By student_id DESC;

select *
From student
Order By student_id;

select *
From student
Order By student_id ASC;

select *
From student
Order By student_id, major desc;

select *
From student
Order By major, student_id desc;

select *
From student
LIMIT 2;

select *
From student
Order By student_id DESC
LIMIT 2;

select *
From student
where major = 'Biology';

select *
From student
where major = 'Biology' OR major = 'Sociology';

select *
From student
where major <> 'Biology';

select *
From student
where student_id =3;

select *
From student
where student_id <3;

select *
From student
where student_id <= 3;

select *
From student
where student_id >= 3;

select *
From student
where student_id >= 3 AND name <> 'Jack';

select *
From student
where name IN ('Clair', 'Kate');

select *
From student
where major IN ('Biology', 'Sociology');

select *
From student
where major IN ('Biology', 'Sociology') AND student_id>2;

