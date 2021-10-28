--start challenge
select e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date

INTO retirement_titles
from employees as e
inner join titles as ti

on(e.emp_no=ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

select * from retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title


INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select * from unique_titles


select count (title),title
into retiring_titles
from unique_titles
group by title 
order by count desc;

--deliverable 2
select distinct on(emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibilty
from employees as e
inner join dept_emp as de
on(e.emp_no = de.emp_no)
inner join titles as ti
on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND (de.to_date = '9999-01-01');

select * from unique_titles