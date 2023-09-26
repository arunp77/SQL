-- Here we will create tables of Employee, branch, client table, work with table and branch supplier.
-- To create this, we will first drop the student table and nany other created tables. 

-- Lets jump into it. 
-- ----------------------------------------------------------------------
Drop table student;
Drop table geo;
Drop table products;
Drop table people;
drop table sales;
Drop table actor;

-- Now create the 
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) 
  ON DELETE SET NULL 
  -- Here 'ON DELETE SET CODE IS USED WHEN fOREIGN KEYS ARE CREATED'
);

-- Now to connect the Employee table and the Branch table, we use Alter the tables. 
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

select * from Employee;
select * from branch;
select * from client;
select * from works_with;
select * from Branch_supplier;

-- Find all employee
select *
From Employee;

-- find all client
select *
From client;

-- Find all employee by salary
select *
From Employee
Order by Salary ASC;

select *
From Employee
Order by Salary DESC;

-- Find all employee ordered by sex and then name
select *
from Employee
Order by sex, first_name, last_name;

-- Find first 5 employee from the taable
select * 
from employee
limit 5;

-- Find first and last name of employee
select first_name, last_name
from employee;

-- FInd the forname and surnames names from all the employee
select first_name as Forename, last_name as Surname
from employee;

-- Find out all the different genders from employee
select distinct sex
from employee;

-- Find out all the different distnict employee id
select distinct branch_id
from employee;

-- Find out all the different distnict super_id
select distinct super_id
from employee;


-- --------------------------------------------------------------
--
--              FUnctions
--
-- -------------------------------------------------------------
-- Find the number of employee
select count(emp_id)
from employee;

-- find number of employee with supervisor
select count(super_id)
from employee;

-- Find the number of female employees. 
select count(emp_id)
from employee
where sex = 'F' AND birth_day > '1970-01-01';

-- Find the sum of salaries of all employees
Select sum(salary)
From employee;

-- Find the avergae of all the employees
Select AVG(salary)
From employee;

-- Find the avergae of M employees
Select AVG(salary)
From employee
Where sex ='M';

-- Find out how many female and male there are
Select count(sex)
From employee;

Select count(sex), sex
From employee;

Select count(sex), sex
From employee
Group by sex;

-- FInd the total sales of each salesman
Select sum(total_sales), emp_id
From works_with
Group by emp_id;

-- Now if we want to know, how much a client is spending with a branch
Select sum(total_sales), client_id
From works_with
Group by client_id;

-- ------------------------------------------
-- Wild cards 
-- is basically a way defying different patterns that we want to match specific pieces of data to. 
-- % = any # characters, _ = one character
-- ------------------------------------------

-- Find any client's who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

-- Find any branch suppliers who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label%';

-- Find any employee born on the 10th day of the month
SELECT *
FROM employee
WHERE birth_day LIKE '_____10%';

-- Find any clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%Highschool%';

-- ---------------------------------------------------
--                    UNION
-- A union is basically a speical operator which we can 
-- use to combine the result of multiple selected statements
-- into one. 
--
-- -----------------------------------------------------
-- Find a list of employee and branch names

select first_name
from employee;

select branch_name
from branch;

-- so to combine these two, we use UNION operator. 
select first_name
from employee
union 
select branch_name
from branch;
-- but the results comes in single column.
-- David
-- Jan
-- Michael
-- Angela
-- Kelly
-- Stanley
-- Josh
-- Andy
-- Jim
-- Corporate
-- Scranton
-- Stamford
-- so to join in this way, the select statements must have same number of columns and same data type. 
-- Now we use following one. 

SELECT employee.first_name AS Employee_Branch_Names
FROM employee
UNION
SELECT branch.branch_name
FROM branch;

-- Find a list of all clients & branch suppliers' names
SELECT client.client_name AS Non_Employee_Entities, client.branch_id AS Branch_ID
FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- Find a list of all money spent or earned by the company
select salary
from employee
union
select total_sales
from works_with;

-- ----------------------------------------------------------------------------------
--                            JOINS
-- Join is basically used to combine rows from two or more tables based on a related 
-- column between them.
--
-- ----------------------------------------------------------------------------------

-- Add the extra branch
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);
select * from branch;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

-- ---------------------------------------------------------------
--                         NESTED queries 
-- The nested queries is basically a query where we are going to be 
-- using multiple select statements in order to get a specific set of
-- information.
-- ----------------------------------------------------------------
-- Example: 1 Find names of the employees who have sold over
-- 30000 to a single client
Select works_with.emp_id
from Works_with
where works_with.total_sales > 30000;

-- Find names of all employees who have sold over 30,000
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
	SELECT works_with.emp_id
	FROM works_with
	WHERE works_with.total_sales > 30000
);

-- Example 2: Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID

select branch.branch_id
from branch
where branch.mgr_id =102
;

SELECT client.client_id, client.client_name
FROM client
WHERE client.branch_id = (
	SELECT branch.branch_id
	FROM branch
	WHERE branch.mgr_id = 102
	Limit 1 -- this is to give result if Michel is manager of multiple client. It is used when = is used.
);

 -- Example 3: Find all clients who are handles by the branch that Michael Scott manages
 -- Assume you DONT'T know Michael's ID
 SELECT employee.emp_id
FROM employee
WHERE employee.first_name = 'Michael' AND employee.last_name ='Scott'
LIMIT 1;

 SELECT client.client_id, client.client_name
 FROM client
 WHERE client.branch_id = (SELECT branch.branch_id
                           FROM branch
                           WHERE branch.mgr_id = (SELECT employee.emp_id
                                                  FROM employee
                                                  WHERE employee.first_name = 'Michael' AND employee.last_name ='Scott'
                                                  LIMIT 1));

-- Find the names of employees who work with clients handled by the scranton branch
SELECT works_with.emp_id
FROM works_with;
                         
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
                         SELECT works_with.emp_id
                         FROM works_with
                         )
AND employee.branch_id = 2;

-- Find the names of all clients who have spent more than 100,000 dollars
SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(works_with.total_sales) AS totals, client_id
                                FROM works_with
                                GROUP BY client_id) AS total_client_sales
                          WHERE totals > 100000
);

-- ----------------------------------------------------------------------------------
-- 'ON DELETE SET NULL' or 'Set NULL on delete' operator:
-- means that if a record in the parent table is deleted, then the corresponding 
-- records in the child table will have the foreign key fields set to NULL. The records 
-- in the child table will not be deleted in SQL Server.
-- ----------------------------------------------------------------------------------
-- Operator: 'ON DELETE CASCADE'
-- Use the ON DELETE CASCADE option to specify whether you want rows deleted in a child 
-- table when corresponding rows are deleted in the parent table. If you do not specify
-- cascading deletes, the default behavior of the database server prevents you from 
-- deleting data in a table if other tables reference it.
-- -------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------
--                     Triggers
-- In SQL Server, triggers are database objects, actually, a special kind of stored procedure,
-- which “reacts” to certain actions we make in the database. The main idea behind triggers is 
-- that they always perform an action in case some event happens. 
-- Types of SQL Triggers: In SQL Server, we have 3 groups of triggers, 
-- (1) DML (data manipulation language) triggers – We’ve already mentioned them, and they react to DML
--       commands. These are – INSERT, UPDATE, and DELETE
-- (2) DDL (data definition language) triggers – As expected, triggers of this type shall react to DDL
--       commands like – CREATE, ALTER, and DROP
-- (3) Logon triggers – The name says it all. This type reacts to LOGON events.
-- --------------------------------------------------------------------------------------

-- CREATE
--     TRIGGER `event_name` BEFORE/AFTER INSERT/UPDATE/DELETE
--     ON `database`.`table`
--     FOR EACH ROW BEGIN
-- 		-- trigger body
-- 		-- this code is applied to every
-- 		-- inserted/updated/deleted row
--     END;

CREATE TABLE trigger_test (
     message VARCHAR(100)
);

-- Now create trigger for any INSERT operator.
DELIMITER $$
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;

-- Insert a new employee to the employee table. 
INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

-- Test the trigger 
select * from trigger_test;

-- Check the modifed table
Select * from employee;

-- New Trigger --------------------------------
DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ;
INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

DELIMITER $$
CREATE
    TRIGGER my_trigger3 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
         IF NEW.sex = 'M' THEN
               INSERT INTO trigger_test VALUES('added male employee');
         ELSEIF NEW.sex = 'F' THEN
               INSERT INTO trigger_test VALUES('added female');
         ELSE
               INSERT INTO trigger_test VALUES('added other employee');
         END IF;
    END$$
DELIMITER ;
INSERT INTO employee
VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);
select * from trigger_test;

-- Check the modifed table
Select * from employee;

DROP TRIGGER my_trigger1;
DROP TRIGGER my_trigger2;
DROP TRIGGER my_trigger3;