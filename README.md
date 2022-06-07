# Bank-Database
 
Tables 
Branch ( Branch_ID PK, Branch_NAME, Branch_city, Branch_Manager )

Dept (Dept_ID PK , Branch_ID , Dept_NAME, Dept_Manager)

Employee ( Emp_ID PK, Branch_ID FK , Emp_F_NAME, Emp_L_NAME , Emp_gender, 
 Emp_date_of_birth, Emp_Add, Emp_PhoneNo, Emp_Salary, Dept_ID FK )
 
Client (C_ID PK, Branch_ID FK , C_F_NAME, C_L_NAME, C_gender, C_date_of_birth 
 C_Job, C_Add, C_PhoneNo, balance)
 
Functions and Procedures 

Raise_salary_by_ID (emp_id, percentage_of_increase)
Raise_salary_by_Dept (Dept_id, percentage_of_increase) 
Get_emp_info(emp_id)
Get_emp_info(name)
Get_client_info(client_id)
Get_client_info(client_name)
Get_client_info(client_job) #Search for all clients based on their jobs. 
Add_employee(f_name,l_name,…etc)
Add_client (f_name,l_name,…etc)
Remove_employee(emp_id)
Remove_client(client_id)
Withdraw_money (client_id, AmountOfMoney) # Check balance and then decide.
Save_money (client_id, AmountOfMoney) # Update the client balance by adding money

Views 
1- Retrieve IDs, full names, ages, and salaries for clients with balances greater than 100.000 
and those clients should be sorted Desc based on their balances.
2- Display only top three average salaries among departments and those departments.
3- Display branch names and the corresponding sum of balances for each branch, and those 
records should be sorted descendingly.

