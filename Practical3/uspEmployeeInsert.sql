CREATE OR ALTER PROCEDURE usp_EmployeeInsert(@Id NUMERIC(4), @EmployeeName VARCHAR(10),@Job VARCHAR(10),@ManagerId NUMERIC(4),
@HireDate DATE,@Salary NUMERIC(7,2),@Commision NUMERIC(7,2),@Department_Id NUMERIC(2))
AS 
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	INSERT INTO Employee VALUES(@Id,@EmployeeName,@Job,@ManagerId,@HireDate,@Salary,@Commision,@Department_Id);
	COMMIT;
	END TRY
	BEGIN CATCH
			SELECT ERROR_MESSAGE() AS Error_Message;
			ROLLBACK;
		END CATCH
END;


