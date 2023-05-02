--Queries related to functions, date, Joins, procedure, paging.
USE Excercise;
--Department table.
CREATE TABLE Department(Id NUMERIC(2) PRIMARY KEY,DepartmentName VARCHAR(15),Location VARCHAR(15));
INSERT INTO Department VALUES
(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','boston')
--Update table.
UPDATE Department SET Location='Boston' WHERE Id=40;
SELECT * FROM Department;
--Employee table.
CREATE TABLE Employee
(Id NUMERIC(4) PRIMARY KEY, EmployeeName VARCHAR(10),Job VARCHAR(10),ManagerId NUMERIC(4),
HireDate DATE,Salary NUMERIC(7,2),Commision NUMERIC(7,2),Department_Id NUMERIC(2) REFERENCES Department(Id));
INSERT INTO Employee VALUES
(7499,'Allen','Salesman',7698,'20-feb-81',1600,300,30),
(7521,'Ward','Salesman',7698,'22-feb-81',1250,500,30),
(7566,'jones','Manager',7839,'02-apr-81',2975,NULL,20),
(7654,'Martin','Salesman',7698,'28-sep-81',1250,1400,30),
(7698,'Blake','Manager',7839,'01-may-81',2850,NULL,30),
(7782,'Clark','Manager',7839,'09-jun-81',2450,NULL,10),
(7788,'Scott','Analyst',7566,'09-dec-82',3000,NULL,20),
(7839,'King','President',null,'17-nov-81',5000,NULL,10),
(7844,'Turner','Salesman',7698,'08-sep-81',1500,0,30),
(7876,'Adams','Clerk',7788,'12-jan-83',1100,NULL,20),
(7900,'James','Clerk',7698,'03-dec-81',950,NULL,30),
(7902,'Ford','Analyst',7566,'03-dec-81',30000,NULL,20),
(7934,'Miller','Clerk',7782,'23-jan-82',1300,NULL,10);
--Select all records.
SELECT * FROM Employee;
--Doctor table.
CREATE TABLE Doctor(Id VARCHAR(3) PRIMARY KEY CHECK (Id LIKE 'D%'),DoctorName VARCHAR(25),
DoctorCity VARCHAR(20) CHECK (DoctorCity IN('Anand','Baroda','Nadiad')),
Specialist VARCHAR(20) CHECK (Specialist in ('ENT','Dental','Ortho','Eye')));
INSERT INTO Doctor VALUES
('D01','Dharmendra Patel','Anand','ENT'),
('D02','Jinay Shah','Nadiad','Eye'),
('D03','Sonal Patel','Anand','Dental'),
('D04','Mehul Patel','Anand','ENT'),
('D05','Mahesh Patel','Baroda','Ortho'),
('D06','Neerav Parmar','Nadiad','Dental'),
('D07','Niraj Shah','Anand','Ortho'),
('D08','Mukesh Kotiya','Baroda','Eye');
--Patient table
CREATE TABLE Patient(Id VARCHAR(3) PRIMARY KEY CHECK(Id LIKE 'P%'),
PatientName VARCHAR(25),
BirthDate DATE CHECK(BirthDate<CONVERT(VARCHAR,GETDATE(),13)),
PatinetAddress VARCHAR(35),
Gender CHAR(1) CHECK(Gender IN ('F','M')) DEFAULT UPPER('M'));
--Rename Column name using inbuilt sp.
EXEC sp_rename 'Patient.PatinetName','PatientName'
INSERT INTO Patient VALUES
('P01','Rupal Patel','12-sep-98','Anand','F'),
('P02','Kalpesh shah','04-sep-99','Baroda','M'),
('P03','Kavita Joshi','23-oct-87','Surat','F'),
('P04','Sachin Pandya','04-feb-89','Anand','M'),
('P05','Brijisha Patel','15-mar-95','Nadiad','F'),
('P06','Mayank Shah','16-may-65','Baroda','M'),
('P07','Mitul Soni','27-aug-96','Anand','M'),
('P08','Krunal Pandya','20-jan-70','Rajkot','M'),
('P09','rinkal Bhatt','14-apr-95','Nasari','M'),
('P10','Pratik Solanki','22-june-87 14:45:40:180','Surat','M');
--Select all record from Patient
SELECT * FROM Patient
--Treatment table
CREATE TABLE Treatment(Id NVARCHAR(3) PRIMARY KEY CHECK(Id LIKE 'T%'),
TreatmentDetails NVARCHAR(50),Charges NUMERIC(5) CHECK(Charges>0));
INSERT INTO Treatment VALUES
('T01','Retina',1200),
('T02','Root Canal',400),
('T03','Sleep Apnea',600),
('T04','Glaucoma',1500),
('T05','Tonsil',200),
('T06','knee Replacement',500),
('T07','Ear Infection',400),
('T08','Spine',600),
('T09','Tooth Extraction',1000);
--Select all record from Treatment.
SELECT * FROM Treatment;
--Appointment table.
CREATE TABLE Appointment(Id NUMERIC(6) PRIMARY KEY,Doctor_Id VARCHAR(3) REFERENCES Doctor(Id) CHECK (Doctor_Id LIKE 'D%'),
Patient_Id VARCHAR(3) REFERENCES Patient(Id) CHECK(Patient_Id LIKe 'P%'),
Treatment_Id NVARCHAR(3) REFERENCES Treatment(Id) CHECK(Treatment_Id LIKE 'T%'),
AppointmentDate DATE,
Duration NUMERIC(4),
Status CHAR(1) CHECK(Status IN('C','I')));
INSERT INTO Appointment VALUES
(201801,'D02','P01','T01','01-dec-18',20,'C'),
(201802,'D03','P02','T02','12-oct-18',35,'C'),
(201803,'D04','P03','T03','26-dec-18',30,'I'),
(201804,'D08','P04','T04','01-jan-18',25,'C'),
(201805,'D01','P05','T05','11-sep-18',40,'C'),
(201806,'D05','P06','T06','23-sep-18',45,'C'),
(201807,'D04','P07','T07','16-jan-18',55,'I'),
(201808,'D07','P08','T08','12-nov-18',40,'I'),
(201809,'D06','P09','T09','18-nov-18',35,'C'),
(201810,'D04','P10','T03','03-jul-18',30,'I'),
(201811,'D01','P04','T05','01-dec-18',50,'C'),
(201812,'D07','P07','T08','30-oct-18',25,'I');
--Select all record from Appointment.
SELECT * FROM Appointment;
--Insert employee using stored procedure.
EXEC usp_EmployeeInsert @Id=7935,@EmployeeName='Miller',@Job='Clerk',@ManagerId=7782,@HireDate='23-JAN-82',@Salary=1300,@Commision=0,@Department_Id=10;
EXEC usp_EmployeeInsert @Id=7635,@EmployeeName='David',@Job='Analyst',@ManagerId=7566,@HireDate='25-MAR-82',@Salary=3000,@Commision=0,@Department_Id=20;
EXEC usp_EmployeeInsert @Id=7535,@EmployeeName='Saurabh',@Job='Manager',@ManagerId=7839,@HireDate='28-JAN-82',@Salary=2850,@Commision=0,@Department_Id=30;
EXEC usp_EmployeeInsert @Id=7735,@EmployeeName='Aakash',@Job='Salesman',@ManagerId=7698,@HireDate='22-FEB-82',@Salary=1250,@Commision=400,@Department_Id=30;
--Set new Apointment using stored procedure.
EXEC usp_AppointmentNew @Id=201813,@Doctor_Id='D01',@Patient_Id='P10',@Treatment_Id='T07',@AppointmentDate='15-JUL-18',@Duration=30,@Status='I';
EXEC usp_AppointmentNew @Id=201814,@Doctor_Id='D03',@Patient_Id='P02',@Treatment_Id='T09',@AppointmentDate='15-JUL-18',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=201815,@Doctor_Id='D05',@Patient_Id='P05',@Treatment_Id='T06',@AppointmentDate='15-JUL-18',@Duration=90,@Status='I';
EXEC usp_AppointmentNew @Id=202301,@Doctor_Id='D05',@Patient_Id='P05',@Treatment_Id='T06',@AppointmentDate='20-APR-23',@Duration=90,@Status=null;
EXEC usp_AppointmentNew @Id=202327,@Doctor_Id='D01',@Patient_Id='P05',@Treatment_Id='T07',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202311,@Doctor_Id='D01',@Patient_Id='P01',@Treatment_Id='T05',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202312,@Doctor_Id='D01',@Patient_Id='P02',@Treatment_Id='T07',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202313,@Doctor_Id='D01',@Patient_Id='P04',@Treatment_Id='T05',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202314,@Doctor_Id='D02',@Patient_Id='P03',@Treatment_Id='T04',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202315,@Doctor_Id='D02',@Patient_Id='P05',@Treatment_Id='T04',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202316,@Doctor_Id='D02',@Patient_Id='P09',@Treatment_Id='T04',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202317,@Doctor_Id='D03',@Patient_Id='P03',@Treatment_Id='T02',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202318,@Doctor_Id='D03',@Patient_Id='P10',@Treatment_Id='T02',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202319,@Doctor_Id='D04',@Patient_Id='P04',@Treatment_Id='T05',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202320,@Doctor_Id='D04',@Patient_Id='P02',@Treatment_Id='T05',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202321,@Doctor_Id='D05',@Patient_Id='P01',@Treatment_Id='T06',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202322,@Doctor_Id='D05',@Patient_Id='P04',@Treatment_Id='T08',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202323,@Doctor_Id='D05',@Patient_Id='P05',@Treatment_Id='T08',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202324,@Doctor_Id='D06',@Patient_Id='P07',@Treatment_Id='T02',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202325,@Doctor_Id='D07',@Patient_Id='P09',@Treatment_Id='T06',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
EXEC usp_AppointmentNew @Id=202326,@Doctor_Id='D07',@Patient_Id='P10',@Treatment_Id='T06',@AppointmentDate='21-APR-23',@Duration=60,@Status='I';
--View all information using multiple join
SELECT * FROM vw_TreatmentDeatil;
--View today's appointments.
SELECT * FROM vw_TreatmentDeatil WHERE AppointmentDate=CONVERT(DATE,GETDATE());
--View selected doctor appointments.
SELECT * FROM vw_TreatmentDeatil WHERE DoctorName LIKE 'Dharmendra%';
--View periculat treatment appointments.
SELECT * FROM vw_TreatmentDeatil WHERE TreatmentDetails LIKE 'Retina';
--View details of perticular employee
SELECT * FROM fn_GetEmployeedetail(7499);
SELECT * FROM fn_GetEmployeedetail(7566);
--Employee Group by according to department type.
SELECT * FROM fn_GetEmployeejobtype() ;
SELECT * FROM fn_GetEmployeejobtype() WHERE EmployeeCount<>0;
SELECT * FROM fn_GetEmployeejobtype() WHERE EmployeeCount>4;
--Availbale job position available in pericular department
SELECT * FROM fn_GetEmployeeDepartmentjob(10);
SELECT EmployeeName,Job,DepartmentName FROM fn_GetEmployeeDepartmentjob(20);
SELECT * FROM fn_GetEmployeeDepartmentjob(30);
--Paging queries
EXEC usp_GetCustomerData @SkipRows=10,@NextRows=10;
EXEC usp_GetCustomerData 20,10;
EXEC usp_GetCustomerData @SkipRows=40,@NextRows=40;
--Create tables with GUID and timestamp
CREATE TABLE Passbook(Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),TimeStampId TIMESTAMP,TransactionDate DATETIME,TransactionType VARCHAR(100) NOT NULL CHECK(TransactionType IN('CREDIT','DEBIT')),
Amount MONEY NOT NULL CHECK(Amount>0),Description VARCHAR(100));
INSERT INTO Passbook(TransactionDate,TransactionType,Amount,Description)VALUES
(CURRENT_TIMESTAMP,'CREDIT',15000,'From account 1234456789'),
(CURRENT_TIMESTAMP,'DEBIT',20000,'ATM BOB near ganesh gross'),
(CURRENT_TIMESTAMP,'DEBIT',10000,'From cheque @main branch'),
(CURRENT_TIMESTAMP,'CREDIT',15000,'From cash @sub branch'),
(CURRENT_TIMESTAMP,'CREDIT',15000,'From cheque @main branch');
SELECT * FROM Passbook;
--Get highest commission
SELECT * FROM Employee WHERE Commision IS NOT NULL ORDER BY Commision DESC;
SELECT * FROM fn_EmployeehighestCommision(1);
SELECT * FROM fn_EmployeehighestCommision(2);
SELECT * FROM fn_EmployeehighestCommision(3);
SELECT * FROM fn_EmployeehighestCommision(4);
SELECT * FROM fn_EmployeehighestCommision(DEFAULT);
--Get detail of doctor's appointment in a day.
SELECT d.DoctorName,COUNT(a.Patient_Id)Appointment FROM Doctor d
INNER JOIN Appointment a
ON d.Id = a.Doctor_Id 
WHERE a.AppointmentDate= CONVERT(DATE,'2023-04-20') 
GROUP BY d.DoctorName ORDER BY Appointment DESC;
--Get detail of doctor who have maximum appointment in a day.
SELECT * FROM fn_DoctorhighestAppointment(GETDATE());
SELECT * FROM fn_DoctorhighestAppointment('2023-04-20');
--Get details of doctor how earn till now.
SELECT a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON a.Id=c.Appointment_Id 
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC;
--Get details of doctor how much earn in month.
SELECT a.Doctor_Id,d.DoctorName,SUM(c.TreatmentFee)TreatmentFees FROM Doctor d
INNER JOIN Appointment a
ON d.Id=a.Doctor_Id
INNER JOIN Charges c
ON a.Id=c.Appointment_Id WHERE MONTH(a.AppointmentDate)='04'  AND YEAR(a.AppointmentDate)='2023'
GROUP BY a.Doctor_Id,d.DoctorName ORDER BY TreatmentFees DESC;
--Get detail of doctor who earn maximum in month.
SELECT * FROM fn_DoctorhighestEarn(01,2018);
SELECT * FROM fn_DoctorhighestEarn(04,2023);
--Get detail of doctor based on earning rank in current month.
Select * from fn_DoctorhighestEarnRankwise(3);
Select * from fn_DoctorhighestEarnRankwise(1);
Select * from fn_DoctorhighestEarnRankwise(2);
Select * from fn_DoctorhighestEarnRankwise(5);
--Create Charges table.
CREATE TABLE Charges(Id INT IDENTITY(1,1) PRIMARY KEY,CaseFee MONEY CHECK(CaseFee>0) NOT NULL,TreatmentFee MONEY CHECK(TreatmentFee>0),
Appointment_Id NUMERIC(6,0) NOT NULL REFERENCES Appointment(Id)); 
INSERT INTO Charges VALUES
(500,1200,201801),
(500,1800,201802),
(500,1900,201803),
(500,2200,201804),
(500,3300,201805),
(500,6600,201806),
(500,4800,201807),
(500,4500,201808),
(500,4000,201809),
(500,3400,201810),
(500,4600,201811),
(500,2400,201812),
(500,4900,201813),
(500,3200,202310),
(500,2000,202311),
(500,4200,202312),
(500,4900,202313),
(500,1800,202314),
(500,1600,202315),
(500,3500,202316),
(500,2400,202317),
(500,4100,202318),
(500,3300,202319),
(500,1900,202320),
(500,3400,202321),
(500,2800,202322),
(500,2500,202323),
(500,3200,202324),
(500,1300,202325),
(500,2100,202326),
(500,1300,202327);
--Temporary table
SELECT * INTO #Appointment FROM Appointment;
SELECT * FROM #Appointment;
SELECT * INTO ##Doctor FROM Doctor;
SELECT * FROM ##Doctor;
exec sp_who;
KILL 79;