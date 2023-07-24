--SOurce= Ishwar acadamy Youtube

--To create a database
create database employeeDB

--to use created database
use employeeDB

-- to create table

create table employee_info
(
	empID int primary key,
	empName varchar(20) not null,
	empSalary decimal(10,2) not null,
	job varchar(20),
	phoneNo varchar(20) unique,
	deptID int not null
);

-- to retrive data from table
select * from employee_info

create table department_info
(
	deptId int not null unique,
	deptName varchar(20) not null,
	deptLocation varchar(50)
)

--to insert data into table:
insert into employee_info values
(01,'adam',10000,'developer','9812312312',101)

--to insert data into table to specifice column:
insert into employee_info (empID,empName,empSalary,job,phoneNo,deptID)
values (02,'scott',13000,'QA','892547567',102)



--to retrive specific column
select empName,empID from employee_info			



--DML To update specifice cell 
update employee_info 
set job='Tester' 
where empName='scott'

select * from employee_info

update employee_info 
set job='sr. dev' 
where deptID='101'


update employee_info
set empSalary=empSalary+5000
where empName='adam'

select * from employee_info


insert into employee_info values
(3,'smith',19000,'QC','9960112211',103),
(4,'john',25000,'Admin','98735757',104),
(5,'dom',20000,'Data analyst','980658745',105)

select empName from employee_info
where empSalary>=15000

update employee_info
set empSalary=empSalary+500
where empName='smith'

select * from employee_info


--DML to delete specifice row from table:
delete from employee_info
where empID=5

--DML to retrive data from table"
select * from department_info

--DML to insert the data into table:
insert into department_info values
(101,'ELE', 'A'),
(102,'CSE','B'),
(103,'Mech','C')

--DML to delete table
delete from department_info



--ORDER BY CLAUSE:
select * from employee_info

--Arrange employee salary in descending order:
select * from employee_info
order by empSalary desc


--Arrange employee salary in ascending order:(we can use 'asc')
select * from employee_info
order by empSalary

-- Arrange employee name in asceding order.
select * from employee_info
order by empName

--Arrange employee name in descending order.
select * from employee_info
order by empName desc

--Creating new table
create table employeedetials
(	empID int primary key,
	empName varchar(50) not null,
	empSalary int not null,
	empPost varchar (20) not null,
	phoneNo varchar (20) not null,
	deptID int not null
);

select * from employeedetials

insert into employeedetials values
(101,'scott',15000,'dev','76876899',10),
(102,'jems',20000,'QA','8870986094',15),
(103,'john',21000,'dev','234987097',15),
(104,'dom',15000,'QA','686587887',10),
(105,'devid',15000,'BA','634586797',20),
(106,'rock',15000,'Designer','594467456',20)

--Display employee name which are from deptID 10 from employeedetails table:
select empName, deptID from employeedetials 
where deptID=10

--Display employee name which are from 'QA' from employeedetails table with empID:
select empID, empName,empPost from employeedetials
where empPost='QA'
order by empID asc

--Update employee salary by 5000 which are from QA post
update employeedetials 
set empSalary = empSalary+5000
where empPost='QA'

select * from employeedetials

--Delete row of designer post:
delete from employeedetials
where empPost='Designer'


--AGGREGATE FUNCTION OR GROUP FUNCTIONS:

--1. SUM(parameter)
select SUM(empSalary) as SumofSalary from employeedetials   --'as' is used to give a column name.

--2. MAX():
select MAX(empSalary) as MaximumSalary from employeedetials

--3. MIN():
select MIN(empSalary) as MinimumSalary from employeedetials;

--4. AVG():
select AVG(empSalary) as AverageSalary from employeedetials;

--5. COUNT():
select COUNT(empName) as Countemployees from employeedetials

--NUMERIC FUNCTIONS:
--1.ABS():It returns the absolute value of a number.
select ABS(-10)

--2.CEILING(): It returns the smallest integer value that is greater than or equal to a number.
select CEILING(19.78)			--> output: 20

--3.FLOOR(): It returns the largest integer value that is less than or equal to a number.
select FLOOR(45.75)				--> output: 45



----------------------------STRING FUNCTION-------------------------------------
select * from employeedetials

--show the lenght of the string:
select empName,LEN(empName) from employee_info

--convert the string into UPPERCASE:
select empName,UPPER(empName) from employee_info

--covert the string into LOWERCASE:
select empName, LOWER(empName) from employee_info

--LEFT TRIMMING string:
select LTRIM('         anystring')		--anystring

--RIGHT TRIMMING string:
select RTRIM('anystring     ')			--anystring

-- Select required string:
select SUBSTRING('microsoft',6,9)		--soft

-- Replace string with current:
select REPLACE('microsoft','micro','major')		--majorsoft

--Copy of string as many times:
select REPLICATE('dummy',5)				--dummydummydummydummydummy




-------------------Boolean Operator------------------------------
select * from employeedetials
--compairing two inputs

--AND operator:
select * from employeedetials where empName='scott' and phoneNo='76876899'		--101	scott	15000	dev	76876899	10
select * from employeedetials where empPost='QA' and deptID='15'			--102	jems	25000	QA	8870986094	15


--OR operator:
select * from employeedetials where empPost='QA' or deptID='15'		
--102	jems	25000	QA	8870986094	15
--103	john	21000	dev	234987097	15
--104	dom  	20000	QA	686587887	10


--NOT operator:
select * from employeedetials where not empPost='QA'
--101	scott	15000	dev	76876899	10
--103	john	21000	dev	234987097	15

select GETDATE() as current_date_and_time;		--2023-07-17 22:05:08.383

select SYSDATETIME()		--2023-07-17 22:06:23.8107097

select CURRENT_TIMESTAMP		--2023-07-17 22:07:00.013

select DATENAME(MONTH, CURRENT_TIMESTAMP) as month		--July
select DATENAME(DAY, CURRENT_TIMESTAMP) as day		--17
select DATENAME(YEAR, CURRENT_TIMESTAMP) as year	--2023

select DATEDIFF(YEAR,'september 3 1993', CURRENT_TIMESTAMP)	as Age_year	--30
select DATEDIFF(YEAR,'september 3 1993', 'july 10 2030')	as Age_year	--37

select DATEADD(YEAR,100,CURRENT_TIMESTAMP)		--2123-07-17 22:15:10.843
select DATEADD(MONTH,12,CURRENT_TIMESTAMP)		--2024-07-17 22:15:44.117

------------------------------------- GROUP BY CLAUSE-----------------------------------
select * from employeedetials
	
select deptID, SUM(empsalary) as sum_salary from employeedetials group by deptID

select deptID,AVG(empsalary) as avg_salary from employeedetials group by deptID


------------------------------------- COPY of table------------------------
create table data1
( ID int not null primary key,
Name varchar(50) not null
)

insert into data1 values
(101,'john'),
(102,'scott'),
(103,'devid')

create table data2
( ID int not null primary key,
Name varchar(50) not null
)


select * from data1
select * from data2

------------------------------DDL statements------------------
-- ALTER:
-- Modifies a table definition by adding,altering or dropping columns and constrains.
-- It also reassigns and rebuilds partitions or disables and enables constrain and trigger.

create table emp_info(ID int, name varchar(30))
select * from emp_info

-- Adding new column name as Salary without constraints:
alter table emp_info add salary decimal

select * from emp_info

-- Adding new column name as Phone without constrains:
alter table emp_info add phone int

--Adding new column name as address with constrains:
alter table emp_info add address varchar(50) unique

select * from emp_info

alter table emp_info add project int not null default 5

alter table emp_info add projectID int null constraint pID_unique unique

insert into emp_info values(101,'stive','10000',986897987,'pune',default,4)
insert into emp_info values(102,'scott','15000',986897987,'mumbai',8,null)

-- Adding more than one column with constraints defined with new column:
create table company_info(id int)

alter table company_info add 
revenue dec (10,2) null,
projectID int primary key

select * from company_info

-----------Drop-------

select * from employee_info

-- deleting column empName from table:
alter table employee_info drop column empName

-- deleting column deptID and Job from table:
alter table employee_info drop column job, deptID

-- deleting complete table:

drop table employee_info

-- changing the data type of a column:
select * from employeedetials

alter table employeedetials alter column deptID varchar(20)

--changing the size of the date type of column:
alter table employeedetials alter column deptID varchar(50)

--changing the data type and size of the column:
alter table employeedetials alter column deptID nvarchar(100)


------------------------Aliasing------------------------------------
select * from employeedetials

-- Changing the name of columns:
select empPost as POST from employeedetials


------------------------ Joins ---------------------------------------
-- used to retrive data from multiple tables.
-- 1. Inner Join
--2. Outer Join>> 1. Left outer join, 2. Right outer Join, 3. Full outer join.
--3. Cross Join.


--Inner join

select * from emp_info
select * from employeedetials

exec sp_rename 'emp_info.ID', 'empID', 'column'  --rename the ID to empID

select a.empID,b.empName,b.empPost from emp_info as a inner join employeedetials as b on a.empID=b.empID

select * from emp_info as a inner join employeedetials as b on a.empID=b.empID 

--Outer join

select * from emp_info
select * from employeedetials

--Left outer join: return 'all' rows from the left-hand table and records in the right-hand table with 'matching' values.
select * from emp_info as a left outer join employeedetials as b on a.empID=b.empID 

--Right outer join:Return 'all' rows from right hand-table and records in the left-hand table with matching values.
select * from emp_info as a right outer join employeedetials as b on a.empID=b.empID 

--Full Outer Join: Return 'all' rows from both left-hand and right-hand table with matching values.
select * from emp_info as a full outer join employeedetials as b on a.empID=b.deptID


-------------video no. 63 