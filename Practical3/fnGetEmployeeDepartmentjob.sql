CREATE OR ALTER FUNCTION fn_GetEmployeeDepartmentjob(@DepartmentId NUMERIC(2))
RETURNS TABLE
AS
RETURN (SELECT e.Id,e.EmployeeName,e.Job,e.Salary,d.DepartmentName,e.Commision FROM Department d
LEFT JOIN Employee e
ON d.Id=e.Department_Id
WHERE e.Department_Id=@DepartmentId);