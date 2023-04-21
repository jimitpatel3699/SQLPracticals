CREATE OR ALTER FUNCTION fn_DoctorhighestEarn(@Month INT,@Year INT)
RETURNS TABLE
AS
RETURN 
(SELECT TOP 1 a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON c.Appointment_Id=a.Id WHERE MONTH(a.AppointmentDate)=@Month AND YEAR(a.AppointmentDate)=@Year
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC);

SELECT * FROM fn_DoctorhighestEarn(01,2018);