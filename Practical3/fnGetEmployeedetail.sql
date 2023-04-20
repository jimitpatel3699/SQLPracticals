CREATE OR ALTER FUNCTION fn_GetEmployeedetail(@EmployeeId NUMERIC(4))
RETURNS TABLE
AS
RETURN (SELECT e.Id,e.EmployeeName,e.Job,e.ManagerId,e.HireDate,e.Salary,e.Commision,d.DepartmentName,d.Location from Department d
INNER JOIN Employee e
ON d.Id=e.Department_Id
WHERE E.Id=@EmployeeId);
