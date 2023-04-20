CREATE OR ALTER FUNCTION fn_GetEmployeejobtype()
RETURNS TABLE
AS
RETURN (SELECT d.DepartmentName,COUNT(Job) EmployeeCount FROM Department d
LEFT JOIN Employee e
ON d.Id=e.Department_Id
GROUP BY d.DepartmentName);