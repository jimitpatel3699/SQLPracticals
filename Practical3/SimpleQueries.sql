--Retrieve data from single table
SELECT * FROM Employee;
SELECT Id,EmployeeName FROM Employee;
SELECT * FROM Employee WHERE Department_ID NOT IN(20);
SELECT DISTINCT Job FROM Employee;
SELECT * FROM Employee WHERE EmployeeName LIKE 'J%';
SELECT * FROM Employee WHERE Commision IS NOT NULL;
SELECT * FROM Employee WHERE Department_Id =10 AND HireDate > '1981-09-01';
SELECT * FROM Employee WHERE Department_ID <> (20);
SELECT Id EmployeeID,EmployeeName Name,Job,ManagerId,HireDate,Salary,Commision,Department_ID FROM Employee;
SELECT Id,EmployeeName,Job,((Salary*12))AnnualSalary FROM Employee;
SELECT * FROM Employee WHERE EmployeeName LIKE 'J_n%';
SELECT * FROM Employee WHERE Job IN('clerk','Salesman','Analyst');
SELECT * FROM Employee WHERE Job='Clerk' AND EmployeeName LIKE 'J%';
SELECT * FROM Employee ORDER BY EmployeeName DESC;







