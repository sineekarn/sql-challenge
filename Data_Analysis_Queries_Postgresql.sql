--### Data Analysis

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from public."Employees" as e
inner join public."Salaries" as s on
e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
select e.emp_no, e.first_name, e.last_name 
from public."Employees" as e
where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, dm.emp_no, dm.from_date, dm.to_date, e.last_name, e.first_name
from public."Departments" as d
inner join public."Dpt_Manager" as dm 
on d.dept_no=dm.dept_no
inner join public."Employees" as e 
on dm.emp_no=e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e 
left join public."Dpt_Emp" as de
on e.emp_no=de.emp_no
left join public."Departments" as d 
on de.dept_no=d.dept_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name
from public."Employees" as e
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e 
inner join public."Dpt_Emp" as de
on e.emp_no=de.emp_no
inner join public."Departments" as d 
on d.dept_no=de.dept_no
where dept_name = 'Sales';
           
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e 
inner join public."Dpt_Emp" as de
on e.emp_no=de.emp_no
inner join public."Departments" as d 
on d.dept_no=de.dept_no
where dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, count(last_name)
from public."Employees" as e
group by last_name
order by "count" desc;