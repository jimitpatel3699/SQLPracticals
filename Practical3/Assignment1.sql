CREATE DATABASE Excercise;
--Customer table
CREATE TABLE Customer(Id VARCHAR(5),lastName CHAR(10),FirstName CHAR(10),Area VARCHAR(10),PhoneNumber NUMERIC(10));
INSERT INTO Customer VALUES
('a01','Patel','Ajay','Anand',3813343698),
('a02','Shah','Anajali','Surat',5560377896),
('a03','Thakkar','Vinay','Baroda',3726316541),
('a04','Joshi','Kamal','Suarat',6666121236),
('a05','Pandya','Rohan','Anand',null),
('a06','Patel','Kajal','Baroda',5125277896)
--Movie table
CREATE TABLE Movie(MovieNumber NUMERIC(5),Title VARCHAR(25),Type VARCHAR(10),Star VARCHAR(25),Price money);
INSERT INTO Movie VALUES
(1,'Hera Pheri','Comedy','Paresh Raval',105),
(2,'Kuch Kuch Hota Hai','Romantic','Kajol',225.00),
(3,'Drashyam','Suspemse','Ajay Devagan',250),
(4,'Welcome','Comedy','Anil Kapoor',200.00),
(5,'Gupt','Suspense','Bobby Deol',195),
(6,'Tere Naam','Romantic','Salman Khan',190),
(7,'Hungama','Comedy','Akshay Khanna',135),
(8,'Ajanabee','Suspense','Akshay Kumar',165),
(9,'No Entry','Comedy','Anil Kapoor',220),
(10,'Singham','Action','Ajay Devagan',195)
--Perform slect queries on table
SELECT * FROM Customer;
SELECT * FROM Movie;
SELECT FirstName,Area FROM Customer;
SELECT FirstName,lastName FROM Customer WHERE Id='a01' OR Id='a02';
SELECT * FROM Customer WHERE Id='a02' AND Area='Surat';
SELECT * FROM Customer WHERE PhoneNumber IS NULL;
SELECT * FROM Movie WHERE Price>200.00;
SELECT Title,Type FROM Movie WHERE Price BETWEEN 150 AND 200;
SELECT * FROM Movie WHERE Type IN('Comedy','Action');
SELECT * FROM Movie WHERE Type='Comedy' OR Type='Action';
SELECT * FROM Movie WHERE Type='Suspense' AND Price>180;
SELECT Title,Star,Price FROM Movie WHERE Type='Comedy';
SELECT DISTINCT Type FROM Movie;
SELECT Type FROM Movie GROUP BY Type;
SELECT * FROM Movie ORDER BY Title;
SELECT * FROM Movie ORDER BY Price desc;
SELECT * FROM Movie WHERE Type IN('Action','Romantic') AND Price<200;