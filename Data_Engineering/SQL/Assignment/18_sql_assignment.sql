--Write the SQL to create an index on hr.employees(department_id). Name the index (e.g. idx_emp_dept).
create index idx_emp_dept on hr.employees(department_id);
--Write the SQL to create a composite index on hr.employees that would help a query filtering by department_id and job_id together (e.g. WHERE department_id = 50 AND job_id = 'ST_CLERK').
create index idx_emp_dept_job on hr.employees(department_id,job_id);
--M1. Create index on hr.employees(department_id). 
create index idx_emp_dept on hr.employees(department_id);
--M2. Create index on hr.employees(salary).
create index idx_emp_sal on hr.employees(salary);
--M3. Create composite index (department_id, job_id).
create index idx_dept_id on hr.employees(department_id,job_id);
--M4. Create index on hr.employees(hire_date). 
create index idx_date on hr.employees(hire_date);
--M5. Create unique index on hr.employees(email).
create index idx_email on hr.employees(email);
--M6. When would index on department_id help? 
where department_id is used to fetch the result fastly
--M7. Name an index meaningfully. 
idx_emp_dept,idx_id_salary
--M8. Create index on hr.departments(department_id) — usually PK already has one. 
create index idx_deptid on hr.employees(department_id);
--M9. Why composite (department_id, job_id) order?
because left most column is used first while searching
--M10. When might index on low-cardinality column not help? 
when the column has very few distinct values
--M11. Create index for ORDER BY hire_date.
create index idx_hire_date on hr.employees(hire_date);
--M11. Create index for ORDER BY hire_date.
drop index idx_hire_date;
--M13. What type of index is default in Oracle?
btree is the default type of index in oracle
--M14. Index for WHERE salary > 5000.
select index idx_sal on hr.employees(salary);
--M15. Why not index every column?
storage cost increase
--M16. Composite index (job_id, department_id) — which predicates can use it?
create index idx_j_d on hr.employees(dapertment_id,job_id);
--M17. Create index on hr.departments(location_id) if used in JOIN
create index idx_dept_loc on hr.departments(location_id);
--M18. What is a covering index?
A Covering index is an index that contains all the columns needed for a query so the database can retrieve the result directly from the index without accessing the table
--M19. When does INSERT become slower? 
when more insert commands are executed
--M20. Index for COUNT(*) WHERE department_id = 50.
create index idx_dept on hr.employees(department_id);
--========================================================================
--H1. Design composite index for WHERE department_id = ? AND job_id = ? AND salary > ?.
create index idx_dept_job_sal on hr.employees(department_id,job_id,salary);
--H2. When would full table scan be chosen over index? 
if the query retrieves a large percentage of rows scanning the whole table is faster than using the index
--H3. Create function-based index UPPER(last_name) for case-insensitive search.
create index idx_upper_lastname on hr.employees(upper(last_name));
--H4. Explain index range scan for salary BETWEEN 5000 AND 10000
An index range scan occurs when the database uses an index to retrieve rows within a range of values
by scanning the index from start value to end value
--H5. Why might two separate indexes (department_id) and (job_id) be less efficient than one composite (department_id, job_id) for dept+job query?
Two separate index on department_id and job_id can be less efficient than one composite index for queries that filte on both columns
--H6. What is index skip scan?
An index skip scan is amethod where the databsse uses a composite index even when the first column is nit specified in the query
--H7. Create index for ORDER BY department_id, salary DESC.
create index idx_dept_sal on hr.employees(department_id,salary desc);
--H8. When to avoid index on column that is always used with function (e.g. TRUNC(hire_date))?
Avoid creating a normal index on the column if the column is always used with a function in queries
--H9. Monitor index usage (concept). 
index uasge monitoring means checking weather an index is usually used by queries or not
--H10. Partial index (Oracle: not standard) — concept: index only rows where condition.
A partial indec ia an index that includes only some rows of the table based on a condition instead of indexing all rows
--H11. Composite index (manager_id, department_id) — for which query? 
create index idx_manager_dept on hr.employees(manager_id,dpartment_id);
--H12. Why unique index on email?
beacuse email id will be unique for every person
--H13. Rebuild or coalesce index (concept).
used to recognize an index to improve performance and remove fragmentation
--H14. Index on (department_id, hire_date) for "earliest hire per department."
create index idx_dept_date on hr.employees(department_id,hire_date);
--H15. When might optimizer choose full scan despite index? 
the optimizer may choose a full table scan when an index exists is it estimats that scanning the whole table is faster
--H16. Create index for JOIN hr.employees e ON e.department_id = d.department_id.
create index idx_emp_dept on hr.employees(department_id);
--H17. Bitmap index (concept): when? 
low cardinality, data warehouse, read-heavy
--H18. Why not composite (salary, department_id) for WHERE department_id = 50?
leading column should be department_id for that predicate
--H19. Invisible index (Oracle): purpose. 
an Invisible Index is an index that exists in the database but is ignored by the optimizer when executing queries.
--H20. List indexes on hr.employees
select index_name,column_name from user_ind_columns where hr.employees='Employees';