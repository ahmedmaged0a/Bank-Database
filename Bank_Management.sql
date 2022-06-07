CREATE DATABASE Bank;
GO
use Bank;
GO

-- Branch Table --
CREATE TABLE tblBranch 
(
	branch_id INT PRIMARY KEY,
	branch_name VARCHAR(30) NOT NULL,
	branch_city VARCHAR(20) NOT NULL,
	branch_manager INT
)

-- Department Table -- 
CREATE TABLE tblDept
(
	dept_id INT PRIMARY KEY,
	branch_id INT FOREIGN KEY REFERENCES tblBranch(branch_id), 
	dept_name VARCHAR(30),
	dept_manager INT

)

-- Employee Table --
CREATE TABLE tblEmployee
(
	emp_id INT PRIMARY KEY,
	branch_id INT FOREIGN KEY REFERENCES tblBranch(branch_id), 
	emp_first_name VARCHAR(20),
	emp_last_name VARCHAR(20),
	emp_gender VARCHAR(6),
	emp_date_of_birth DATE,
	emp_addr VARCHAR(30),
	emp_phone_number VARCHAR(11),
	emp_salary DECIMAL(8,2),
	dept_id INT FOREIGN KEY REFERENCES tblDept(dept_id)
)

-- Client Table --
CREATE TABLE tblClient
(
	client_id INT PRIMARY KEY,
	branch_id INT FOREIGN KEY REFERENCES tblBranch(branch_id),
	client_first_name VARCHAR(20),
	client_last_name VARCHAR(20),
	client_gender VARCHAR(6),
	client_date_of_birth DATE, 
	client_job VARCHAR(20),
	client_addr VARCHAR(30),
	client_phone_number VARCHAR(11),
	client_balance DECIMAL(10,2)
)


-- Add Foregin Keys Constraints -- 
ALTER TABLE tblBranch 
ADD FOREIGN KEY(branch_manager)
REFERENCES tblEmployee(emp_id) ON DELETE SET NULL;

ALTER TABLE tblDept 
ADD FOREIGN KEY(dept_manager)
REFERENCES tblEmployee(emp_id) ON DELETE SET NULL;


-- Insert Branches Data -- 
INSERT INTO tblBranch VALUES(1,'Cairo Bank-Mansoura Branch', 'Mansoura', NULL);
INSERT INTO tblBranch VALUES(2,'Cairo Bank-Tanta Branch', 'Tanta', NULL);

-- Insert Branch1 Departments --
INSERT INTO tblDept VALUES(1,1,'Financial Department', NULL);
INSERT INTO tblDept VALUES(2,1,'IT Department', NULL);
INSERT INTO tblDept VALUES(3,1,'Corporate Banking Department', NULL);
INSERT INTO tblDept VALUES(4,1,'Credit Department', NULL);

-- Insert Branch2 Departments --
INSERT INTO tblDept VALUES(5,2,'Financial Department', NULL);
INSERT INTO tblDept VALUES(6,2,'IT Department', NULL);
INSERT INTO tblDept VALUES(7,2,'Corporate Banking Department', NULL);
INSERT INTO tblDept VALUES(8,2,'Credit Department', NULL);
INSERT INTO tblDept VALUES(9,2,'R&D Department', NULL);

--Insert Branch1, Dept1 Employees --
INSERT INTO tblEmployee VALUES(1,1,'Ahmed','Maged', 'male', '2000-9-25', 'Dekernes-Dakahlia-Egypt','0155931101', 6000.0, 1);
INSERT INTO tblEmployee VALUES(2,1,'Asmaa','Abdelrahman', 'female', '2000-8-25', 'Mansoura-Dakahlia-Egypt','01045236987', 3500.0, 1);

--Insert Branch1, Dept2 Employees--
INSERT INTO tblEmployee VALUES(3,1,'Mohamed','Mohey', 'male', '2000-11-9', 'Mansoura-Dakahlia-Egypt','01095947565', 5500.0, 2);
INSERT INTO tblEmployee VALUES(4,1,'Amr','Mohamed', 'male', '2000-8-9', 'Mansoura-Dakahlia-Egypt','01023654758', 3800.0, 2);

--Insert Branch1, Dept3 Employees--
INSERT INTO tblEmployee VALUES(5,1,'Ahmed','Mohamed', 'male', '2000-1-25', 'Mansoura-Dakahlia-Egypt','01058745896', 6500.0, 3);
INSERT INTO tblEmployee VALUES(6,1,'Mohsen','Youseff', 'male', '1999-2-20', 'Mansoura-Dakahlia-Egypt','01042356987', 4500.0, 3);

--Insert Branch1, Dept4 Employees--
INSERT INTO tblEmployee VALUES(7,1,'Abdulrahman','Sedky', 'male', '2000-3-10', 'Mansoura-Dakahlia-Egypt','01065425875', 5500.0, 4);
INSERT INTO tblEmployee VALUES(8,1,'Ali','Ahmed', 'male', '2000-2-10', 'Mansoura-Dakahlia-Egypt','01065425875', 4500.0, 4);

-- Branch1 Manager --
INSERT INTO tblEmployee VALUES(9,1,'Abdo','Hepish', 'male', '2000-11-10', 'Mansoura-Dakahlia-Egypt','01025456235', 8000.0, 4);



SELECT * FROM tblBranch;
SELECT * FROM tblDept;
SELECT * from tblEmployee;

-- Updating Department Managers after adding employees -- 
UPDATE tblDept SET dept_manager = 1 WHERE dept_id =1;
UPDATE tblDept SET dept_manager = 3 WHERE dept_id =2;
UPDATE tblDept SET dept_manager = 5 WHERE dept_id =3;
UPDATE tblDept SET dept_manager = 7 WHERE dept_id =4;


-- Update branch1 manager -- 
UPDATE tblBranch SET branch_manager = 9 WHERE branch_id = 1;

SELECT * from tblDept;
SELECT * FROM tblBranch;

--Insert Branch2, Dept1 Employees --
INSERT INTO tblEmployee VALUES(10,2,'Osama','Ahmed', 'male', '2000-6-25', 'Tanta-Gharbia-Egypt','0155931101', 5500.0,5 );
INSERT INTO tblEmployee VALUES(11,2,'Mohamed','Nader', 'male', '2000-4-20', 'Tanta-Gharbia-Egypt','01045872568', 4500.0, 5);

--Insert Branch2, Dept2 Employees --
INSERT INTO tblEmployee VALUES(12,2,'Ali','Ahmed', 'male', '2000-10-9', 'Tanta-Gharbia-Egypt','01025453685', 5200.0, 6);
INSERT INTO tblEmployee VALUES(13,2,'Amr','Ahmed', 'male', '2000-7-9', 'Tanta-Gharbia-Egypt','01042365874', 3900.0, 6);

--Insert Branch2, Dept3 Employees --
INSERT INTO tblEmployee VALUES(14,2,'Elsied','Mohamed', 'male', '1999-1-25', 'Tanta-Gharbia-Egypt','01058745896', 6500.0, 7);
INSERT INTO tblEmployee VALUES(15,2,'Mahmoud','Youseff', 'male', '1999-5-20', 'Tanta-Gharbia-Egypt','01052369874', 4200.0, 7);

--Insert Branch1, Dept4 Employees --
INSERT INTO tblEmployee VALUES(16,2,'Pitso','motsimany', 'male', '2000-4-10', 'Tanta-Gharbia-Egypt','01025345685', 6200.0, 8);
INSERT INTO tblEmployee VALUES(17,2,'Ahmed','Abdelkader', 'male', '2000-5-10', 'Tanta-Gharbia-Egypt','01052456328', 4600.0, 8);

-- Branch2 Manager --
INSERT INTO tblEmployee VALUES(18,2,'Mohamed','abdoelmoneim', 'male', '2000-10-10', 'Tanta-Gharbia-Egypt','01024568574', 8500.0, 5);


-- Updating Department Managers after adding employees -- 
UPDATE tblDept SET dept_manager = 10 where dept_id = 5;
UPDATE tblDept SET dept_manager = 12 where dept_id = 6;
UPDATE tblDept SET dept_manager = 14 where dept_id = 7;
UPDATE tblDept SET dept_manager = 16 where dept_id = 8;

-- Update branch2 manager -- 
UPDATE tblBranch SET branch_manager = 16 where branch_id = 2;


SELECT * from tblEmployee;
SELECT * from tblDept;
SELECT * from tblBranch;


-- Insert Bank Clients -- 
INSERT INTO tblClient VALUES (1,1, 'Mostafa', 'Ahmed', 'male', '1995-05-02', 'Accountant', 'Mansoura-Dakahlia-Egypt', '01026356985',80000.0);
INSERT INTO tblClient VALUES (2,1, 'Ayman', 'Mostafa', 'male', '1992-06-02', 'Electrical Engineer', 'Mansoura-Dakahlia-Egypt', '01025465875',120000.0);
INSERT INTO tblClient VALUES (3,1, 'Mohamed', 'Abdulrahman', 'male', '1993-07-02', 'Teacher', 'Mansoura-Dakahlia-Egypt', '01029687452',95000.0);
INSERT INTO tblClient VALUES (4,2, 'Nada', 'Ahmed', 'female', '1996-05-10', 'Doctor', 'Tanta-Gharbia-Egypt', '01036587452',200000.0);
INSERT INTO tblClient VALUES (5,2, 'Nader', 'Mohamed', 'male', '1993-05-02', 'Farmer', 'Tanta-Gharbia-Egypt', '01026356985',300000.0);
INSERT INTO tblClient VALUES (6,2, 'Eman', 'Ahmed', 'male', '1997-05-02', 'Nurse', 'Tanta-Gharbia-Egypt', '01025478596',70000.0);
INSERT INTO tblClient VALUES (7,2, 'Hany', 'Mohamed', 'male', '1998-05-02', 'Accountant', 'Tanta-Gharbia-Egypt', '01063439875',130000.0);


SELECT * from tblEmployee;
SELECT * from tblDept;
SELECT * from tblBranch;
SELECT * from tblClient;


-- Procedures --

GO

CREATE PROCEDURE Raise_salary_by_ID @emp_id int, @percentage_of_increase decimal(4,2) 
AS 
UPDATE tblEmployee SET emp_salary=emp_salary+ @percentage_of_increase/100 * emp_salary WHERE emp_id = @emp_id
GO

-- EXEC Raise_salary_by_ID 30,10 ; --



-- Raise_salary_by_Dept --
GO

CREATE PROCEDURE Raise_salary_by_Dept @Dept_id int, @percentage_of_increase  decimal(4,2) 
AS 
UPDATE tblEmployee SET emp_salary=emp_salary+ @percentage_of_increase/100 * emp_salary WHERE dept_id = @Dept_id
GO

SELECT * from tblEmployee;


-- EXEC Raise_salary_by_Dept 1,10; --


-- Get_emp_info --
GO

CREATE PROCEDURE Get_emp_info @emp_id int
AS 
SELECT * FROM tblEmployee WHERE emp_id = @emp_id;

GO

-- Get_emp_info 4; --

-- Get_emp_info_by_name -- 
GO

CREATE PROCEDURE Get_emp_info_by_name @emp_name varchar(20)
AS 
SELECT * from tblEmployee WHERE 
emp_first_name = SUBSTRING(@emp_name,0,CHARINDEX(' ',@emp_name))
AND
emp_last_name = SUBSTRING(@emp_name,CHARINDEX(' ',@emp_name)+1, LEN(@emp_name))

GO

EXEC Get_emp_info_by_name 'Mohamed Mohey'


-- Get_client_info(client_id) -- 
GO
CREATE PROCEDURE Get_client_info @client_id int
AS 
SELECT * FROM tblClient WHERE client_id = @client_id;

GO
EXEC Get_client_info 1;


-- Get_client_info(client_name) --
GO 

CREATE PROCEDURE Get_client_info_by_name @client_name varchar(20)
AS 
SELECT * from tblClient WHERE 
client_first_name = SUBSTRING(@client_name,0,CHARINDEX(' ',@client_name))
AND
client_last_name = SUBSTRING(@client_name,CHARINDEX(' ',@client_name)+1, LEN(@client_name))
GO 

-- EXEC Get_client_info_by_name 'Hany Mohamed';

-- Get_client_info(client_job) --
GO

CREATE PROCEDURE Get_client_info_by_job @client_job varchar(20)
AS 
SELECT * from tblClient WHERE client_job = @client_job
GO

Exec Get_client_info_by_job 'Accountant';


-- Add_employee(f_name,l_name,...etc) --
GO 

CREATE PROCEDURE Add_employee @emp_id int, @branch_id int , @emp_first_name varchar(20) ,
@emp_last_name varchar(20), @emp_gender varchar(6), @emp_date_of_birth Date, @emp_addr varchar(30),
@emp_phone_number varchar(11), @emp_salary decimal(8,2), @dept_id int
AS 
INSERT INTO tblEmployee VALUES(@emp_id,@branch_id,@emp_first_name,@emp_last_name, @emp_gender,@emp_date_of_birth,
@emp_addr,@emp_phone_number, @emp_salary, @dept_id);
GO


-- Exec Add_employee 30,2,'Ahmed','Abdo','male','2000-05-02', 'Tanta-Gharbia-Egypt','01095987456',2500.0, 8;



-- Add_client (f_name,l_name,...etc) --
 
GO

CREATE PROCEDURE Add_client @client_id int, @branch_id int , @client_first_name varchar(20) ,
@client_last_name varchar(20), @client_gender varchar(6), @client_date_of_birth Date, @client_job varchar(20), @client_addr varchar(30),
@client_phone_number varchar(11), @client_balance decimal(10,2)
AS 
INSERT INTO tblClient VALUES(@client_id,@branch_id,@client_first_name,@client_last_name, @client_gender,@client_date_of_birth
,@client_job, @client_addr,@client_phone_number,@client_balance);
GO 

EXEC Add_client 8,2,'Ahmed','Sameh', 'male', '1990-05-08', 'Doctor', 'Tanta-Gharbia-Egypt', '01098563251', 150000.0;

SELECT * from tblClient;


-- Remove_employee(emp_id) -- 
GO

CREATE PROCEDURE Remove_employee @emp_id int 
AS 
DELETE FROM tblEmployee WHERE emp_id = @emp_id
GO

EXEC Remove_employee 30;
SELECT * from tblEmployee;


-- Remove_client(client_id) --
GO

CREATE PROCEDURE Remove_client @client_id int 
AS 
DELETE FROM tblClient WHERE client_id = @client_id
GO

EXEC Remove_client 8;
SELECT * from tblClient;


-- Withdraw_money (client_id, AmountOfMoney) -- 
GO 

CREATE PROCEDURE Withdraw_money @client_id int, @AmountOfMoney decimal(10,2)
AS
DECLARE @client_current_balance decimal(10,2);
SELECT @client_current_balance=client_balance FROM tblClient WHERE client_id = @client_id;
if (@client_current_balance >= @AmountOfMoney)
BEGIN 
	UPDATE tblClient SET client_balance = client_balance - @AmountOfMoney WHERE client_id=@client_id;
END 
else
BEGIN
	print 'No Enough Balance'
END


SELECT * from tblClient WHERE client_id  = 6;
EXEC Withdraw_money 6, 5000.0
SELECT * from tblClient  WHERE client_id  = 6;


-- Save_money (client_id, AmountOfMoney) --

GO

CREATE PROCEDURE Save_money @client_id int, @AmountOfMoney decimal(10,2)
AS 
UPDATE tblClient SET client_balance = client_balance + @AmountOfMoney WHERE client_id = @client_id;
GO

--- Views ---

/*
 * Retrieve IDs, full names, ages, and salaries for clients with balances greater than 100.000 
 * and those clients should be sorted Desc based on their balances. 
*/
GO

CREATE VIEW vw_Client_Details
AS 

SELECT TOP 100 PERCENT client_id,
client_first_name + ' ' +client_last_name AS client_full_name,
DATEDIFF( YY,client_date_of_birth, GETDATE()) AS AGE
FROM tblClient  WHERE client_balance > 100000.0 ORDER BY client_balance DESC ;
GO

SELECT * from vw_Client_Details;


-- Display only top three average salaries among departments and those departments. -- 
GO

CREATE VIEW vw_TOP_AVG_Salaries
AS
SELECT TOP 3 AVG(tblEmployee.emp_salary) AS Dept_AVG_SALARY, tblDept.dept_name
FROM tblEmployee 
JOIN tblDept on tblEmployee.dept_id = tblDept.dept_id
GROUP BY tblDept.dept_name ORDER BY AVG(tblEmployee.emp_salary) DESC
GO

SELECT * from vw_TOP_AVG_Salaries;


-- Display branch names and the corresponding sum of balances --
GO

CREATE VIEW vw_Sum_Of_Balances
AS
SELECT TOP 100 percent tblBranch.branch_name, SUM(tblClient.client_balance) AS Balance_SUM
FROM tblClient
JOIN tblBranch ON tblClient.branch_id = tblBranch.branch_id
GROUP BY tblbranch.branch_name ORDER BY Balance_SUM DESC 
GO

SELECT * from vw_Sum_Of_Balances;



