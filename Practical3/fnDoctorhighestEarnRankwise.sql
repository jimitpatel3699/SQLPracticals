CREATE OR ALTER FUNCTION fn_DoctorhighestEarnRankwise(@N INT = 1)
RETURNS TABLE
AS
RETURN 
(SELECT a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON c.Appointment_Id=a.Id WHERE MONTH(a.AppointmentDate)=MONTH(GETDATE()) AND YEAR(a.AppointmentDate)=YEAR(GETDATE())
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC  OFFSET @N-1 ROWS FETCH NEXT 1 ROWS ONLY);

