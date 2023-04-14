--Create table department.
create table Department(Id int primary key,DepartmentName varchar(200));
--Create table Employee.
create table Employee(Id int primary key identity(1,1),
EmployeeName varchar(20) not null,Department_Id int references Department(Id),Experience decimal(3,1),
Salary money);
--Insert into department.
insert into Department values
(1,'Accounting'),
(2,'Research'),
(3,'Sales'),
(4,'Operations'),
(5,'Marketing'),
(6,'IT');
--Insert into Employee.
insert into Employee values 
('John Smith', 3, 3.0, 50000.00),
('Jane Doe', 5, 1.5, 40000.00),
('Bob Johnson', 3, 9.0, 55000.00),
('Alice Green', 6, 7.0, 45000.00),
('Tom Wilson', 6, 2.0, 35000.00),
('Sarah Lee', 2, 12.0, 52000.00),
('Jack Smith', 1, 6.5, 42000.00),
('Emily Brown', 5, 7.0, 58000.00),
('Mike Johnson', 4, 4.0, 47000.00),
('Jessica Lee', 6, 3.5, 36000.00),
('David Miller', 1, 10, 51000.00),
('Jennifer Lee', 2, 7.5, 41000.00),
('Mark Wilson', 5, 9.0, 59000.00),
('Katie Johnson', 4, 5.5, 48000.00),
('Luke Brown', 6, 4.5, 37000.00),
('Paul Smith', 3, 7.0, 52000.00),
('Samantha Lee', 2, 6.5, 43000.00),
('Ryan Johnson', 5, 11.0, 60000.00),
('Ashley Brown', 4, 6.0, 49000.00),
('Oliver Wilson', 6, 5.0, 38000.00);
--Write a query display empid,empname and departmentname.
select e.id,e.EmployeeName,d.DepartmentName from Department d
inner join Employee e
on d.Id = e.Department_Id;
--Write a query to display department wise employee count.
select d.DepartmentName,count(e.Department_Id) EmployeeCount from Department d
inner join Employee e
on d.Id = e.Department_Id 
group by d.DepartmentName;
--Write a query to display department wise maximum salary.
select d.DepartmentName,max(e.Salary) EmployeeCount from Department d
inner join Employee e
on d.Id = e.Department_Id 
group by d.DepartmentName;
--Write a query to display employee name in the ascending order of department name.
select e.EmployeeName from Department d
inner join Employee e
on d.Id = e.Department_Id 
order by d.DepartmentName;
/*Write a query to display employeeName and grade where grade criteria is as below
if employee has more than 10 years of experience then grade is expert
if employee has experience between 7 to 10 years then its grade is advanced
if employee has experience between 5 to 7 years then its grade is intermediate
if employee has experience between 2 to 5 year then its grade is beginner
and for the rest of case display grade as novice.*/

select * from Department d
inner join Employee e
on d.Id = e.Department_Id order by d.DepartmentName,e.Salary;
select * from Department,Employee;
select * from Employee order by Experience;
