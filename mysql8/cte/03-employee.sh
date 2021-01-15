. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 << EOL

create database if not exists mytest;
drop table if exists mytest.employees;


CREATE TABLE mytest.employees (
  id         INT PRIMARY KEY NOT NULL,
  name       VARCHAR(100) NOT NULL,
  manager_id INT NULL,
  INDEX (manager_id),
FOREIGN KEY (manager_id) REFERENCES mytest.employees (id)
);

INSERT INTO mytest.employees VALUES
(333, "Yasmina", NULL),  # Yasmina is the CEO (manager_id is NULL)
(198, "John", 333),      # John has ID 198 and reports to 333 (Yasmina)
(692, "Tarek", 333),
(29, "Pedro", 198),
(4610, "Sarah", 29),
(72, "Pierre", 29),
(123, "Adil", 692);


WITH RECURSIVE employee_paths (id, name, path) AS
(
  SELECT id, name, CAST(id AS CHAR(200))
    FROM mytest.employees
    WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, CONCAT(ep.path, ',', e.id)
    FROM employee_paths AS ep JOIN mytest.employees AS e
      ON ep.id = e.manager_id
)
SELECT * FROM employee_paths ORDER BY path;

WITH RECURSIVE employee_paths (id, name, path) AS
(
  SELECT id, name, CAST(id AS CHAR(200))
    FROM mytest.employees
    WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, CONCAT(ep.path, ',', e.id)
    FROM employee_paths AS ep JOIN mytest.employees AS e
      ON ep.id = e.manager_id
)
SELECT * FROM employee_paths 
where id = 29
ORDER BY path;

use mytest;
explain
WITH RECURSIVE employee_paths (id, name, path) AS
(
  SELECT id, name, CAST(id AS CHAR(200))
    FROM mytest.employees
    WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, CONCAT(ep.path, ',', e.id)
    FROM employee_paths AS ep JOIN mytest.employees AS e
      ON ep.id = e.manager_id
)
SELECT * FROM employee_paths 
where id = 29
ORDER BY path;

EOL
