-- RETIREMENT AGE EMPLOYEES BY TITLE
-- JOIN employees AND titles TABLES, 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    tl.title,
    tl.from_date,
    tl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	      AND (tl.to_date = '9999-01-01')
		  ORDER BY tl.emp_no ASC;  

SELECT * FROM retirement_titles

-- RETIREMENT AGE EMPLOYEES BY UNIQUE TITLE
-- JOIN employees AND titles TABLES, 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    tl.title
INTO unique_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	      AND (tl.to_date = '9999-01-01')
		  ORDER BY tl.emp_no ASC;  

SELECT * FROM unique_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles_2
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC;

SELECT * FROM unique_titles_2;

--Create table showing retiring employees by title
SELECT COUNT (*), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;


SELECT * FROM retiring_titles;

-- Create mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tl.title
INTO mentor_elig
FROM employees as e
JOIN dept_employees AS de
	ON de.emp_no = e.emp_no
JOIN titles AS tl
	ON tl.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND(de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

SELECT * FROM mentor_elig;