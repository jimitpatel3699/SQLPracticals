CREATE OR ALTER FUNCTION fn_EmployeehighestCommision(@N INT = 1)
RETURNS TABLE
AS
RETURN (SELECT * FROM Employee ORDER BY Commision DESC OFFSET @N -1 ROWS FETCH NEXT 1 ROWS ONLY);