CREATE OR ALTER FUNCTION fn_DoctorhighestAppointment(@Date DATE)
RETURNS TABLE
AS
RETURN (SELECT TOP 1 d.DoctorName,COUNT(a.Patient_Id)Appointment FROM Doctor d
INNER JOIN Appointment a
ON d.Id = a.Doctor_Id WHERE a.AppointmentDate= @Date GROUP BY d.DoctorName ORDER BY Appointment DESC);