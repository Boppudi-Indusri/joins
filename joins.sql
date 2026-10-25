 create table departments(dept_id int primary key,dept_name varchar(20),location varchar(20));
 
  create table employees(emp_id int primary key,
     first_name varchar(20),
     last_name varchar(20),
    dept_id int,
    salary decimal(10,2),
     foreign key(dept_id) references departments(dept_id));
     
 INSERT INTO Departments (dept_id, dept_name, location)
     VALUES
     (1, 'HR', 'Hyderabad'),
    (2, 'IT', 'Bangalore'),
    (3, 'Finance', 'Chennai'),
     (4, 'Marketing', 'Mumbai'),
     (5, 'Sales', 'Delhi');
     
 INSERT INTO Employees (emp_id, first_name, last_name, dept_id, salary)
     VALUES
     (101, 'Ravi', 'Kumar', 1, 30000),
     (102, 'Priya', 'Sharma', 2, 45000),
     (103, 'Arjun', 'Reddy', 3, 40000),
     (104, 'Sneha', 'Patel', 2, 35000),
    (105, 'Kiran', 'Rao', NULL, 25000);


select concat(e.first_name,' ',e.last_name) as full_name,
     d.dept_name,e.salary
     from employees e inner join departments d
     on e.dept_id=d.dept_id;
     
 select concat(first_name,' ',last_name) as full_name,
     d.dept_name,e.salary from employees e
     left join departments d
     on e.dept_id=d.dept_id;
     

 SELECT
        d.dept_name,
         COUNT(e.emp_id) AS employee_count,
         d.location
     FROM Employees e
     RIGHT OUTER JOIN Departments d
     ON e.dept_id = d.dept_id
     GROUP BY d.dept_id, d.dept_name, d.location;


SELECT
        e.emp_id,
         CONCAT(e.first_name, ' ', e.last_name) AS full_name,
         d.dept_id,
         d.dept_name,
         e.salary,
         d.location
     FROM Employees e
     LEFT JOIN Departments d
     ON e.dept_id = d.dept_id
    
     UNION
    
     SELECT
         e.emp_id,
         CONCAT(e.first_name, ' ', e.last_name) AS full_name,
         d.dept_id,
        d.dept_name,
         e.salary,
         d.location
     FROM Employees e
     RIGHT JOIN Departments d
     ON e.dept_id = d.dept_id;


     
 CREATE VIEW EmployeeDepartmentInfo AS
     SELECT
         e.emp_id,
         CONCAT(e.first_name, ' ', e.last_name) AS full_name,
         d.dept_name,
         e.salary
     FROM Employees e
     INNER JOIN Departments d
     ON e.dept_id = d.dept_id;
     
 SELECT * FROM EmployeeDepartmentInfo;
 
  SELECT
        dept_name,
         AVG(salary) AS average_salary
     FROM EmployeeDepartmentInfo
     GROUP BY dept_name;
     