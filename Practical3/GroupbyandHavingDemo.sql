--Group by and having queries 
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Patient;
--Total number of employee in each department
SELECT d.DepartmentName,COUNT(e.Id) AS EmployeeCount FROM Department d
LEFT JOIN Employee e
ON d.Id=e.Department_Id
GROUP BY d.DepartmentName;
--Display no of salesman clerk in each department
SELECT d.DepartmentName,COUNT(e.Id) Clerk_Salesman from Department d
INNER JOIN Employee e 
ON d.Id=e.Department_Id
WHERE e.Job='Clerk' or e.Job='Salesman'
GROUP BY d.DepartmentName 
--Display no of salesman clerk in each department individual
SELECT d.DepartmentName, COUNT(CASE WHEN e.Job = 'Clerk' THEN e.Id END) AS ClerkCount, 
COUNT(CASE WHEN e.Job = 'Salesman' THEN e.Id END) AS SalesmanCount
FROM Department d
LEFT JOIN Employee e ON d.Id = e.Department_Id
GROUP BY d.DepartmentName;
--Maximun salary in each department
SELECT d.DepartmentName,MAX(e.Salary)MaximunSalary from Department d
INNER JOIN Employee e
ON d.Id=e.Department_Id
GROUP BY d.DepartmentName;
--Display department wise average salary
SELECT d.DepartmentName,AVG(e.Salary)MaximunSalary from Department d
INNER JOIN Employee e
ON d.Id=e.Department_Id
GROUP BY d.DepartmentName;
--Display jobwise commision
SELECT Job,SUM(Commision) Commision FROM Employee  GROUP BY Job;
--Display total salary of clerk, analyst of each department
SELECT d.DepartmentName, SUM(CASE WHEN e.Job = 'Clerk' THEN e.Salary END) AS ClerkSalary, 
SUM(CASE WHEN e.Job = 'Analyst' THEN e.Salary END) AS AnalystSalary
FROM Department d
LEFT JOIN Employee e ON d.Id = e.Department_Id
GROUP BY d.DepartmentName;
--Select employee salary where department have >2 employee
SELECT d.DepartmentName,SUM(e.Salary)Salary FROM Department d
INNER JOIN Employee e
ON d.Id = e.Department_Id
GROUP BY d.DepartmentName HAVING COUNT(e.Department_Id)>2;
--Department ment having <2000 salary
SELECT d.DepartmentName,SUM(e.Salary)Salary FROM Department d
LEFT JOIN Employee e
ON d.Id = e.Department_Id
GROUP BY d.DepartmentName HAVING SUM(e.Salary)>2000;
--Display patients city wise
SELECT PatientAddress,COUNT(Id)NumberOfPatients FROM Patient GROUP BY PatientAddress;
SELECT PatientAddress,COUNT(Id)NumberOfPatients FROM Patient WHERE Gender LIKE 'M' GROUP BY PatientAddress;
SELECT MAX(Salary) FROM Employee WHERE Department_Id=10;