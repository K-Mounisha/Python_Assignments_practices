-- M1. What does 1NF require? Hint: Atomic values; unique rows; no repeating groups.
each column must contain single value,no repeating groups 
-- M2. Why is department_name not in hr.employees? 
to avoid redundancy,hr.employees contains only department_id in department table department_name will be present
-- M3. Give an example of functional dependency in hr.employees. 
employee_id--> first_name in hr.employees
-- M4. What is partial dependency?
it is a functional dependency that occurs when a non key attribute depends on part of a composite primary key not on a whole key
-- M5. What is transitive dependency? 
a transitive dependency occurs when non key attribute depends on another non key attribute instead of depending directly on the primary key
-- M6. How does HR schema achieve 3NF for employees and departments?
Employees have department_id
-- M7. What would break 1NF in an employee table?
multiple values in one column
-- M8. Why store job_id in employees instead of job title?
job title depends on job id so job is is used
-- M9. What does 2NF require beyond 1NF?
no partial dependency
-- M10. Give an example of denormalization. 
storing department_name in employees for faster reports
-- M11. What is the primary key of hr.employees? 
employee_id
-- M12. What is the primary key of hr.departments?
department_id
-- M13. Why is manager_id in employees not a violation of 3NF?
it refers to another row
-- M14. If we added department_name to hr.employees, what anomaly could occur?
inconsistency if name changes
-- M15. What does "atomic" mean in 1NF?
single value per cell,no multi values or composite value in one column
-- M16. How does splitting into employees and departments reduce redundancy?
department name stored once per department
-- M17. When might you denormalize?
read heavy reporting acceptable redundancy and update strategy
-- M18. What dependency does department_id → department_name represent?
functional dependency in department table
-- M19. Why not store employee names in departments?
one dperatment has many employees 
-- M20. What is the benefit of 3NF? 
no transitive dependency each attribyte depends on only on the key
-- =======================================================================
-- H1. Decompose a table with columns (emp_id, emp_name, dept_id, dept_name) into 3NF.
(emp_id,emp_name,dept_id) as employee table
(dept_id,dept_name) as department table
-- H2. Explain why (employee_id, project_id, hours, project_name) might violate 3NF.
project_name depends on project_id
-- H3. Design a normalized schema for employees, departments, and locations (employees in departments, departments in locations). 
dept_id FK as employees
(dep_id,location_id fk)
(location_id) as locations
-- H4. When would 2NF matter? 
when the primary key is composite and an attribute depends only on project_id
-- H5. Give an example of update anomaly if department_name were in hr.employees.
changing department_name requires updating many rows data inconsistency may occur
-- H6. What is BCNF?
every determinant is a cadidate key stronger than 3nf
-- H7. Why might a reporting table be denormalized?
fewe joins,faster reads,reporting warehouse
-- H8. Identify functional dependencies in hr.departments.
department_id--> department_name,manager_id,location_id
-- H9. If we had (employee_id, skill_id, skill_name), is skill_name in 3NF?
skill name depends on skill id if skillid is non key, transitive dependency, split to skills
-- H10. How does HR schema avoid insertion anomaly for departments?
can insert department withno employees
-- H11. What is deletion anomaly?
deleting last employee in a department might remove department info if stored in same table
-- H12. Suggest 3NF tables for (order_id, customer_id, customer_name, product_id, product_name, qty).
oreders--order_id,customer_id)
customers--customer_id,customer_name
products=product_id,product_name
order_items=oder_id,product_id,qty
-- H13. Why is manager_id in hr.employees acceptable? 
foreign to employees not storing manager name only it stores reference
-- H14. What is multivalued dependency (4NF)? 
two independent multi-valued attributes and split to seperate tables
-- H15. Trade-off: normalized vs denormalized reporting table. 
normalized--no redundancy,more joins
denormalized--redundancy,faster reads,update cost
-- H16. In hr.employees, which attributes depend only on employee_id
first_name,last_name,email,hire_date,job_id,salary.commission_pct,manager_id,department_id
-- H17.If job_title were in hr.employees, what dependency would that create?
job_id-->job_id-->job_title transitive if job_id is non-key
-- H18. How do you fix a table that violates 2NF? 
remove attributes that depend on only part of the key but them in a table with that key partial
-- H19. Why might a data warehouse use denormalized star schema?
optimized for reads and analytics dimension and fact tables
-- H20. Draw dependency diagram for hr.departments (department_id as key).
department_id-->department_name,manager_id,location_id