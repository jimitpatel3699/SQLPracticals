--Create table Department.
CREATE TABLE Department(Id INT PRIMARY KEY,DepartmentName VARCHAR(200) NOT NULL);
--Create table Employee.
CREATE TABLE Employee(Id INT PRIMARY KEY IDENTITY(1,1),
EmployeeName VARCHAR(20) NOT NULL,Department_Id INT REFERENCES Department(Id) NOT NULL,
Experience DECIMAL(3,1) CHECK(Experience>0),Salary MONEY);
--Alter table Employee.
ALTER TABLE Employee ADD CONSTRAINT CHK_Employee_Salary CHECK(Salary>0);
--Insert into Department.
INSERT INTO Department VALUES
(1,'Accounting'),
(2,'Research'),
(3,'Sales'),
(4,'Operations'),
(5,'Marketing'),
(6,'IT'),
(7,'Admin');
--Insert into Employee.
INSERT INTO Employee VALUES 
('John Smith', 3, 3.0, 50000.00),
('Jane Doe', 5, 1.5, 40000.00),
('Bob Johnson', 3, 9.0, 55000.00),
('Alice Green', 6, 7.0, 45000.00),
('Tom Wilson', 6, 2.0, 35000.00),
('Sarah Lee', 2, 12.0, 52000.00),
('Jack Smith', 1, 6.5, 42000.00),
('Emily Brown', 5, 7.0, 58000.00),
('Mike Johnson', 4, 4.0, 47000.00),
('Jessica Lee', 6, 3.5, 36000.00),
('David Miller', 1, 10, 51000.00),
('Jennifer Lee', 2, 7.5, 41000.00),
('Mark Wilson', 5, 9.0, 59000.00),
('Katie Johnson', 4, 5.5, 48000.00),
('Luke Brown', 6, 4.5, 37000.00),
('Paul Smith', 3, 7.0, 52000.00),
('Samantha Lee', 2, 6.5, 43000.00),
('Ryan Johnson', 5, 11.0, 60000.00),
('Ashley Brown', 4, 6.0, 49000.00),
('Oliver Wilson', 6, 5.0, 38000.00);
--Write a query display empid,empname and departmentname.
SELECT e.id,e.EmployeeName,d.DepartmentName FROM Department d
LEFT JOIN Employee e
ON d.Id = e.Department_Id;
--Write a query to display department wise employee count.
SELECT d.DepartmentName,COUNT(e.Department_Id) EmployeeCount FROM Department d
LEFT JOIN Employee e
ON d.Id = e.Department_Id 
GROUP BY d.DepartmentName;
--Write a query to display department wise maximum salary.
SELECT d.DepartmentName,MAX(e.Salary) MaximumSalary FROM Department d
INNER JOIN Employee e
ON d.Id = e.Department_Id 
GROUP BY d.DepartmentName ORDER BY MaximumSalary DESC;
--Write a query to display employee name in the ascending order of department name.
SELECT e.EmployeeName,d.DepartmentName FROM Department d
INNER JOIN Employee e
ON d.Id = e.Department_Id 
ORDER BY d.DepartmentName;
/*Write a query to display employeeName and grade where grade criteria is as below
if employee has more than 10 years of experience then grade is expert
if employee has experience between 7 to 10 years then its grade is advanced
if employee has experience between 5 to 7 years then its grade is intermediate
if employee has experience between 2 to 5 year then its grade is beginner
and for the rest of case display grade as novice.*/
SELECT EmployeeName,Experience,
	CASE 
	WHEN Experience > 10 THEN 'expert'
	WHEN Experience BETWEEN 7 AND 10 THEN 'advanced'
	WHEN Experience BETWEEN 5 AND 7 THEN 'intermediate'
	WHEN Experience BETWEEN 2 AND 5 THEN 'beginner'
	ELSE 'novice'
	END AS grade
FROM Employee;


