CREATE OR ALTER VIEW vw_TreatmentDeatil
AS
SELECT a.Id AS AppointmentId, d.DoctorName, p.PatientName, p.PatientAddress, p.Gender, t.TreatmentDetails,a.AppointmentDate
FROM Appointment a 
INNER JOIN Doctor d ON a.Doctor_Id = d.Id 
INNER JOIN Patient p ON a.Patient_Id = p.Id
INNER JOIN Treatment t ON a.Treatment_Id = t.Id;

SELECT * FROM vw_TreatmentDeatil;