--String function
SELECT Id,UPPER(EmployeeName)EmployeeName,Salary FROM Employee;
SELECT Id,LOWER(EmployeeName)EmployeeName,Job FROM Employee WHERE Salary>300;
--Aggreigate function
SELECT MIN(Salary)MinimumSalary,MAX(Salary)MaximunSalary FROM Employee;
SELECT SUM(Salary)TotalSalary,AVG(Salary)AverageSalary FROM Employee;
SELECT SUM(Salary)TotalSalary,AVG(Salary)AverageSalary FROM Employee WHERE Department_Id=10;
SELECT COUNT(Id) EmployeeCount FROM Employee WHERE Department_Id BETWEEN 20 AND 30;
--Date function
SELECT Id,EmployeeName,Salary,CONVERT(VARCHAR,HireDate,106) HireDate FROM  Employee;
SELECT Id,EmployeeName,Job,Salary,FORMAT(HireDate,'dddd, MMMM, yyyy') FROM Employee;
SELECT * FROM Employee WHERE DATEPART(MONTH,HireDate)>9;
SELECT Id,EmployeeName,Commision FROM Employee Where FORMAT(HireDate,'dddd')='Monday';
SELECT DATEADD(DAY,15,GETDATE())After15Days;
SELECT * FROM Employee WHERE DATEDIFF(YEAR,HireDate,GETDATE()) >20;
