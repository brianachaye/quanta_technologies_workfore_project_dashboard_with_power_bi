--project status

-- introduction of cte
WITH project_status AS (
SELECT
	project_id,
	project_name,
	project_budget,
	'upcoming' as status
FROM 
	projects
union all
select
	project_id,
	project_name,
	project_budget,
	'completed' as status
from completed_projects)

--employees table
SELECT
	employees.employee_id,
	employees.first_name,
	employees.last_name,
	employees.job_title,
	employees.salary,
	departments.Department_Name,		
	project_assignments.project_id,
	project_status.project_name,
	project_status.status
FROM employees
JOIN departments
ON employees.department_id = departments.Department_ID
JOIN project_assignments
ON project_assignments.employee_id = employees.employee_id
join project_status
on project_status.project_id = project_assignments.project_id