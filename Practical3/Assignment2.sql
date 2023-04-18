--Queries related to functions, date, Joins, group by..having, sub query.
USE Excercise;
--Department table
CREATE TABLE Department(Id NUMERIC(2) PRIMARY KEY,DepartmentName VARCHAR(15),Location VARCHAR(15));
INSERT INTO Department VALUES
(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','boston')
--Update table
UPDATE Department SET Location='Boston' WHERE Id=40;
SELECT * FROM Department;
--Employee table
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


