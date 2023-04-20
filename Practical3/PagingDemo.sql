--Pagination demo
--top clause
SELECT TOP 10 * FROM vw_TreatmentDeatil;
--ROW_NUMBER()
SELECT ROW_NUMBER() OVER(ORDER BY AppointmentId ) AS Rn,* FROM vw_TreatmentDeatil;
--CTE(column table expression)
--Select even rows from result set
WITH TempTreatment AS
(SELECT ROW_NUMBER() OVER(ORDER BY AppointmentId ) AS Rn,* FROM vw_TreatmentDeatil)
SELECT * FROM TempTreatment where Rn%2=0;
--Select odd rows from result set
WITH TempTreatment AS
(SELECT ROW_NUMBER() OVER(ORDER BY AppointmentId ) AS Rn,* FROM vw_TreatmentDeatil)
SELECT * FROM TempTreatment where Rn%2<>0;
--Select 10 rows
WITH TempTreatment AS
(SELECT ROW_NUMBER() OVER(ORDER BY AppointmentId ) AS Rn,* FROM vw_TreatmentDeatil)
SELECT * FROM TempTreatment where Rn BETWEEN 0 AND 10;
--Offset..Fetch.Next
SELECT * FROM vw_TreatmentDeatil ORDER BY AppointmentId
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
--Skip first 5 rows and return next 10 rows.
SELECT * FROM vw_TreatmentDeatil ORDER BY AppointmentId
OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;