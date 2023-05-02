SELECT * FROM Appointment;
SELECT * FROM Charges;
SELECT * FROM Doctor;
SELECT * FROM Appointment a
--
INNER JOIN Doctor d
ON a.Doctor_Id=d.Id
INNER JOIN Charges c
ON a.Id=c.Appointment_Id;
--
SELECT  a.Doctor_Id,SUM(c.TreatmentFee)TreatmentFees FROM Appointment a
INNER JOIN Charges c
ON a.Id=c.Appointment_Id 
GROUP BY a.Doctor_Id ORDER BY TreatmentFees DESC;
--
SELECT a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON c.Appointment_Id=a.Id WHERE MONTH(a.AppointmentDate)='04'
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC;
--
SELECT TOP 1 a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON c.Appointment_Id=a.Id WHERE MONTH(a.AppointmentDate)='04'  AND YEAR(a.AppointmentDate)='2023'
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC;
--
SELECT TOP 1 a.Doctor_Id,SUM(c.TreatmentFee)TreatmentFees FROM Appointment a
INNER JOIN Charges c
ON a.Id=c.Appointment_Id WHERE MONTH(a.AppointmentDate)='04'
GROUP BY a.Doctor_Id ORDER BY TreatmentFees DESC;