CREATE OR ALTER PROCEDURE usp_AppointmentNew(@Id NUMERIC(6),@Doctor_Id VARCHAR(3),@Patient_Id VARCHAR(3),@Treatment_Id NVARCHAR(3),
@AppointmentDate DATE,@Duration NUMERIC(4),@Status CHAR(1))
AS 
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	INSERT INTO Appointment VALUES(@Id,@Doctor_Id,@Patient_Id,@Treatment_Id,@AppointmentDate,@Duration,@Status);
	COMMIT;
	END TRY
	BEGIN CATCH
			SELECT ERROR_MESSAGE() AS Error_Message;
			ROLLBACK;
		END CATCH
END;